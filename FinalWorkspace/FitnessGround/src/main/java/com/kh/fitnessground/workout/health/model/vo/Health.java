package com.kh.fitnessground.workout.health.model.vo;

public class Health {
	
	
	private int v_no;
	private String title;
	private String content;
	private String category1;
	private String category2;
	private String url;
	private int readcount;
	
	public Health() {
		super();
	}
	
	public Health(int v_no, String title, String content, String category1, String category2, String url,
			int readcount) {
		super();
		this.v_no = v_no;
		this.title = title;
		this.content = content;
		this.category1 = category1;
		this.category2 = category2;
		this.url = url;
		this.readcount = readcount;
	}
	public int getV_no() {
		return v_no;
	}
	public void setV_no(int v_no) {
		this.v_no = v_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "Health [v_no=" + v_no + ", title=" + title + ", content=" + content + ", category1=" + category1
				+ ", category2=" + category2 + ", url=" + url + ", readcount=" + readcount + "]";
	}
	
	
}
