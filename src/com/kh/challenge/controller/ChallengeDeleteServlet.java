package com.kh.challenge.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.challenge.model.service.ChallengeService;

/**
 * Servlet implementation class ChallengeDeleteServlet
 */
@WebServlet("/deleteChallenge.ch")
public class ChallengeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int chno = Integer.parseInt(request.getParameter("chno"));
		
		int result1 = new ChallengeService().deleteChallenge(chno);		
		int result2 = new ChallengeService().updateUserStatus(chno);
		
		if(result1 * result2 > 0) {
			request.getSession().setAttribute("sadMsg", "이달의 챌린지가 마감되었습니다");
			response.sendRedirect("challengeMain.ch");
		} else {
			request.setAttribute("errMsg", "삭제 실패");
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
