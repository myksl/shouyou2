package action;

import vo.User;





import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserProxy;
import factory.UserFactory;
/** Struts2的Action类 负责用户的登录和注册
 *
 */
public class Login extends ActionSupport{
	private User user;
	private String name;
	private String password;
	private String password2;
	private String phone;
	private String qq;
	private UserProxy userProxy;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
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
		boolean flag = false;
		user.setState("ok");
		try {
			flag = UserFactory.get().doCreate(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext context = ActionContext.getContext();
		context.getSession().put("User", user.getName());
		if(flag){
			return "success";
		}
		return "success";
	}
	public String login(){
		ActionContext context = ActionContext.getContext();
		context.getSession().put("User", user.getName());
		return "success";
	}
	public String update(){
		try {
			user = userProxy.findById(user.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		}
		try {
			userProxy.update(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public void validateLogin(){
		boolean flag = false;
		try {
			if(userProxy.findById(user.getName())==null){
				addFieldError("name", "用户不存在，请重新输入");
			}else {
				flag = userProxy.check(user);
				if(!flag){
					addFieldError("user.password", "密码不正确，请重新输入");
				}else if(userProxy.findById(user.getName()).getState().equals("limit")){
					addFieldError("user.name", "您的账号涉嫌违规，已被封禁");
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void validateRegister(){
		try {
			if(userProxy.findById(user.getName())!=null){
				addFieldError("user.name", "用户已存在，请重新输入");
			}else if(!(user.getPassword().equals(password2))){
					addFieldError("user.password", "两次密码输入不一致");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void validateUpdate(){
		if(!user.getPassword().equals(password2)){
			addFieldError("user.password", "两次密码输入不一致");
		}
	}
}
