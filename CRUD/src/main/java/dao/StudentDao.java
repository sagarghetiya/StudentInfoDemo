package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class StudentDao {
	
	public int createStudent(Student student) {
		Session sessionFactory = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction transaction = sessionFactory.beginTransaction();
			sessionFactory.save(student);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		finally {
			sessionFactory.close();
		}
		return 1;
	}
	
	@SuppressWarnings("deprecation")
	public Student getStudent(int rollNumber) {
		Session sessionFactory = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = sessionFactory.createCriteria(Student.class);
		criteria.add(Restrictions.eq("rollNumber", rollNumber));
		@SuppressWarnings("unchecked")
		List<Student> studentList = criteria.list();
		if(!studentList.isEmpty())
			return studentList.get(0);
		else
			return  null;
	}
}
