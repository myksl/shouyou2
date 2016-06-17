package dao;

import java.util.List;




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
	public List<Product> findAll() throws Exception {
		return(List<Product>) getHibernateTemplate().find("select product from Product as product where own !=null");
	}
	@Override
	public List<Product> findByAccount(String s) throws Exception {
		return(List<Product>) getHibernateTemplate().find("select product from Product as product where account=?",s);
	}
	
}
