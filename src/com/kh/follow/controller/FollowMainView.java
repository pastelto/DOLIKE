package com.kh.follow.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.model.vo.Category;
import com.kh.follow.model.service.FollowService;
import com.kh.follow.model.vo.Follow;

/**
 * Servlet implementation class FollowMainView
 */
@WebServlet("/followMain.fl")
public class FollowMainView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowMainView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Follow> flist = new FollowService().selectFollowTop4User(); 
		request.setAttribute("flist", flist);
		
		ArrayList<Category> catList = new ArrayList<Category>();
		catList = new FollowService().getCatList();
		request.setAttribute("catList", catList);
		
		System.out.println("추천친구 카테고리: "+catList);
		
		System.out.println("첫번째 카테고리: "+catList.get(0).getCategoryName());
		System.out.println(catList.size());
		
		//카테고리별 top유저 4명 정보 hashmap으로 끌어오기
		HashMap<String, ArrayList<Follow>> hashmap = new HashMap<String, ArrayList<Follow>>();
		
		
		
		for(int i=0;i<catList.size();i++) {
			System.out.println("추천친구 카테고리 "+i+"번: "+ catList.get(i).getCategoryName());
			String catTitle = catList.get(i).getCategoryName();
			
			ArrayList<Follow> catFlTop = new FollowService().selectCategoryTop4User(catTitle);
			
			System.out.println("추천친구 카테고리: "+catList.get(i).getCategoryName());
			
			hashmap.put(catTitle, catFlTop);
			
		}
		
		request.setAttribute("hashmap", hashmap);
		System.out.println(hashmap);
		RequestDispatcher view = request.getRequestDispatcher("views/follow/followMainView.jsp");
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
