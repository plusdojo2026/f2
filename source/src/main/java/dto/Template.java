package dto;

import java.io.Serializable;

public class Template implements Serializable {
	private String sentence; // テンプレート文
	private int genre_no;

	public int getGenre_no() {
		return genre_no;
	}

	public void setGenre_no(int genre_no) {
		this.genre_no = genre_no;
	}

	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public Template(String sentence) {
		this.sentence = sentence;
	}

	public Template(int genre_no) {
		this.genre_no = genre_no;
	}
	
	public Template() {
		this.sentence = "";
	}

}