package dao;

import java.util.List;












import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.BuyOrder;

public class BuyOrderHow extends HibernateDaoSupport implements BuyOrderDao{
	
	@Override
	public Integer doCreate(BuyOrder buyOrder) throws Exception {
		return (Integer) getHibernateTemplate().save(buyOrder);
	}
	@Override
	public void delete(BuyOrder buyOrder) throws Exception {
		getHibernateTemplate().delete(buyOrder);
	}
	@Override
	public BuyOrder findById(String s) throws Exception {
		return getHibernateTemplate().get(BuyOrder.class, new Integer(s));
	}
	@Override
	public List<BuyOrder> findByOwn(final String s,final int offset,final int size) throws Exception {
		return (List<BuyOrder>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public List<BuyOrder> doInHibernate(Session session) throws HibernateException {
				List<BuyOrder>  result = session.createQuery("select buyOrder from BuyOrder as buyOrder where own = ?")
						.setParameter(0, s).setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
		
	}
	@Override
	public long countByOwn(String s) throws Exception {
		return (Long)getHibernateTemplate().find("select count(*) from BuyOrder as buyOrder where own = ?", s).get(0);
	}
}
