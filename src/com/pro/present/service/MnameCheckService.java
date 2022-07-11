package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.MemberDao;

public class MnameCheckService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mname = request.getParameter("mname");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.checkName(mname);
		if(result == MemberDao.FAIL) {
			request.setAttribute("nameCheckResult", "중복?�� ?��?��?��?��?��?��");
		}else{
			request.setAttribute("nameCheckResult", "?��?���??��?�� ?��?��?��?��?��?��");
		}
	}
}
