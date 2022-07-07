package com.pro.present.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.MemberDao;
import com.pro.present.dto.MemberDto;

public class MmodifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mmbti = request.getParameter("mmbti");
		String memail = request.getParameter("memail");
		String mgender = request.getParameter("mgender");
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, mpw, mname, mbirth, mgender, memail, mmbti, null, 0, 0);
		int result = mDao.modifyMember(member);
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			request.setAttribute("modifyResult", "회원정보 수정 성공");
		}else {
			request.setAttribute("modifyResult", "회원정보 수정 실패");
		}
	}
}
