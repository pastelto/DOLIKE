package com.kh.challenge.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.ChallengeVote;

/**
 * Servlet implementation class VoteCountUpServlet
 */
@WebServlet("/upVote.ch")
public class VoteCountUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteCountUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String chTitle = request.getParameter("chTitle");
		
		ChallengeVote cv = new ChallengeVote();
		
		cv.setChTitle(chTitle);
		int result = new ChallengeService().voteCountUp(cv);

		if (result > 0) {
			request.getSession().setAttribute("msg", "투표해주셔서 감사합니다!");
			response.sendRedirect("challengeVote.ch");
			System.out.println("투표 성공!");
		} else {
			request.setAttribute("errMsg", "투표 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
