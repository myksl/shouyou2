package dao;

import java.util.List;

import vo.BuyOrder;

public interface BuyOrderDao {
	public Integer doCreate(BuyOrder buyOrder)throws Exception;
	public List<BuyOrder> findByOwn(String s,int offset,int size)throws Exception;
	public BuyOrder findById(String s)throws Exception;
	public void delete(BuyOrder buyOrder)throws Exception;
	public long countByOwn(String s)throws Exception;
}
