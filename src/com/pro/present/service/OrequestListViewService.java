package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.FreeBoardDao;
import com.pro.present.dao.MemberDao;
import com.pro.present.dao.OneBoardDao;
import com.pro.present.dto.MemberDto;

public class OrequestListViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow + PAGESIZE -1;
		OneBoardDao oDao = OneBoardDao.getInstance();
		request.setAttribute("list", oDao.requestListBoard(mid, startRow, endRow));
		int requestTotalCnt = oDao.requestTotalCnt(mid);
		int requestPageCnt = (int)Math.ceil((double) requestTotalCnt/PAGESIZE);
		int requestStartPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE +1;
		int requestEndPage = requestStartPage + BLOCKSIZE -1;
		if(requestEndPage > requestPageCnt) {
			requestEndPage = requestPageCnt;
		}
		request.setAttribute("mid", mid);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", requestStartPage);
		request.setAttribute("endPage", requestEndPage);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageCnt", requestPageCnt);
	}
}
