package dao;

import java.util.List;

import vo.Product;

public interface ProductDao {
	public Integer add(Product product)throws Exception;
	public void update(Product product)throws Exception;
	public void delete(Product product)throws Exception;
	public List<Product> findByOwn(String s,int offset, int size)throws Exception;
	public List<Product> findAllBT(int offset, int size, int start, int end) throws Exception;
	public Product findById(String s)throws Exception;
	public List<Product> findByName( int offset, int size, String s)throws Exception;
	public List<Product> findByAccount(String s)throws Exception;
	public List<Product> findAll( int offset, int size)throws Exception;
	public List<Product> findAllUp( int offset, int size)throws Exception;
	public long count()throws Exception;
	public long countByOwn(String s)throws Exception;
}
