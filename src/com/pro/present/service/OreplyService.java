package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.OneBoardDao;
import com.pro.present.dto.MemberDto;

public class OreplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
			String mid = member.getMid();
			String obtitle = request.getParameter("obtitle");
			String obcontent = request.getParameter("obtitle");
			String obip = request.getRemoteAddr();
			int obgroup = Integer.parseInt(request.getParameter("obgroup"));			
			int obstep = Integer.parseInt(request.getParameter("obstep"));			
			String obgetname = request.getParameter("obgetname");			
			OneBoardDao oDao = OneBoardDao.getInstance();
			int result = oDao.reply(mid, obtitle, obcontent, obip, obgroup, obstep, obgetname);
			if(result == oDao.SUCCESS) {
				request.setAttribute("oReplyResult", "답변작성 성공");
			}else {
				request.setAttribute("oReplyResult", "답변작성 실패");				
			}
		}else {
			request.setAttribute("oReplyResult", "로그인 해주세요");
		}

	}

}
