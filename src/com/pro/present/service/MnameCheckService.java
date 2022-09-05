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
			request.setAttribute("nameCheckResult", "중복된 닉네임입니다");
		}else{
			request.setAttribute("nameCheckResult", "사용가능한 닉네임입니다");
		}
	}
}
