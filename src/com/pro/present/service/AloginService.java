package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.AdminDao;
import com.pro.present.dto.AdminDto;

public class AloginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.adminLogin(aid, apw);
		if(result == aDao.SUCCESS) {
			HttpSession session = request.getSession();
			AdminDto admin = aDao.getAdminDto(aid);
			session.setAttribute("admin", admin);
		}else {
			
		}

	}

}
