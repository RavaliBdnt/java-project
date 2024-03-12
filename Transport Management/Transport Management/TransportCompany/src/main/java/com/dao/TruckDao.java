package com.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Admin;
import com.entities.Truck;
import com.utils.HibernateUtils;

public class TruckDao {

	public boolean installTruck(Truck truck) {
		Transaction tx = null;
		boolean f = false;
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			tx = session.beginTransaction();
			f = session.save(truck) != null;

			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			f = false;
		} finally {
			session.close();
		}

		return f;

	}

	public void updateTruck(int id, String name, String color, String truckNumber, String companyName,
			String purchaseDate, String imageFile) {
		Transaction tx = null;
		boolean f = false;
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {

			tx = session.beginTransaction();
			Truck truck = session.get(Truck.class,id);
			truck.setName(name);
			truck.setColor(color);
			truck.setTruckNumber(truckNumber);
			truck.setCompanyName(companyName);
			truck.setPurchaseDate(purchaseDate);
			truck.setImage(imageFile);
			session.update(truck);
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		
	}

	public List<Truck> getAllTrucks() {
		List<Truck> trucks = new ArrayList<Truck>();

		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			trucks = session.createQuery("from Truck").list();
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}

		} finally {
			session.close();
		}

		return trucks;
	}

	public Truck getTruckById(int id) {
		Truck truck = null;
		Transaction tx = null;
		try (Session session = HibernateUtils.getSessionFactory().openSession()) {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Truck where id=:id");
			query.setParameter("id", id);
			truck = (Truck) query.uniqueResult();
			tx.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return truck;
	}
	
	public List<Truck> getTruckByBranch(String branchName) {
		List<Truck> trucks = new ArrayList<Truck>();
		Transaction tx = null;
		try (Session session = HibernateUtils.getSessionFactory().openSession()) {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Truck where branchName=:branchName");
			query.setParameter("branchName", branchName);
			trucks = query.getResultList();
			tx.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return trucks;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Truck> searchByTruckName(String truckName) {
		List<Truck> trucks = new ArrayList<Truck>();

		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Truck where name=:name");
			query.setParameter("name", truckName);

			trucks = (List<Truck>) query.getResultList();
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();

		} finally {
			session.close();
		}

		return trucks;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Truck> searchByPerson(String name) {
		List<Truck> trucks = new ArrayList<Truck>();

		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Truck where installedBy=:installedBy");
			query.setParameter("installedBy", name);

			trucks = (List<Truck>) query.getResultList();
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();

		} finally {
			session.close();
		}

		return trucks;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Truck> searchByNumber(String number) {
		List<Truck> trucks = new ArrayList<Truck>();

		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Truck where truckNumber=:truckNumber");
			query.setParameter("truckNumber", number);

			trucks = (List<Truck>) query.getResultList();
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();

		} finally {
			session.close();
		}

		return trucks;
	}
	
	public boolean deleteTruckByid(int id) {
		boolean f = false;
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("delete from Truck where id=:id");
			q.setParameter("id", id);
			int j = q.executeUpdate();
			if(j==1) {
				f = false;
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		return f;
	}
	
	public int noOfTrucks() {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;
		int i = 0;  
		
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("SELECT COUNT(id) FROM Truck");
			i = q.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return i;
	}
	

}
