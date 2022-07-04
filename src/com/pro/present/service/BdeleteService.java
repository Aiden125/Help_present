package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.FreeBoardDao;

public class BdeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		int result = fDao.delete(bno);
		if(result == fDao.SUCCESS) {
			request.setAttribute("deleteResult", "글삭제 성공");			
		}else {
			request.setAttribute("deleteResult", "글삭제 실패");
		}
	}
}
