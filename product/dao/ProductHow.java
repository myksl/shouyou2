package dao;

import java.util.List;














import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Product;

public class ProductHow extends HibernateDaoSupport implements ProductDao{
	
	@Override
	public Integer add(Product product) {
		return (Integer) getHibernateTemplate().save(product);
	}
	@Override
	public List<Product> findByOwn(final String s,final int offset,final int size) {
		return (List<Product>)getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<Product> result = session.createQuery("select product from Product as product where own = ?")
						.setParameter(0, s).setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}
	@Override
	public void update(Product product) throws Exception {
		getHibernateTemplate().update(product);
	}
	@Override
	public void delete(Product product) throws Exception {
		getHibernateTemplate().delete(product);
	}
	@Override
	public Product findById(String s) throws Exception {
		return getHibernateTemplate().get(Product.class, new Integer(s));

	}
	@Override
	public List<Product> findAllBT(final int offset,final int size,final int start,final int end) throws Exception {
		return(List<Product>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery("select product from Product as product where own !=null and price between ? and ?");
				query.setParameter(0, start);
				query.setParameter(1, end);
				List<Product> result =query	.setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}
	@Override
	public List<Product> findAllUp(final int offset,final int size) throws Exception {
		return(List<Product>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<Product> result = session.createQuery("select product from Product as product where own !=null order by price")
						.setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}
	@Override
	public List<Product> findAll(final int offset,final int size) throws Exception {
		return(List<Product>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<Product> result = session.createQuery("select product from Product as product where own !=null and remaining >0 ")
						.setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}
	@Override
	public List<Product> findByAccount(String s) throws Exception {
		return(List<Product>) getHibernateTemplate().find("select product from Product as product where account=?",s);
	}
	@Override
	public long count() throws Exception {
		return (Long) getHibernateTemplate().find("select count(*) from Product as product where own!=null and remaining >0").get(0);
	}
	@Override
	public List<Product> findByName(final int offset,final int size,final String s) throws Exception {
		return(List<Product>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<Product> result = session.createQuery("select product from Product as product where productName like ?")
						.setParameter(0, "%"+s+"%").setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}
	@Override
	public long countByOwn(String s) throws Exception {
		return (Long) getHibernateTemplate().find("select count(*) from Product as product where own =?",s).get(0);
	}
	public long countByBt(int start,int end){
		return (Long)getHibernateTemplate().find("select count(*) from Product as product where own !=null and price between ? and ?", start,end).get(0);
	}
	
}
