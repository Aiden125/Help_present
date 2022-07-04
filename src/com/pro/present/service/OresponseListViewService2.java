package com.pro.present.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.present.dao.FreeBoardDao;
import com.pro.present.dao.MemberDao;
import com.pro.present.dao.OneBoardDao;
import com.pro.present.dto.MemberDto;

public class OresponseListViewService2 implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// list.do 또는 list.do?pageNum=2 또는 list.do?pageNum=10
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow + PAGESIZE -1;
		
		
		OneBoardDao oDao = OneBoardDao.getInstance();
		request.setAttribute("responseList", oDao.responseListBoard(member.getMid(), startRow, endRow)); // 글목록
		int responseTotalCnt = oDao.requestTotalCnt(member.getMid());
		int responsePageCnt = (int)Math.ceil((double) responseTotalCnt/PAGESIZE); // 페이지 갯수
		int responseStartPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE +1;
		int responseEndPage = responseStartPage + BLOCKSIZE -1;
		if(responseEndPage > responsePageCnt) {
			responseEndPage = responsePageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE); // ★ 페이지 관련 항목
		request.setAttribute("startPage", responseStartPage);
		request.setAttribute("endPage", responseEndPage);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageCnt", responsePageCnt);
	}
}
