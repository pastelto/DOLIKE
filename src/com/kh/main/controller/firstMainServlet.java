package com.kh.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Board;
import com.kh.category.model.vo.Category;
import com.kh.main.model.service.MainService;

/**
 * Servlet implementation class firstMainServlet
 */
@WebServlet("/main.do")
public class firstMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public firstMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전체 인기게시글 불러오기
		ArrayList<Board> topList = new MainService().selectTopList();
		
		// 카테고리 리스트 불러오기
		ArrayList<Category> cList = new ArrayList<Category>();
		cList = new MainService().getCList();
		
		
		System.out.println("카테고리 리스트 : " + cList);
		
		// 카테고리별 인기게시글 5개 가져오기!
		HashMap<String, ArrayList<Board>> hashmap = new HashMap<String, ArrayList<Board>>();
		
		for(int i = 0; i < cList.size(); i++) {
			
			String cTitle = cList.get(i).getCategoryName();
			System.out.println("카테고리 번호 : " + i + "번 이름 : " + cList.get(i).getCategoryName());
			
			ArrayList<Board> eachBoardTopList = new MainService().selectEachBoardTopList(cTitle);
			
			// 카테고리별 인기게시글 
			hashmap.put(cTitle, eachBoardTopList);
			
		}
		
		
		request.setAttribute("topList", topList);
		request.setAttribute("cList", cList);
		request.setAttribute("hashmap", hashmap);
		System.out.println(hashmap);

		RequestDispatcher view = request.getRequestDispatcher("/index2.jsp");
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
