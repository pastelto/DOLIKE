package com.kh.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgAttachment;

/**
 * Servlet implementation class RecvMessageDetailServlet
 */
@WebServlet("/sread.ms")
public class SendMessageDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		System.out.println("mno : " + mno);
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();

		Message m = new MessageService().selectSendMsg(mno, userId);
		MsgAttachment mat = new MessageService().selectMsgAttachment(mno);
		
		if(m != null) {
			request.setAttribute("message", m);
			request.setAttribute("mat", mat);
			
			request.getRequestDispatcher("views/message/SendMessageDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "보낸쪽지 상세조회 실패");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
