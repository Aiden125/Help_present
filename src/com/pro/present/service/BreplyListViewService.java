package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.FreeBoardDao;

public class BreplyListViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int bgroup = Integer.parseInt(request.getParameter("bgroup"));
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		request.setAttribute("list", fDao.replyListView(bgroup));
	}
}
