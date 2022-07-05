package com.pro.present.dto;

import java.sql.Date;

public class FreeBoardDto {
	private int bno;
	private String mid;
	private String bmbti;
	private String btitle;
	private String bcontent;
	private String bfilename;
	private Date brdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private int blike;
	private String bip;
	private int bdeletemark;
	private String mname;
	private String mmbti;
	private int replycount;
	
	public FreeBoardDto() {
		// TODO Auto-generated constructor stub
	}
	
	public FreeBoardDto(int bno, String mid, String bmbti, String btitle, String bcontent, String bfilename,
			Date brdate, int bhit, int bgroup, int bstep, int bindent, int blike, String bip,
			int bdeletemark) {
		this.bno = bno;
		this.mid = mid;
		this.bmbti = bmbti;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfilename = bfilename;
		this.brdate = brdate;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.blike = blike;
		this.bip = bip;
		this.bdeletemark = bdeletemark;
	}
	public FreeBoardDto(int bno, String mid, String bmbti, String btitle, String bcontent, String bfilename,
			Date brdate, int bhit, int bgroup, int bstep, int bindent, int blike, String bip,
			int bdeletemark, String mname, String mmbti) {
		this.bno = bno;
		this.mid = mid;
		this.bmbti = bmbti;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfilename = bfilename;
		this.brdate = brdate;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.blike = blike;
		this.bip = bip;
		this.bdeletemark = bdeletemark;
		this.mname = mname;
		this.mmbti = mmbti;
	}
	
	

	public FreeBoardDto(int bno, String mid, String bmbti, String btitle, String bcontent, String bfilename,
			Date brdate, int bhit, int bgroup, int bstep, int bindent, int blike, String bip, int bdeletemark,
			String mname, String mmbti, int replycount) {
		this.bno = bno;
		this.mid = mid;
		this.bmbti = bmbti;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfilename = bfilename;
		this.brdate = brdate;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.blike = blike;
		this.bip = bip;
		this.bdeletemark = bdeletemark;
		this.mname = mname;
		this.mmbti = mmbti;
		this.replycount = replycount;
	}
	
	
	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBmbti() {
		return bmbti;
	}
	public void setBmbti(String bmbti) {
		this.bmbti = bmbti;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBfilename() {
		return bfilename;
	}
	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}
	public Date getBrdate() {
		return brdate;
	}
	public void setBrdate(Date brdate) {
		this.brdate = brdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getBindent() {
		return bindent;
	}
	public void setBindent(int bindent) {
		this.bindent = bindent;
	}
	public int getBlike() {
		return blike;
	}
	public void setBlike(int blike) {
		this.blike = blike;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public int getBdeletemark() {
		return bdeletemark;
	}
	public void setBdeletemark(int bdeletemark) {
		this.bdeletemark = bdeletemark;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMmbti() {
		return mmbti;
	}
	public void setMmbti(String mmbti) {
		this.mmbti = mmbti;
	}

	@Override
	public String toString() {
		return "FreeBoardDto [bno=" + bno + ", mid=" + mid + ", bmbti=" + bmbti + ", btitle=" + btitle + ", bcontent="
				+ bcontent + ", bfilename=" + bfilename + ", brdate=" + brdate + ", bhit=" + bhit + ", bgroup=" + bgroup
				+ ", bstep=" + bstep + ", bindent=" + bindent + ", blike=" + blike + ", bip=" + bip + ", bdeletemark="
				+ bdeletemark + ", mname=" + mname + ", mmbti=" + mmbti + "]";
	}
	
	
}
