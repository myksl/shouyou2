package dao;

import java.util.List;

import vo.BuyOrder;
import vo.Product;

public class BuyOrderProxy {
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
	public List<BuyOrder> findByOwn(String s) throws Exception {
		List<BuyOrder> list =null;
		try{
			list = buyOrderHow.findByOwn(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
