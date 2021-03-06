package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.FreeBoardDao;
import com.pro.present.dao.LikeBoardDao;
import com.pro.present.dao.ReplyDao;
import com.pro.present.dto.MemberDto;

public class BcontentViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int bgroup = Integer.parseInt(request.getParameter("bgroup"));
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		ReplyDao rDao = ReplyDao.getInstance();
		LikeBoardDao lDao = LikeBoardDao.getInstance();
		request.setAttribute("freeBoard", fDao.contentViewAndHit(bno, bgroup));
		request.setAttribute("answerList", fDao.replyListView(bgroup));
		request.setAttribute("replyList", rDao.replyList(bno, bgroup));
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
			int result = lDao.checkLike(member.getMid(), bno);
			if(result == 0) {
				request.setAttribute("checkLikeStatus", 0);
			}else {
				request.setAttribute("checkLikeStatus", 1);
			}			
		}
	}
}