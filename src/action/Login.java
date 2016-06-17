package action;

import vo.User;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserProxy;

public class Login extends ActionSupport{
	private String name;
	private String password;
	private String password2;
	private String phone;
	private String qq;
	private UserProxy userProxy;
	
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public UserProxy getUserProxy() {
		return userProxy;
	}
	public void setUserProxy(UserProxy userProxy) {
		this.userProxy = userProxy;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String register(){
		ActionContext context = ActionContext.getContext();
		context.getSession().put("User", name);
		return "success";
	}
	public String login(){
		ActionContext context = ActionContext.getContext();
		context.getSession().put("User", name);
		return "success";
	}
	
	public void validateLogin(){
		boolean flag = false;
		User user = null;
		user= new User();
		user.setName(name);
		user.setPassword(password); 
		try {
			if(userProxy.findById(name)==null){
				addFieldError("name", "用户不存在，请重新输入");
			}else {
				flag = userProxy.check(user);
				if(!flag){
					addFieldError("password", "密码不正确，请重新输入");
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void validateRegister(){
		try {
			if(userProxy.findById(name)!=null){
				addFieldError("name", "用户已存在，请重新输入");
			}else if(!(password.equals(password2))){
					addFieldError("password", "两次密码输入不一致");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}
