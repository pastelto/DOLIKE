package com.kh.follow.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.follow.model.service.FollowService;

/**
 * Servlet implementation class FollowCountServlet
 */
@WebServlet("/count.fl")
public class FollowCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * String followId = request.getParameter("followId");
		 * 
		 * int followerCount = new FollowService().countFollower(followId); int
		 * boardCount = new FollowService().countFollowBoard(followId);
		 * 
		 * System.out.println("게시글 수:"+boardCount);
		 * 
		 * JSONArray jArr = new JSONArray(); JSONObject jsonUser = null;
		 * 
		 * if(m.getUserId().equals(followId)) {
		 * 
		 * jsonUser = new JSONObject();
		 * 
		 * jsonUser.put("nickname", m.getNickName()); jsonUser.put("followUserId",
		 * m.getUserId()); jsonUser.put("followInterest", m.getInterests());
		 * jsonUser.put("followerCount", followerCount); jsonUser.put("boardCount",
		 * boardCount);
		 * 
		 * jArr.add(jsonUser); }
		 * 
		 * 
		 * response.setContentType("application/json; charset=utf-8");
		 * response.getWriter().print(jArr);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
