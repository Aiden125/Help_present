package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.MemberDao;

public class MidCheckService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.checkId(mid);
		if(result == MemberDao.FAIL) {
			request.setAttribute("idCheckResult", "중복된 아이디입니다");
		}else{
			request.setAttribute("idCheckResult", "사용가능한 ID입니다");
		}
	}

}
