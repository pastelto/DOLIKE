package com.kh.follow.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.follow.model.service.FollowService;

/**
 * Servlet implementation class FollowSearchServlet
 */
@WebServlet("/search.fl")
public class FollowSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String followId = request.getParameter("followId");
		
		System.out.println("검색한 아이디: "+followId);
		
		int result = new FollowService().searchId(followId);
		PrintWriter out = response.getWriter();
		
		System.out.println(result);
		
		if(result > 0) {
			out.print("success"); //검색한 아이디 있는 경우
		}else {
			out.print("fail"); //검색한 아이디 없는 경우
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
