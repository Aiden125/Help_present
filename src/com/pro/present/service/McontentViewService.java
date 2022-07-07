package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.MemberDao;
import com.pro.present.dto.MemberDto;

public class McontentViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
			String myid = member.getMid();
			request.setAttribute("myid", myid);
		}
		MemberDao mDao = MemberDao.getInstance();
		request.setAttribute("contentView", mDao.getMemberDto(mid));
	}
}
