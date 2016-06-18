package dao;

import java.util.List;









import org.hibernate.HibernateException;
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
	public List<Product> findByOwn(String s) {
		return (List<Product>)getHibernateTemplate().find("select product from Product as product where own = ?",
				s);
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
	public List<Product> findAllBT(final int offset,final int size) throws Exception {
		return(List<Product>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<Product> result = session.createQuery("select product from Product as product where own !=null and product.price between 300 and 500")
						.setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}
	@Override
	public List<Product> findAllUp(final int offset,final int size) throws Exception {
		return(List<Product>) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<Product> result = session.createQuery("select product from Product as product where own !=null order by product.price")
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
				List<Product> result = session.createQuery("select product from Product as product where own !=null ")
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
		return (Long) getHibernateTemplate().find("select count(*) from Product as product").get(0);
	}
	
	
}
