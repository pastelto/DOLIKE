package com.kh.challenge.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.ChallengeVote;

/**
 * Servlet implementation class VoteInsertServlet
 */
@WebServlet("/voteInsert.ch")
public class VoteInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		String chTitle = request.getParameter("chTitle");
		String content = request.getParameter("content");
		String start = request.getParameter("start");
		String end = request.getParameter("end");	
		
		ChallengeVote cv = new ChallengeVote();

		cv.setApNo(apNo);
		cv.setCategoryNo(categoryNo);
		cv.setChTitle(chTitle);
		cv.setContent(content);
		cv.setStart(start);
		cv.setEnd(end);

		int result = new ChallengeService().insertVote(cv);

		if (result > 0) {
			request.getSession().setAttribute("adMsg", "투표 등록이 완료되었습니다.");
			response.sendRedirect("challengeVote.ch");
			System.out.println("투표 등록 성공!");
		} else {
			request.setAttribute("errMsg", "투표 등록 살패");

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
