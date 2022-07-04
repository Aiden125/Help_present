package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.MemberDao;
import com.pro.present.dto.MemberDto;

public class MloginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.login(mid, mpw);
		if(result==MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			MemberDto member = mDao.getMemberDto(mid);
			session.setAttribute("member", member);
		}else {
			request.setAttribute("loginErrorMsg", "아이디 혹은 비밀번호를 확인하세요");
		}
	}

}
