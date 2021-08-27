package com.kh.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Board;
import com.kh.follow.model.service.FollowService;
import com.kh.follow.model.vo.FollowCategoryPageInfo;

/**
 * Servlet implementation class FollowCategoryBoardServlet
 */
@WebServlet("/catBoard.fl")
public class FollowCategoryBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowCategoryBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;			
		int currentPage;		
		int startPage;			
		int endPage;			
		int maxPage;
		
		int pageLimit;
		int catBoardLimit;
		
		String followId = request.getParameter("followId");
		
		//임시용
//		String followId = "user13";
		
		String catTitle = request.getParameter("catTitle");
		
		
		System.out.println("FollowCategoryBoard(followId): "+followId);
		System.out.println("FollowCategoryBoard(catTitle): "+catTitle);
		
		listCount = new FollowService().getCatBoardListCount(followId, catTitle);
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		
		catBoardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/catBoardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		FollowCategoryPageInfo pi = new FollowCategoryPageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, catBoardLimit);
		
		
		ArrayList<Board> list = new FollowService().selectFollowBoardList(followId, catTitle, pi);
		
		request.setAttribute("followId", followId);
		request.setAttribute("catTitle", catTitle);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("views/follow/followCategory.jsp");
//		RequestDispatcher view = request.getRequestDispatcher("/followCategoryList.fl");
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
