package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.FreeBoardDao;
import com.pro.present.dao.MemberDao;
import com.pro.present.dao.OneBoardDao;
import com.pro.present.dto.MemberDto;

public class OresponseListViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// list.do 또는 list.do?pageNum=2 또는 list.do?pageNum=10
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
		request.setAttribute("list", oDao.responseListBoard(mid, startRow, endRow)); // 글목록
		int requestTotalCnt = oDao.responseTotalCnt(mid);
		int requestPageCnt = (int)Math.ceil((double) requestTotalCnt/PAGESIZE); // 페이지 갯수
		int requestStartPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE +1;
		int requestEndPage = requestStartPage + BLOCKSIZE -1;
		if(requestEndPage > requestPageCnt) {
			requestEndPage = requestPageCnt;
		}
		request.setAttribute("mid", mid);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE); // ★ 페이지 관련 항목
		request.setAttribute("startPage", requestStartPage);
		request.setAttribute("endPage", requestEndPage);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageCnt", requestPageCnt);
	}
}
