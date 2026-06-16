package dto;

import java.io.Serializable;

public class Template implements Serializable {
	private String sentence; // テンプレート文

	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public Template(String sentence) {
		this.sentence = sentence;
	}

	public Template() {
		this.sentence = "";
	}

}