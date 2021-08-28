package com.kh.challenge.controller;

import java.io.IOException;

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
 * Servlet implementation class EnrollChallenge
 */
@WebServlet("/enroll.ch")
public class EnrollChallenge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollChallenge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eUser = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		int chno = Integer.parseInt(request.getParameter("chno"));
		
		Challenge cu = new Challenge();
		
		cu.setUser(eUser);
		cu.setChNo(chno);
		
		int result = new ChallengeService().enrollCh(cu);
		
		if (result > 0) {
			request.getSession().setAttribute("msg", "신청이 완료되었습니다.");
			response.sendRedirect("challengeMain.ch");
			System.out.println("챌린지 신청 성공!");
		} else {
			request.setAttribute("msg", "신청에 실패했습니다.");

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
