package com.kh.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.follow.model.service.FollowService;
import com.kh.follow.model.vo.Follow;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyfollowServlet
 */
@WebServlet("/MyFollow.fl")
public class MyfollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyfollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		ArrayList<Follow> list = new FollowService().selectList(userId);
		request.setAttribute("list", list);
		System.out.println(list);
		RequestDispatcher view = request.getRequestDispatcher("views/follow/myFriendView.jsp");
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
