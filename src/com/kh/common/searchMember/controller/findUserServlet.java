package com.kh.common.searchMember.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.common.searchMember.model.service.searchService;
import com.kh.common.searchMember.model.vo.SearchListPageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class findUserServlet
 */
@WebServlet("/findUser.fd")
public class findUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findUserServlet() {
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
		int findList;	
		
		
		// 유저아이디 넘기기 
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		/* String userId1 = (String)request.getAttribute("userIdValue"); */
		System.out.println("로그인 유저 : " + userId);
		// 검색한 아이디 또는 닉네임 값
		String searchWord = (String)request.getParameter("searchWord");
		System.out.println("검색 단어 : " + searchWord);
		// 검색 옵션
		String choice = (String)request.getParameter("choice");
		System.out.println("검색 옵션 : " + choice);
		// 검색 결과 개수
		listCount = new searchService().getSearchUserListCount(userId, searchWord, choice);
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 10;
		findList = 10;

		maxPage = (int)Math.ceil((double)listCount/findList);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}

		
		SearchListPageInfo pi = new SearchListPageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, findList);
		ArrayList<Member> list = new searchService().getUserList(userId, searchWord, choice, pi);
		
		JSONArray jArr = new JSONArray();
		JSONObject jsonUser = null;
		
		for(Member m : list) {
			jsonUser = new JSONObject();
			
			jsonUser.put("userId", m.getUserId());
			jsonUser.put("nickName", m.getNickName());
			
			jArr.add(jsonUser);
			
		}
		/*
		 * request.setAttribute("list", list); request.setAttribute("pi", pi);
		 * 
		 * RequestDispatcher view =
		 * request.getRequestDispatcher("views/common/searchFriend.jsp");
		 * view.forward(request, response);
		 */
		
		JSONObject jsonMap = null;
		
		jsonMap = new JSONObject();
		
		jsonMap.put("jArr", jArr);
		jsonMap.put("pi", pi);
		jsonMap.put("listCount", listCount);
		
		response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(jsonMap);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
