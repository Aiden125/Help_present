package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.OneBoardDao;

public class OmodifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int obno = Integer.parseInt(request.getParameter("obno"));
		String obtitle = request.getParameter("obtitle");
		String obcontent = request.getParameter("obcontent");
		String obip = request.getRemoteAddr();
		OneBoardDao oDao = OneBoardDao.getInstance();
		int result = oDao.modify(obno, obtitle, obcontent, obip);
		if(result == oDao.SUCCESS) {
			request.setAttribute("oModifyResult", "글 수정 성공");
		}else {
			request.setAttribute("oModifyResult", "글 수정 실패");
		}
	}

}
