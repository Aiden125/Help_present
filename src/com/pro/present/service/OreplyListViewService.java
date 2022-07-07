package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.OneBoardDao;

public class OreplyListViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int obgroup = Integer.parseInt(request.getParameter("obgroup"));
		OneBoardDao oDao = OneBoardDao.getInstance();
		request.setAttribute("replyList", oDao.replyListView(obgroup));
	}
}