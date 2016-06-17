package factory;

import dao.BuyOrderProxy;

public class BuyOrderFactory {
	private static BuyOrderProxy proxy ;
	
	public static BuyOrderProxy getProxy() {
		return proxy;
	}

	public static void setProxy(BuyOrderProxy proxy) {
		BuyOrderFactory.proxy = proxy;
	}

	public static BuyOrderProxy get(){
		return getProxy();
	}
}
