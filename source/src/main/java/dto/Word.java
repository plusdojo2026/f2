package dto;

import java.io.Serializable;

public class Word implements Serializable{
	private int word_no;
	private String word;
	private String pronounce;
	private String meaning;
	private int era_no;
	int genre_no;
	private int level;
	
	private String era_name;
	private String genre_name;
	
	
	public Word(int word_no, String word, String pronounce, String meaning, int era_no, int genre_no, int level,
			String era_name, String genre_name) {
		this.word_no = word_no;
		this.word = word;
		this.pronounce = pronounce;
		this.meaning = meaning;
		this.era_no = era_no;
		this.genre_no = genre_no;
		this.level = level;
		this.era_name = era_name;
		this.genre_name = genre_name;
	}
	
	public int getWord_no() {
		return word_no;
	}
	public void setWord_no(int word_no) {
		this.word_no = word_no;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getPronounce() {
		return pronounce;
	}
	public void setPronounce(String pronounce) {
		this.pronounce = pronounce;
	}
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	public int getEra_no() {
		return era_no;
	}
	public void setEra_no(int era_no) {
		this.era_no = era_no;
	}
	public int getGenre_no() {
		return genre_no;
	}
	public void setGenre_no(int genre_no) {
		this.genre_no = genre_no;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
	//erasテーブルとgenreテーブル分
	public String getEra_name() {
		return era_name;
	}
	public void setEra_name(String era_name) {
		this.era_name = era_name;
	}
	public String getGenre_name() {
		return genre_name;
	}
	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}
	
}
