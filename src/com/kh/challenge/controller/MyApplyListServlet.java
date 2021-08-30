package com.kh.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.ChallengeApply;
import com.kh.challenge.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyApplyListServlet
 */
@WebServlet("/myApList.ch")
public class MyApplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyApplyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginUser = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
		int listCount;			
		int currentPage;		
		int startPage;			
		int endPage;			
		int maxPage;
		
		int pageLimit;
		int listLimit;
		
		listCount = new ChallengeService().getMyApListCount(loginUser);
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		
		listLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/listLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, listLimit);
		
		
		ArrayList<ChallengeApply> list = new ChallengeService().selectMyApplyList(pi, loginUser);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("views/challenge/myApplyList.jsp");
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
