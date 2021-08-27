package com.kh.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.follow.model.service.FollowService;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/search.bo")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String findBoard = request.getParameter("findBoard");
		
		System.out.println("검색어 : "+findBoard);
		
		int result = new BoardService().searchBoard(findBoard);
		PrintWriter out = response.getWriter();
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			response.sendRedirect("find.bo?findBoard="+findBoard);
			//request.getRequestDispatcher("views/board/boardSearch.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "검색할 게시글을 불러오는데 실패했습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
		
		out.flush();
		out.close(); 
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
