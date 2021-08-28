package com.kh.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.board.model.vo.Board;
import com.kh.follow.model.service.FollowService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FollowUserInfoServlet
 */
@WebServlet("/followTop4.fl")
public class FollowTop4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowTop4Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String followId = request.getParameter("followId");
		String followId1 = request.getParameter("followId1");
		String followId2 = request.getParameter("followId2");
		String followId3 = request.getParameter("followId3");
		
		System.out.println("userInfo2의 followId: "+followId);
		System.out.println("userInfo2의 followId1: "+followId1);
		System.out.println("userInfo2의 followId2: "+followId2);
		System.out.println("userInfo2의 followId3: "+followId3);

		Member m = new FollowService().selectFollowInfo(followId);
		Member m1 = new FollowService().selectFollowInfo(followId1);
		Member m2 = new FollowService().selectFollowInfo(followId2);
		Member m3 = new FollowService().selectFollowInfo(followId3);
		
		int followerCount = new FollowService().countFollower(followId);
		int followerCount1 = new FollowService().countFollower(followId1);
		int followerCount2 = new FollowService().countFollower(followId2);
		int followerCount3 = new FollowService().countFollower(followId3);
		
		int boardCount = new FollowService().countFollowBoard(followId);
		int boardCount1 = new FollowService().countFollowBoard(followId1);
		int boardCount2 = new FollowService().countFollowBoard(followId2);
		int boardCount3 = new FollowService().countFollowBoard(followId3);
		
		
		JSONArray jArr = new JSONArray();
		
		JSONObject jsonUser = null;
		
		if(m.getUserId().equals(followId) || m1.getUserId().equals(followId1)||m2.getUserId().equals(followId2)||m3.getUserId().equals(followId3)) {

			jsonUser = new JSONObject();
			
			jsonUser.put("nickname", m.getNickName());
			jsonUser.put("followUserId", m.getUserId());
			jsonUser.put("followInterest", m.getInterests());
			jsonUser.put("followerCount", followerCount);
			jsonUser.put("boardCount", boardCount);
			
			jsonUser.put("nickname1", m1.getNickName());
			jsonUser.put("followUserId1", m1.getUserId());
			jsonUser.put("followInterest1", m1.getInterests());
			jsonUser.put("followerCount1", followerCount1);
			jsonUser.put("boardCount1", boardCount1);
			
			jsonUser.put("nickname2", m2.getNickName());
			jsonUser.put("followUserId2", m2.getUserId());
			jsonUser.put("followInterest2", m2.getInterests());
			jsonUser.put("followerCount2", followerCount2);
			jsonUser.put("boardCount2", boardCount2);
			
			jsonUser.put("nickname3", m3.getNickName());
			jsonUser.put("followUserId3", m3.getUserId());
			jsonUser.put("followInterest3", m3.getInterests());
			jsonUser.put("followerCount3", followerCount3);
			jsonUser.put("boardCount3", boardCount3);
			
			jArr.add(jsonUser);
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jArr);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
