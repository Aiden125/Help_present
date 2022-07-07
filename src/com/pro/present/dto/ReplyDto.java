package com.pro.present.dto;

import java.sql.Date;

public class ReplyDto {
	private int rno;
	private String mid;
	private int bno;
	private String rcontent;
	private Date rrdate;
	private String rip;
	private String mname;
	
	public ReplyDto() {
	}

	public ReplyDto(int rno, String mid, int bno, String rcontent, Date rrdate, String rip, String mname) {
		this.rno = rno;
		this.mid = mid;
		this.bno = bno;
		this.rcontent = rcontent;
		this.rrdate = rrdate;
		this.rip = rip;
		this.mname = mname;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRrdate() {
		return rrdate;
	}

	public void setRrdate(Date rrdate) {
		this.rrdate = rrdate;
	}

	public String getRip() {
		return rip;
	}

	public void setRip(String rip) {
		this.rip = rip;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}



	
	
	
}
