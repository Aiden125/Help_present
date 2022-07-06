package com.pro.present.dto;

public class MemberLikeDto {
	private int likeno;
	private String mid;
	private String mmyid;
	private int likecheck;
	
	public MemberLikeDto() {
	}
	public MemberLikeDto(int likeno, String mid, String mmyid, int likecheck) {
		this.likeno = likeno;
		this.mid = mid;
		this.mmyid = mmyid;
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
	public String getMmyid() {
		return mmyid;
	}
	public void setMmyid(String mmyid) {
		this.mmyid = mmyid;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}

}
