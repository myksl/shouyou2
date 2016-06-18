package dao;

import java.util.List;

import vo.Product;

public class ProductProxy {
	private ProductHow productHow ;
	
	public ProductHow getProductHow() {
		return productHow;
	}
	public void setProductHow(ProductHow productHow) {
		this.productHow = productHow;
	}
	public boolean add(Product product) {
		boolean flag = false;
		try{
			productHow.add(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		flag = true;
		return flag;
	}
	public List<Product> findByOwn(String s) {
		List<Product> list =null;
		try{
		list = productHow.findByOwn(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean update(Product product) throws Exception {
		boolean flag = false;
		try{
			 productHow.update(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		flag = true;
		return flag;
	}
	public boolean delete(Product product) throws Exception {
		boolean flag = false;
		try{
			 productHow.delete(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		flag = true;
		return flag;
	}
	public Product findById(String s) throws Exception {
		Product product =null;
		try{
			product = productHow.findById(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(product!=null){
			return product;
		}else{
			return null;
		}
	}
	
	public List<Product> findAll(int offset) throws Exception {
		offset = (offset-1)*6+1;
		List<Product> list =null;
		try{
		list = productHow.findAll(offset,6);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Product> findAllBT(int offset) throws Exception {
		offset = (offset-1)*6+1;
		List<Product> list =null;
		try{
		list = productHow.findAll(offset,6);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Product> findAllUp(int offset) throws Exception {
		offset = (offset-1)*6+1;
		List<Product> list =null;
		try{
		list = productHow.findAllUp(offset,6);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Product> findByAccount(String s) {
		List<Product> list =null;
		try{
		list = productHow.findByAccount(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int count(){
		int count= 0;
		try {
			count=(int) productHow.count();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
