package vo;

import java.util.regex.Pattern;

public class Test {
	public static void a(String s){
		Pattern p = Pattern.compile("敏感词");
		System.out.println(p.matcher(s).find());
	}
	public static void main(String[] args) {
		
	}
}
