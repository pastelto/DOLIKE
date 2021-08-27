package com.kh.common.searchMember;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.searchMember.model.service.searchService;
import com.kh.member.model.vo.Member;
import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgPageInfo;

/**
 * Servlet implementation class findUserServlet
 */
@WebServlet("/findUser.fd")
public class findUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount;
		int currentPage;
		int startPage;
		int endPage;
		int maxPage;
		
		int pageLimit;	
		int msgLimit;	
		
		
		// 유저아이디 넘기기 
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String searchWord = (String) request.getAttribute("keyword");
		listCount = new searchService().getSearchUserListCount(userId, searchWord);
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 10;
		msgLimit = 10;

		maxPage = (int)Math.ceil((double)listCount/msgLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}

		
		MsgPageInfo pi = new MsgPageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, msgLimit);
		
		ArrayList<Member> list = new searchService().getUserList(userId, searchWord, pi);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("views/common/searchFriend.jsp");
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
