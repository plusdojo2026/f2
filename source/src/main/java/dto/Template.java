package dto;

import java.io.Serializable;

public class Template implements Serializable {
	private String sentence; // テンプレート文
	private int genre_no;//ジャンル番号

	//ジャンル番号のゲッター
	public int getGenre_no() {
		return genre_no;
	}
	
	//ジャンル番号のセッター
	public void setGenre_no(int genre_no) {
		this.genre_no = genre_no;
	}
	//テンプレート文のゲッター
	public String getSentence() {
		return sentence;
	}
	
	//テンプレート文のセッター
	public void setSentence(String sentence) {
		this.sentence = sentence;
	}
	
    //テンプレート文のコンストラクタ
	public Template(String sentence) {
		this.sentence = sentence;
	}
	//テンプレート文のデフォルトコンストラクタ
	public Template() {
		this.sentence = "";
	}
	
	//ジャンルナンバーのコンストラクタ
	public Template(int genre_no) {
		this.genre_no = genre_no;
	}
	
}