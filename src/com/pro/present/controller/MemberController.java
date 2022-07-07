package com.pro.present.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.present.service.BlikeService;
import com.pro.present.service.BwriteService;
import com.pro.present.service.BcontentViewService;
import com.pro.present.service.BdeleteService;
import com.pro.present.service.BlistViewService;
import com.pro.present.service.BmodifyService;
import com.pro.present.service.BmodifyViewService;
import com.pro.present.service.BreplyListViewService;
import com.pro.present.service.BreplyService;
import com.pro.present.service.BreplyViewService;
import com.pro.present.service.MjoinService;
import com.pro.present.service.MlistViewService;
import com.pro.present.service.MloginService;
import com.pro.present.service.MlogoutService;
import com.pro.present.service.MmodifyService;
import com.pro.present.service.MmodifyViewService;
import com.pro.present.service.RwriteService;
import com.pro.present.service.Service;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); // /ch19_mvcboard/list.do
		String conPath = request.getContextPath(); // /ch19_mvcboard
		String command = uri.substring(conPath.length()); // /list.do
		String viewPage = null;
		Service service = null;
		if(command.equals("/loginView.do")) {
			viewPage = "member/loginView.jsp";
		}else if(command.equals("/joinView.do")) {
			// service = new MjoinService();
			// service.execute(request, response);
			viewPage = "member/joinView.jsp";
		}else if(command.equals("/login.do")) {
			service = new MloginService();
			service.execute(request, response);
			viewPage = "/freeBoardListView.do";
		}else if(command.equals("/join.do")) {
			service = new MjoinService();
			service.execute(request, response);
			viewPage = "member/loginView.jsp";
		}else if(command.equals("/mainView.do")) {
			viewPage = "main/main.jsp";
		}else if(command.equals("/logout.do")) {
			service = new MlogoutService();
			service.execute(request, response);
			viewPage = "/freeBoardListView.do";
		}else if(command.equals("/memberListView.do")) {
			service = new MlistViewService();
			service.execute(request, response);
			viewPage = "member/listView.jsp";
		}else if(command.equals("/modifyView.do")) {
			service = new MmodifyViewService();
			service.execute(request, response);
			viewPage = "member/modifyView.jsp";
		}else if(command.equals("/modify.do")) {
			service = new MmodifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/freeBoardListView.do")) {
			service = new BlistViewService();
			service.execute(request, response);
			viewPage = "freeboard/listView.jsp";
		}else if(command.equals("/freeBoardContentView.do")) {
			service = new BcontentViewService();
			service.execute(request, response);
			viewPage = "freeboard/contentView.jsp";
		}else if(command.equals("/freeBoardLike.do")) {
			service = new BlikeService();
			service.execute(request, response);
			viewPage = "/freeBoardContentView.do";
		}else if(command.equals("/freeBoardWrite.do")) {
			service = new BwriteService();
			service.execute(request, response);
			viewPage = "/freeBoardListView.do";
		}else if(command.equals("/freeBoardWriteView.do")) {
			viewPage = "freeboard/writeView.jsp";
		}else if(command.equals("/freeBoardModifyView.do")) {
			service = new BmodifyViewService();
			service.execute(request, response);
			viewPage = "freeboard/modifyView.jsp";
		}else if(command.equals("/freeBoardModify.do")) {
			service = new BmodifyService();
			service.execute(request, response);
			viewPage = "/freeBoardListView.do";
		}else if(command.equals("/freeBoardReplyView.do")) {
			service = new BreplyViewService();
			service.execute(request, response);
			viewPage = "freeboard/replyView.jsp";
		}else if(command.equals("/freeBoardReply.do")) {
			service = new BreplyService();
			service.execute(request, response);
			viewPage = "/freeBoardListView.do";
		}else if(command.equals("/freeBoardDelete.do")) {
			service = new BdeleteService();
			service.execute(request, response);
			viewPage = "/freeBoardListView.do";
		}else if(command.equals("/freeBoardReplyListView.do")) {
			service = new BreplyListViewService();
			service.execute(request, response);
			viewPage = "/freeboard/replyListView.jsp";
		}else if(command.equals("/replyWrite.do")) {
			service = new RwriteService();
			service.execute(request, response);
			viewPage = "/freeBoardContentView.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
