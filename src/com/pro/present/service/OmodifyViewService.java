package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.OneBoardDao;
import com.pro.present.dto.MemberDto;
import com.pro.present.dto.OneBoardDto;

public class OmodifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int obno = Integer.parseInt(request.getParameter("obno"));
		OneBoardDao oDao = OneBoardDao.getInstance();
		OneBoardDto dto = oDao.contentViewOnlyOne(obno);
		request.setAttribute("dto", dto);
	}
}
