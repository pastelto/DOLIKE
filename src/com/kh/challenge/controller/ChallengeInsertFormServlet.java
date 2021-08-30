package com.kh.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.model.vo.Category;
import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.ChallengeVote;
import com.kh.follow.model.service.FollowService;

/**
 * Servlet implementation class ChallengeInsertFormServlet
 */
@WebServlet("/challengeInsertForm.ch")
public class ChallengeInsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeInsertFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ChallengeVote> list = new ChallengeService().selectChallengeVoteList();
		request.setAttribute("list", list);		
		
		ArrayList<Category> catList = new ArrayList<Category>();
		catList = new FollowService().getCatList();
		request.setAttribute("catList", catList);
		
		request.getRequestDispatcher("views/challenge/insertChallenge.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
