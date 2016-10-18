package vo;

import java.util.regex.Pattern;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class Test {
	public static void a(){
		BeanFactory factory = new XmlBeanFactory(new FileSystemResource("D:\\Users\\lenovo\\workspace\\shouyou2\\WebContent\\WEB-INF\\applicationContext.xml"));
		Product product = (Product)factory.getBean(Product.class);
	}
	public static void main(String[] args) {
		a();
	}
}
