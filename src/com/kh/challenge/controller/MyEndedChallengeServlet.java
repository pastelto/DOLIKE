package com.kh.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.Challenge;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyEndedChallengeServlet
 */
@WebServlet("/myEndedChallenge.ch")
public class MyEndedChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyEndedChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String loginUser = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		ArrayList<Challenge> list = new ChallengeService().selectMyEndChallenge(loginUser);
		request.setAttribute("list", list);
			
		System.out.println(list +": myc servlet");
				
		RequestDispatcher view = request.getRequestDispatcher("views/challenge/myChallenge.jsp");
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
