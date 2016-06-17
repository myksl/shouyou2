package factory;

import dao.ProductProxy;


public class ProductFactory {
	private static ProductProxy proxy;
	
	public static ProductProxy getProxy() {
		return proxy;
	}

	public static void setProxy(ProductProxy proxy) {
		ProductFactory.proxy = proxy;
	}

	public static ProductProxy get() throws Exception{
		return getProxy();
	}
}
