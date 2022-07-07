package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.AdminDao;

public class AjoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		String aname = request.getParameter("aname");
		AdminDao aDao = AdminDao.getInstance();
		aDao.adminJoin(aid, apw, aname);
	}

}
