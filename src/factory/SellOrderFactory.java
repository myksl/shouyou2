package factory;


import dao.SellOrderProxy;

public class SellOrderFactory {
	private static SellOrderProxy proxy;
	
	public static SellOrderProxy getProxy() {
		return proxy;
	}

	public static void setProxy(SellOrderProxy proxy) {
		SellOrderFactory.proxy = proxy;
	}

	public static SellOrderProxy get(){
		return getProxy();
	}
}
