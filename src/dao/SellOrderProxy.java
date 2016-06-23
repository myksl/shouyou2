package dao;

import java.util.List;


import vo.SellOrder;

public class SellOrderProxy {
	private SellOrderHow sellOrderHow;
	private static int SIZE = 6;
	
	public SellOrderHow getSellOrderHow() {
		return sellOrderHow;
	}
	public void setSellOrderHow(SellOrderHow sellOrderHow) {
		this.sellOrderHow = sellOrderHow;
	}
	public boolean doCreate(SellOrder sellOrder) throws Exception {
		boolean flag = false;
		try {
			 sellOrderHow.doCreate(sellOrder);
		} catch (Exception e) {
			
		}
		flag = true;
		return flag;
	}
	public boolean delete(SellOrder sellOrder) throws Exception {
		boolean flag = false;
		try {
			 sellOrderHow.delete(sellOrder);
		} catch (Exception e) {
			
		}
		flag = true;
		return flag;
	}
	public SellOrder findById(String s) throws Exception {
		SellOrder sellOrder =null;
		try{
			sellOrder = sellOrderHow.findById(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(sellOrder!=null){
			return sellOrder;
		}else{
			return null;
		}
	}
	public List<SellOrder> findByOwn(String s,int offset) throws Exception {
		offset = (offset-1)*6;
		List<SellOrder> list =null;
		try{
			list = sellOrderHow.findByOwn(s,offset,SIZE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int countByOwn(String s)throws Exception {
		int count = 0;
		count = (int) sellOrderHow.countByOwn(s);
		return count;
	}
	
}
