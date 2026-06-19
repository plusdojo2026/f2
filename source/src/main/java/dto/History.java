package dto;

import java.io.Serializable;

public class History implements Serializable{
	private int user_no;
	private int word_no;
	
	public History(int user_no,int word_no) {
		this.user_no=user_no;
		this.word_no=word_no;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getWord_no() {
		return word_no;
	}
	public void setWord_no(int word_no) {
		this.word_no = word_no;
	}
	
	
}
