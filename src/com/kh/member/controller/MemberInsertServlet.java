package com.kh.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/memberInsert")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String birthDate = request.getParameter("birthDate");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		String userCreateDate = request.getParameter("userCreateDate");
		String userStatus = request.getParameter("userStatus");
		
		String[] interests = request.getParameterValues("interest");
		
		int interest = 0; //interests를 String형으로 변환?
		
		if (interests != null) {
			interest = String.join(",", interests);
		}
		
		Member mem = new Member(userId, userName, userPwd, birthDate, phone, email, nickName, interests, userCreateDate, userStatus);
		
		int result = new MemberService().insertMember(mem);
		
		if (result > 0) {
			request.getSession().setAttribute("msg", "회원가입 성공");
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "회원가입 실패");
			
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
