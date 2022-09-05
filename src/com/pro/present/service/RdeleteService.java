package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.ReplyDao;

public class RdeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		ReplyDao rDao = ReplyDao.getInstance();
		
		int result = rDao.deleteReply(rno);
		if(result == rDao.SUCCESS) {
			request.setAttribute("replyDeleteResult", "댓글삭제 성공");
		}else {			
			request.setAttribute("replyDeleteResult", "댓글삭제 실패");
		}
	}
}
