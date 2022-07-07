package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.FreeBoardDao;

public class BmodifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		request.setAttribute("modifyView", fDao.contentView(bno));
	}
}
