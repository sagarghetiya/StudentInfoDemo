package dao;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final SessionFactory sessionFactory;

	static {
		try {
			// Build a SessionFactory object from session-factory config
			// defined in the hibernate.cfg.xml file. In this file we
			// register the JDBC connection information, connection pool,
			// the hibernate dialect that we used and the mapping to our
			// hbm.xml file for each pojo (plain old java object).
			Configuration configuration = new Configuration();
			configuration.configure("hibernate.cfg.xml");
			configuration.addAnnotatedClass(dao.Student.class);
			configuration.addAnnotatedClass(dao.Message.class);
			configuration.addAnnotatedClass(dao.Login.class);
			StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties());
			sessionFactory = configuration.buildSessionFactory(ssrb.build());

		} catch (Throwable e) {
			System.err.println("Error in creating SessionFactory object." + e.getMessage());
			throw new ExceptionInInitializerError(e);
		}
	}

	/**
	 * A static method for other application to get SessionFactory object
	 * initialized in this helper class.
	 */
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}