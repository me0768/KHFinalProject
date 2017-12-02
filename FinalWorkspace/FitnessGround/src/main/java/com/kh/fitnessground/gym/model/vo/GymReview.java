package com.kh.fitnessground.gym.model.vo;

public class GymReview implements java.io.Serializable{
	private int gcno;
	private int gymno;
	private String content;
	private int rating;
	private String originalImage;
	private String renameImage;
	
	public GymReview(){}

	public GymReview(int gcno, int gymno, String content, int rating, String originalImage, String renameImage) {
		super();
		this.gcno = gcno;
		this.gymno = gymno;
		this.content = content;
		this.rating = rating;
		this.originalImage = originalImage;
		this.renameImage = renameImage;
	}

	public int getGcno() {
		return gcno;
	}

	public void setGcno(int gcno) {
		this.gcno = gcno;
	}

	public int getGymno() {
		return gymno;
	}

	public void setGymno(int gymno) {
		this.gymno = gymno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getOriginalImage() {
		return originalImage;
	}

	public void setOriginalImage(String originalImage) {
		this.originalImage = originalImage;
	}

	public String getRenameImage() {
		return renameImage;
	}

	public void setRenameImage(String renameImage) {
		this.renameImage = renameImage;
	}
	
	
	
}
