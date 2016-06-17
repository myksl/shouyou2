package dao;

import java.util.List;







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
	public List<BuyOrder> findByOwn(String s) throws Exception {
		return (List<BuyOrder>) getHibernateTemplate().find("select buyOrder from BuyOrder as buyOrder where own = ?", s);
	}
}
