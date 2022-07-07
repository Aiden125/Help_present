package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.FreeBoardDao;
import com.pro.present.dao.LikeBoardDao;
import com.pro.present.dao.MemberDao;
import com.pro.present.dao.MemberLikeDao;
import com.pro.present.dto.MemberDto;

public class MlikeService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mmyid = request.getParameter("mmyid");
		MemberLikeDao dao = MemberLikeDao.getInstance();
		if(mmyid.equals("")) {
			request.setAttribute("memberLikeResult", "로그인 해주세요");
		}else {
			int result = dao.checkLike(mid, mmyid);
			if(result == 0) {
				dao.hitLike(mid, mmyid);
			}else {
				dao.deleteLike(mid, mmyid);
			}			
		}
	}
}
