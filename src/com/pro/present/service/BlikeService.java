package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.FreeBoardDao;
import com.pro.present.dao.LikeBoardDao;

public class BlikeService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String mid = request.getParameter("mid");
		LikeBoardDao dao = LikeBoardDao.getInstance();
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		int result = dao.checkLike(mid, bno);
		if(result == 0) {
			dao.hitLike(mid, bno);
			fDao.bLikeUp(bno);
			fDao.hitDown(bno);
		}else {
			dao.deleteLike(mid, bno);
			fDao.bLikeDown(bno);
			fDao.hitDown(bno);
		}
	}
}
