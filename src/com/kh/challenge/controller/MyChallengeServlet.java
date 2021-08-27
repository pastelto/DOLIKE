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
import com.kh.challenge.model.vo.ChallengeAttachment;
import com.kh.challenge.model.vo.ChallengeReply;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyChallengeServlet
 */
@WebServlet("/myChallenge.ch")
public class MyChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginUser = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		Challenge c = new ChallengeService().selectMyChallenge(loginUser);
		System.out.println(c +": servlet");
		
		int chno = c.getChNo();
				
		ChallengeAttachment at = new ChallengeService().selectAttach(chno);						
		request.setAttribute("at", at);
		System.out.println(at +": servlet");
		
		request.setAttribute("c", c);
		request.setAttribute("at", at);
		
		
				
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
