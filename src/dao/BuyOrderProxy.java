package dao;

import java.util.List;

import vo.BuyOrder;
import vo.Product;

public class BuyOrderProxy {
	private static int SIZE = 6;
	private BuyOrderHow buyOrderHow ;
	
	public BuyOrderHow getBuyOrderHow() {
		return buyOrderHow;
	}
	public void setBuyOrderHow(BuyOrderHow buyOrderHow) {
		this.buyOrderHow = buyOrderHow;
	}
	public boolean doCreate(BuyOrder buyOrder) throws Exception {
		boolean flag = false;
		try {
			 buyOrderHow.doCreate(buyOrder);
		} catch (Exception e) {
			
		}
		flag = true;
		return flag;
		
	}
	public boolean delete(BuyOrder buyOrder) throws Exception {
		boolean flag = false;
		try {
			buyOrderHow.delete(buyOrder);
		} catch (Exception e) {
			
		}
		flag = true;
		return flag;
	}
	public BuyOrder findById(String s) throws Exception {
		BuyOrder buyOrder =null;
		try{
			buyOrder = buyOrderHow.findById(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(buyOrder!=null){
			return buyOrder;
		}else{
			return null;
		}
	}
	public List<BuyOrder> findByOwn(String s,int offset) throws Exception {
		offset = (offset-1)*SIZE;
		List<BuyOrder> list =null;
		try{
			list = buyOrderHow.findByOwn(s,offset,SIZE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int countByOwn(String s)throws Exception {
		int count = 0;
		count = (int) buyOrderHow.countByOwn(s);
		return count;
	}
}
