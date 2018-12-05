package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class MessageDao {
	
	public int insertMessage(Message message) {
		Session sessionFactory = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction transaction = sessionFactory.beginTransaction();
			sessionFactory.save(message);
			transaction.commit();
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			sessionFactory.close();
		}
		return 1;
	}
	
	public int deleteMessage(int messageId) {
		Session sessionFactory = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction transaction = sessionFactory.beginTransaction();
			String hql = "from Message m where m.id = "+messageId;
			sessionFactory.delete(hql);
			transaction.commit();
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			sessionFactory.close();
		}
		return 1;
	}
	
	@SuppressWarnings("deprecation")
	public List<Message> getMessages(String toUser) {
		Session sessionFactory = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = sessionFactory.createCriteria(Message.class);
		criteria.add(Restrictions.eq("toUser", toUser));
		@SuppressWarnings("unchecked")
		List<Message> messageList = criteria.list();
		if (!messageList.isEmpty())
			return messageList;
		else
			return null;
	}
}
