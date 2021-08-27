package com.kh.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.model.vo.Category;
import com.kh.follow.model.service.FollowService;
import com.kh.follow.model.vo.Follow;
import com.kh.follow.model.vo.FollowPageInfo;
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
		
		int followCount = new FollowService().followCount(userId);
		request.setAttribute("followCount", followCount);
		
		ArrayList<Category> catList = new ArrayList<Category>();
		catList = new FollowService().getCatList();
		request.setAttribute("catList", catList);
		
		
		int listCount;			
		int currentPage;		
		int startPage;			
		int endPage;			
		int maxPage;
		
		int pageLimit;
		int followLimit;
		
		listCount = new FollowService().getListCount(userId);
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		
		followLimit = 6;
		
		maxPage = (int)Math.ceil((double)listCount/followLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		FollowPageInfo pi = new FollowPageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, followLimit);
		
		
		ArrayList<Follow> list = new FollowService().selectList(userId, pi);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
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
