package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.OneBoardDao;

public class OcontentViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int obno = Integer.parseInt(request.getParameter("obno"));
		int obgroup = Integer.parseInt(request.getParameter("obgroup"));
		OneBoardDao oDao = OneBoardDao.getInstance();
		request.setAttribute("oContentView", oDao.contentView(obno, obgroup));
		request.setAttribute("answerList", oDao.replyListView(obgroup));
	}
}
