package com.pro.present.dto;

public class LikeBoardDto {
	private int likeno;
	private String mid;
	private int bno;
	private int likecheck;
	public LikeBoardDto() {
	}
	public LikeBoardDto(int likeno, String mid, int bno, int likecheck) {
		this.likeno = likeno;
		this.mid = mid;
		this.bno = bno;
		this.likecheck = likecheck;
	}
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	
	
}
