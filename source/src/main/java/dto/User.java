package dto;

import java.io.Serializable;

public class User implements Serializable{
	private int user_no;
	private String mail_add;
	private String password;
	
	public User(String mail_add,String password) {
		this.mail_add = mail_add;
		this.password = password;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getMail_add() {
		return mail_add;
	}
	public void setMail_add(String mail_add) {
		this.mail_add = mail_add;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
