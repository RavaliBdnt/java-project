package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Admin;
import com.utils.HibernateUtils;

public class AdminDao {

	public void createAdmin(Admin admin) {
		Transaction tx = null;
		try (Session session = HibernateUtils.getSessionFactory().openSession()) {

			tx = session.beginTransaction();

			session.save(admin);

			tx.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@SuppressWarnings("deprecation")
	public Admin login(String email,String password) { Admin admin = null;
	  Transaction tx =null; try(Session session =
	  HibernateUtils.getSessionFactory().openSession()) {
		  tx = session.beginTransaction();

		  Query query = session.createQuery("from Admin where email=:email and password=:password");
		  query.setParameter("email", email);
		  query.setParameter("password", password);
		  admin = (Admin) query.uniqueResult();
		  tx.commit();
		  session.close();
	  
	  } catch (Exception e) { 
		  e.printStackTrace();
	  }
	  return admin;
	  
	} 
	 
}
