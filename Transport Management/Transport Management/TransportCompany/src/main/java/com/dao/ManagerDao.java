package com.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Manager;
import com.utils.HibernateUtils;

public class ManagerDao {
	
	
	public Manager loginManager(String email,String password) {
		Manager manager = null;
		Transaction tx = null;
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			tx = session.beginTransaction();
			  Query query = session.createQuery("from Manager where email=:email and password=:password");
			  query.setParameter("email", email);
			  query.setParameter("password", password);
			  manager = (Manager) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return manager;
	}

	public int addManager(Manager manager) {
		Transaction tx = null;
		
		try(Session session = HibernateUtils.getSessionFactory().openSession()){
			
			tx = session.beginTransaction();
			Serializable f = session.save(manager);
			System.out.println(f);
			int g = (int) f;
			if(g == 2) {
				System.out.println("ok");
			}else {
				System.out.println("oops something went wrong");
			}
			tx.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 2;
		
	}
	
	public List<Manager> getAllManager(){
		List<Manager> managers = new ArrayList<Manager>();
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			managers = session.createQuery("from Manager").list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return managers;
	}
	
	
}
