package com.kh.follow.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.follow.model.service.FollowService;
import com.kh.follow.model.vo.Follow;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FollowInsertServlet
 */
@WebServlet("/insert.fl")
public class FollowInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String followId = request.getParameter("followId");
		System.out.println("insert: "+followId);
		
		Follow fl = new Follow(userId, followId);
		
		int result = new FollowService().insertId(fl);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", followId+"님 친구 등록 성공!");
			response.sendRedirect("MyFollow.fl");
		}else {
			request.getSession().setAttribute("msg", "친구 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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