package com.kh.myFavBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.myFavBoard.model.service.myFBService;
import com.kh.myFavBoard.model.vo.myFavBoard;

/**
 * Servlet implementation class getMyFavBoardListServlet
 */
@WebServlet("/gmfb.fb")
public class getMyFavBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getMyFavBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("getMyFavBoard 접속 완료!");
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		ArrayList<myFavBoard> fav = new myFBService().getMyFavBoardList(userId);
		
		response.setContentType("application/json; charset=utf-8");
		System.out.println("서블릿에 전송한 내 즐겨찾기 게시판 : " + fav);
		new Gson().toJson(fav, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
