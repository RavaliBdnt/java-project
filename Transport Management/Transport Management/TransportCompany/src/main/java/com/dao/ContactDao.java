package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Contact;
import com.utils.HibernateUtils;



public class ContactDao {

	public void contactToManager(Contact contact) {
		Transaction tx = null;
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			tx = session.beginTransaction();
			session.save(contact);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	public List<Contact> getAllContact(){
		Session session = HibernateUtils.getSessionFactory().openSession();
		List<Contact> contacts = new ArrayList<Contact>();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			contacts = session.createQuery("from Contact").list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return contacts;
	}
}
