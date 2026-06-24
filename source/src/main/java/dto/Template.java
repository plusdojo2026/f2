package dto;

import java.io.Serializable;

public class Template implements Serializable {
	private String sentence; // テンプレート文
	private int genre_no;//ジャンル番号
	
	private String word;//Tenplatesテーブルにはない。jsp出力用に使用

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

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
	public Template(String word,String sentence) {
		this.word = word;
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