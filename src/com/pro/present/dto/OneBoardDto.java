package com.pro.present.dto;

import java.sql.Date;

public class OneBoardDto {
	private int obno;
	private String mid;
	private String obtitle;
	private String obcontent;
	private Date obrdate;
	private int obgroup;
	private int obstep;
	private String obip;
	private int obdeletemark;
	private String obgetname;
	private int obborn;
	private String obanswer;
	private String mname;
	
	public OneBoardDto() {
	}

	public OneBoardDto(int obno, String mid, String obtitle, String obcontent, Date obrdate, int obgroup, int obstep,
			String obip, int obdeletemark, String obgetname, int obborn, String obanswer, String mname) {
		this.obno = obno;
		this.mid = mid;
		this.obtitle = obtitle;
		this.obcontent = obcontent;
		this.obrdate = obrdate;
		this.obgroup = obgroup;
		this.obstep = obstep;
		this.obip = obip;
		this.obdeletemark = obdeletemark;
		this.obgetname = obgetname;
		this.obborn = obborn;
		this.obanswer = obanswer;
		this.mname = mname;
	}

	public int getObno() {
		return obno;
	}

	public void setObno(int obno) {
		this.obno = obno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getObtitle() {
		return obtitle;
	}

	public void setObtitle(String obtitle) {
		this.obtitle = obtitle;
	}

	public String getObcontent() {
		return obcontent;
	}

	public void setObcontent(String obcontent) {
		this.obcontent = obcontent;
	}

	public Date getObrdate() {
		return obrdate;
	}

	public void setObrdate(Date obrdate) {
		this.obrdate = obrdate;
	}

	public int getObgroup() {
		return obgroup;
	}

	public void setObgroup(int obgroup) {
		this.obgroup = obgroup;
	}

	public int getObstep() {
		return obstep;
	}

	public void setObstep(int obstep) {
		this.obstep = obstep;
	}

	public String getObip() {
		return obip;
	}

	public void setObip(String obip) {
		this.obip = obip;
	}

	public int getObdeletemark() {
		return obdeletemark;
	}

	public void setObdeletemark(int obdeletemark) {
		this.obdeletemark = obdeletemark;
	}

	public String getObgetname() {
		return obgetname;
	}

	public void setObgetname(String obgetname) {
		this.obgetname = obgetname;
	}

	public int getObborn() {
		return obborn;
	}

	public void setObborn(int obborn) {
		this.obborn = obborn;
	}

	public String getObanswer() {
		return obanswer;
	}

	public void setObanswer(String obanswer) {
		this.obanswer = obanswer;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Override
	public String toString() {
		return "OneBoardDto [obno=" + obno + ", mid=" + mid + ", obtitle=" + obtitle + ", obcontent=" + obcontent
				+ ", obrdate=" + obrdate + ", obgroup=" + obgroup + ", obstep=" + obstep + ", obip=" + obip
				+ ", obdeletemark=" + obdeletemark + ", obgetname=" + obgetname + ", obborn=" + obborn + ", obanswer="
				+ obanswer + ", mname=" + mname + "]";
	}
	
	
	
}
