package vo;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test1 {
	public StringBuilder get(String from){
		URL url =null;
		BufferedReader sys;
		StringBuilder str = null;
		try {
			url = new URL(from);
			InputStream is = url.openConnection().getInputStream();
			sys = new BufferedReader(new InputStreamReader(is));
			str =new StringBuilder();
			String s;
			while((s=sys.readLine())!=null){
				str.append(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}
	public void match(StringBuilder str){
		String name="" ;
		String price="";
		Pattern pattern = Pattern.compile("<li name=\"goodsItem\"(.+?)</li>");
		Matcher ma = pattern.matcher(str);
		while(ma.find()){
			Pattern p2 = Pattern.compile("<a href=(.+?)target=\"_blank\">【(.+?)</a>");
			Matcher ma2 = p2.matcher(ma.group());
			if(ma2.find()){
				name = ma2.group();
			}
			Pattern p3 = Pattern.compile("<span class=\"price\">(.+?)</span>");
			Matcher ma3 = p3.matcher(ma.group());
			if(ma3.find()){
				String s =ma3.group();
				s=s.replace("<span class=\"price\">", "");
				s=s.replace("</span>", "");
				price = s;
			}
			getMore(name, price);
		}
	}
	public void getMore(String name,String price){
		String nameT ="";
		String url ="";
		Pattern pattern = Pattern.compile(">【(.+?)<");
		Matcher ma = pattern.matcher(name);
		if(ma.find()){
			String s = ma.group();
			s = s.replace(">", " ");
			s = s.replace("<", " ");
			nameT = s;
		}
		Pattern pattern2 = Pattern.compile("<a href=\"(.+?)\"");
		Matcher ma2 = pattern2.matcher(name);
		if(ma2.find()){
			String s =ma2.group();
			s = s.replace("<a href=\"", "");
			s = s.replace("\"", "");
			url = s;
			getAll(get(url),nameT,price);
		}
		
	}
	public void getAll(StringBuilder str,String name,String price){
		String system="";
		String information="";
		String level="";
		Pattern pattern = Pattern.compile("<span class=\"title\">操作系统：</span>(.+?)<i");
		Matcher ma = pattern.matcher(str);
		if(ma.find()){
			String s = ma.group();
			s=s.replace("<span class=\"title\">操作系统：</span>	                    						            					            					                ", "");
			s=s.replace("					               <i", "");
			s=s.replace("&nbsp;- ", "-");
			system = s;
		}
		Pattern pattern3 = Pattern.compile("<span class=\"title\">角色等级：</span>(.+?)</p>");
		Matcher ma3 = pattern3.matcher(str);
		if(ma3.find()){
			String s = ma3.group();
			s=s.replace("<span class=\"title\">角色等级：</span>", "");
			s=s.replace("</p>", "");
			level = s;
		}
		Pattern pattern4 = Pattern.compile("<span class=\"title\">描述：</span>(.+?)</p>");
		Matcher ma4 = pattern4.matcher(str);
		if(ma4.find()){
			String s = ma4.group();
			s=s.replace("<span class=\"title\">描述：</span>", "");
			s=s.replace("</p>", "");
			information = s;
		}
		makeSql(name, price, information, system, level);
		
	}
	public void makeSql(String name,String price,String information,String system,String level){
		String sql = "";
		Random ran = new Random();
		int account =ran.nextInt(1000000);
		int password = ran.nextInt(1000000);
		sql ="insert into product(sellNumber,own,system,productName,game,level,price,account,remaining,password,information)"
				+ "  values('1','杨阳','"+system+"','"+name+"','问道','"+level+"',"+price+",'"+account+"','1','"+password+"','"+information+"');";
		System.out.println(sql);
	}
	public static void main(String[] args) {
		Test1 test = new Test1();
		for(int i =2;i<6;i++){
			test.match(test.get("http://www.jiaoyimao.com/g2789-c1461139305604597/s惊天动地-n"+i+".html"));
		}
	}
}
