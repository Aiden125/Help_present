package com.pro.present.dto;

import java.sql.Date;

public class MemberDto {
	private String mid;
	private String mpw;
	private String mname;
	private String mphoto;
	private Date mbirth;
	private String mgender;
	private String memail;
	private String mmbti;
	private Date mrdate;
	private int mlike;
	private int mwritecount;
	
	public MemberDto() {
	}

	public MemberDto(String mid, String mpw, String mname, String mphoto, Date mbirth, String mgender, String memail,
			String mmbti, Date mrdate, int mlike, int mwritecount) {
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mphoto = mphoto;
		this.mbirth = mbirth;
		this.mgender = mgender;
		this.memail = memail;
		this.mmbti = mmbti;
		this.mrdate = mrdate;
		this.mlike = mlike;
		this.mwritecount = mwritecount;
	}



	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public Date getMbirth() {
		return mbirth;
	}

	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMmbti() {
		return mmbti;
	}

	public void setMmbti(String mmbti) {
		this.mmbti = mmbti;
	}

	public Date getMrdate() {
		return mrdate;
	}

	public void setMrdate(Date mrdate) {
		this.mrdate = mrdate;
	}

	public int getMlike() {
		return mlike;
	}

	public void setMlike(int mlike) {
		this.mlike = mlike;
	}

	public int getMwritecount() {
		return mwritecount;
	}

	public void setMwritecount(int mwritecount) {
		this.mwritecount = mwritecount;
	}
	

	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mphoto=" + mphoto + ", mbirth="
				+ mbirth + ", mgender=" + mgender + ", memail=" + memail + ", mmbti=" + mmbti + ", mrdate=" + mrdate
				+ ", mlike=" + mlike + ", mwritecount=" + mwritecount + "]";
	}

	
}
