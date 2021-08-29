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
import com.kh.challenge.model.vo.PageInfo;

/**
 * Servlet implementation class EndedChallengeServlet
 */
@WebServlet("/challengeEnd.ch")
public class EndedChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndedChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	
		ArrayList<ChallengeAttachment> fileList = new ChallengeService().selectAttach();						
		request.setAttribute("fileList", fileList);
		
		
		// ---------------- 페이징 처리 -----------------
				int listCount;			// 총 댓글 갯수
				int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
				int startPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 시작 수 
				int endPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 끝 수
				int maxPage;			// 전체 페이지에서의 가장 마지막 페이지
				
				int pageLimit;			// 한 페이지 하단에 보여질 페이지 최대 갯수
				int listLimit;			// 한 페이지에 보여질 댓글 최대 갯수
				
				listCount = new ChallengeService().getecListCount();
				
				currentPage = 1;
				
				// 페이지 전환시 전달받은 페이지가 있을 경우 전달받은 페이지를 currentPage로!
				if(request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수 
				pageLimit = 5;
				
				// * rpLimit : 한 페이지에 보여질 게시글 최대 갯수
				listLimit = 5;
				
				// * maxPage : 총 페이지 수
				maxPage = (int)Math.ceil((double)listCount/listLimit);
				
				// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수				
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
				
				// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
				endPage = startPage + pageLimit - 1;
				
				// 단, maxPage가 고작 13까지 밖에 안되면? endPage를 13으로 해줘야됨!
				if(maxPage < endPage) {
					endPage = maxPage;
				}
								
				PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, listLimit);
				request.setAttribute("pi", pi);
				
				ArrayList<Challenge> list = new ChallengeService().selectEndList(pi);
				request.setAttribute("list", list);
						
				RequestDispatcher view = request.getRequestDispatcher("views/challenge/endedChallenge.jsp");
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
