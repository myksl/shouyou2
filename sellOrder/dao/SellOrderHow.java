package dao;

import java.util.List;





import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.BuyOrder;
import vo.SellOrder;

public class SellOrderHow extends HibernateDaoSupport implements SellOrderDao{
	@Override
	public Integer doCreate(SellOrder sellOrder) throws Exception {
		return (Integer) getHibernateTemplate().save(sellOrder);
	}
	@Override
	public void delete(SellOrder sellOrder) throws Exception {
		getHibernateTemplate().delete(sellOrder);
	}
	@Override
	public SellOrder findById(String s) throws Exception {
		return getHibernateTemplate().get(SellOrder.class, new Integer(s));
	}
	@Override
	public List<SellOrder> findByOwn(final String s,final int offset,final int size) throws Exception {
		return (List<SellOrder>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public List<SellOrder> doInHibernate(Session session) throws HibernateException {
				List<SellOrder> result = session.createQuery("select sellOrder from SellOrder as sellOrder where own = ?")
						.setParameter(0, s).setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}
	@Override
	public long countByOwn(String s) throws Exception {
		return (Long)getHibernateTemplate().find("select count(*) from SellOrder as sellOrder where own = ?", s).get(0);
	}
}
