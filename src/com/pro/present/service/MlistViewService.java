package com.pro.present.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.dao.MemberDao;
import com.pro.present.dto.MemberDto;

public class MlistViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// PAGESIZE = 3 , BLOCKSIZE = 5
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage = Integer.parseInt(pageNum);
			final int PAGESIZE = 3, BLOCKSIZE = 5;
			int startRow = (currentPage-1)*PAGESIZE+1; // 시작 번째 수
			int endRow = startRow + PAGESIZE -1; // // 끝나는 번째 수
			
			MemberDao mDao = MemberDao.getInstance();
			ArrayList<MemberDto> members = mDao.listMember(startRow, endRow);
			request.setAttribute("list", members);
			
			int totalCnt = mDao.totalMember(); // 등록된 멤버 수
			int	pageCnt = (int) Math.ceil((double)totalCnt/PAGESIZE); // 페이지 갯수
			int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1; // 시작 페이지
			int endPage = startPage + BLOCKSIZE -1;
			if(endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			request.setAttribute("BLOCKSIZE", BLOCKSIZE);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageNum", currentPage);
			request.setAttribute("pageCnt", pageCnt);
		}
	
	}
