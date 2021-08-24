package com.kh.challenge.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.ChallengeApply;

/**
 * Servlet implementation class ApplyChallengeServlet
 */
@WebServlet("/challengeApply.ch")
public class ApplyChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyChallengeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		String apUser = request.getParameter("loginuser");
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		String content = request.getParameter("content");

		ChallengeApply ca = new ChallengeApply();

		ca.setApUser(apUser);
		ca.setCategoryNo(categoryNo);
		ca.setContent(content.replaceAll("\n", "<br>"));

		int result = new ChallengeService().insertApply(ca);

		if (result > 0) {
			request.getSession().setAttribute("msg", "신청이 완료되었습니다.");
			response.sendRedirect("list.ms");
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
