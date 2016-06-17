package dao;

import java.util.List;



import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

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
	public List<SellOrder> findByOwn(String s) throws Exception {
		return (List<SellOrder>) getHibernateTemplate().find("select sellOrder from SellOrder as sellOrder where own = ?",
				s);
	}
}
