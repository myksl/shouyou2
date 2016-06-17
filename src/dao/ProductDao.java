package dao;

import java.util.List;

import vo.Product;

public interface ProductDao {
	public Integer add(Product product)throws Exception;
	public List<Product> findByOwn(String ss)throws Exception;
	public void update(Product product)throws Exception;
	public void delete(Product product)throws Exception;
	public Product findById(String s)throws Exception;
	public List<Product> findByAccount(String s)throws Exception;
	public List<Product> findAll()throws Exception;
}
