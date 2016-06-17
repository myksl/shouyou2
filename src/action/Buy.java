package action;

import java.text.SimpleDateFormat;

import java.util.Date;





import dao.BuyOrderProxy;
import dao.ProductProxy;
import dao.SellOrderProxy;
import vo.BuyOrder;
import vo.Product;
import vo.SellOrder;

public class Buy {
	private String nowUser;
	private String own;
	private int listIndex;
	private String time;
	private String information;
	private String orderName;
	private int price;
	private int sellNumber;
	private int state;
	private String system;
	private int level;
	private String game;
	private String productListIndex;
	private int remaining;
	private SellOrderProxy sellOrderProxy;
	private BuyOrderProxy buyOrderProxy;
	private ProductProxy productProxy;
	private Product product;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public SellOrderProxy getSellOrderProxy() {
		return sellOrderProxy;
	}
	public void setSellOrderProxy(SellOrderProxy sellOrderProxy) {
		this.sellOrderProxy = sellOrderProxy;
	}
	public BuyOrderProxy getBuyOrderProxy() {
		return buyOrderProxy;
	}
	public void setBuyOrderProxy(BuyOrderProxy buyOrderProxy) {
		this.buyOrderProxy = buyOrderProxy;
	}
	public ProductProxy getProductProxy() {
		return productProxy;
	}
	public void setProductProxy(ProductProxy productProxy) {
		this.productProxy = productProxy;
	}
	public String getNowUser() {
		return nowUser;
	}
	public void setNowUser(String nowUser) {
		this.nowUser = nowUser;
	}
	public int getRemaining() {
		return remaining;
	}
	public void setRemaining(int remaining) {
		this.remaining = remaining;
	}
	public String getOwn() {
		return own;
	}
	
	public String getProductListIndex() {
		return productListIndex;
	}
	public void setProductListIndex(String productListIndex) {
		this.productListIndex = productListIndex;
	}
	public void setOwn(String own) {
		this.own = own;
	}
	public int getListIndex() {
		return listIndex;
	}
	public void setListIndex(int listIndex) {
		this.listIndex = listIndex;
	}
	public String getInformation() {
		return information;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSellNumber() {
		return sellNumber;
	}
	public void setSellNumber(int sellNumber) {
		this.sellNumber = sellNumber;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	public String buy(){
		boolean flag = false;
		Product product = null;
		try {
			product = productProxy.findById(productListIndex);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		SellOrder sellOrder = new SellOrder();
		sellOrder.setGame(product.getGame());
		sellOrder.setInformation(product.getInformation());
		sellOrder.setLevel(product.getLevel());
		sellOrder.setOrderName("<出售>"+product.getProductName());
		sellOrder.setOwn(product.getOwn());
		sellOrder.setPrice(product.getPrice());
		sellOrder.setSellNumber(product.getSellNumber()+1);
		sellOrder.setProductListIndex(productListIndex);
		//sellOrder.setState(state);
		sellOrder.setSystem(product.getSystem());
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		time= sdf.format(new Date());
		BuyOrder buyOrder = new BuyOrder();
		buyOrder.setGame(product.getGame());
		buyOrder.setPassword(product.getPassword());
		buyOrder.setProductListIndex(productListIndex);
		buyOrder.setAccount(product.getAccount());
		buyOrder.setInformation(product.getInformation());
		buyOrder.setLevel(product.getLevel());
		buyOrder.setOrderName("<购买>"+product.getProductName());
		buyOrder.setOwn(nowUser);
		buyOrder.setPrice(product.getPrice());
		buyOrder.setSellNumber(product.getSellNumber()+1);
		//buyOrder.setState(state);
		buyOrder.setSystem(product.getSystem());
		buyOrder.setTime(time);
		sellOrder.setTime(time);
		
		try {
			flag =buyOrderProxy.doCreate(buyOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!flag){
			return "fail";
		}
		try {
			flag = sellOrderProxy.doCreate(sellOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!flag){
			return "fail";
		}
		product.setRemaining(product.getRemaining()-1);
		product.setSellNumber(product.getSellNumber()+1);
		try {
			flag = productProxy.update(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
		
	}
}
