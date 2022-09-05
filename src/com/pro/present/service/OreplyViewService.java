package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.OneBoardDao;
import com.pro.present.dto.MemberDto;

public class OreplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
			String myid = member.getMid();
			int obno = Integer.parseInt(request.getParameter("obno"));
			OneBoardDao oDao = OneBoardDao.getInstance();
			request.setAttribute("myid", myid);
			request.setAttribute("replyView", oDao.contentViewOnlyOne(obno));
		}else {
			request.setAttribute("replyView", "로그인 해주세요");
		}
		
	}

}
