package com.kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgPageInfo;

/**
 * Servlet implementation class MessageListServlet
 */
@WebServlet("/list.ms")
public class MessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int listCount;			// 총 게시글 갯수
		int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
		int startPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 시작 수 
		int endPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 끝 수
		int maxPage;			// 전체 페이지에서의 가장 마지막 페이지
		
		int pageLimit;			// 한 페이지 하단에 보여질 페이지 최대 갯수
		int msgLimit;	    // 한 페이지에 보여질 게시글 최대 갯수
		
		// 유저아이디 넘기기 
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		listCount = new MessageService().getMessageCount(userId);
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 10;
		msgLimit = 10;

		maxPage = (int)Math.ceil((double)listCount/msgLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}
	
		MsgPageInfo pi = new MsgPageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, msgLimit);
		ArrayList<Message> list = new MessageService().selectList(pi, userId);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/message/messageListView.jsp");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
