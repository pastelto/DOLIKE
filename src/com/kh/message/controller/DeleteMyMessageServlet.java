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

/**
 * Servlet implementation class DeleteMyMessageServlet
 */
@WebServlet("/dmmsg.ms")
public class DeleteMyMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMyMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 유저아이디 넘기기 
		int mno = Integer.parseInt(request.getParameter("mno"));
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
				
		int result = new MessageService().deleteMyMsg(mno, userId);
		if(result > 0) {
			response.sendRedirect("mlist.ms");
		} else {
			request.setAttribute("errMsg", "보낸쪽지 삭제에 실패했습니다." );
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
