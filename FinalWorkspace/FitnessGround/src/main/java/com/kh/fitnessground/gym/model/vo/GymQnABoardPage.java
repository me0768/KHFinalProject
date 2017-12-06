package com.kh.fitnessground.gym.model.vo;

public class GymQnABoardPage {
	private int startRow;
	private int endRow;
	public GymQnABoardPage(){}
	public GymQnABoardPage(int currentPage, int limit){
		this.startRow = (currentPage -1) * limit + 1;
		this.endRow = startRow + limit - 1;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
}
