package com.utils;



import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.entities.Admin;
import com.entities.Contact;
import com.entities.Manager;
import com.entities.Truck;

public class HibernateUtils {

	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() {
		
		if(sessionFactory == null) {
			try{
				
				Configuration configuration = new Configuration();
				
				Properties p = new Properties();
				p.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
				p.put(Environment.URL,"jdbc:mysql://localhost:3306/transportcompany");
				p.put(Environment.USER, "root");
				p.put(Environment.PASS, "Meer@9860");
				p.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
				p.put(Environment.SHOW_SQL, true);
				p.put(Environment.HBM2DDL_AUTO, "update");
				configuration.setProperties(p);
				configuration.addAnnotatedClass(Admin.class);
				configuration.addAnnotatedClass(Manager.class);
				configuration.addAnnotatedClass(Truck.class);
				configuration.addAnnotatedClass(Contact.class);
				
				ServiceRegistry registry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();
				sessionFactory = configuration.buildSessionFactory();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return sessionFactory;
				
	}
	 
}
