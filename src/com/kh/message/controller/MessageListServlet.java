package com.kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;

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
<<<<<<< HEAD
=======


		int listCount;
		int currentPage;
		int startPage;
		int endPage;
		int maxPage;
		
		int pageLimit;	
		int msgLimit;	
		
		int newMsgCount; // 새로운 쪽지 개수
		
		// 유저아이디 넘기기 
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		listCount = new MessageService().getMessageCount(userId);
		
		currentPage = 1;
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		
		ArrayList<Message> list = new MessageService().selectList();
		
<<<<<<< HEAD
		request.setAttribute("list", list);
=======
		endPage = startPage + pageLimit - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		newMsgCount = new MessageService().getNewMessageCount(userId);
		
		MsgPageInfo pi = new MsgPageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, msgLimit);
		ArrayList<Message> list = new MessageService().selectList(pi, userId);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("newMsgCount", newMsgCount);
		
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		
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
