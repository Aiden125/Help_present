package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.OneBoardDao;
import com.pro.present.dto.MemberDto;
import com.pro.present.dto.OneBoardDto;

public class OwriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member != null) {
			String mid = member.getMid();
			String obtitle = request.getParameter("obtitle");
			String obcontent = request.getParameter("obcontent");
			String obip = request.getRemoteAddr();
			String obgetname = request.getParameter("mname");
			// String mid =; 
			OneBoardDao oDao = OneBoardDao.getInstance();
			int result = oDao.writeOneBoard(mid, obtitle, obcontent, obip, obgetname);
			if(result == oDao.SUCCESS) {
				request.setAttribute("oWriteResult", "질문등록 성공");
			}else{
				request.setAttribute("oWriteResult", "질문등록 실패");			
			}
		}else {
			request.setAttribute("oWriteResult", "로그인 해주세요");
		}
	}
}
