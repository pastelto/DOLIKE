package com.kh.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
@WebServlet("/memberInsert.me")
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Calendar time = Calendar.getInstance();
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String birthDate = request.getParameter("birthDate");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		//String userCreateDate = request.getParameter("userCreateDate");
		//String userStatus = request.getParameter("userStatus");
		
		String createDate = sdf.format(time.getTime());
		
		Date birth = null;
		Date userCreateDate = null;
		try {
			birth = (Date) sdf.parse(birthDate);
			userCreateDate = (Date) sdf.parse(createDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		String[] interests = request.getParameterValues("interests");
		
		String interestsArr = "";
		
		for (int i = 0; i < interests.length; i++) {
			interestsArr += interests[i];
			
			if (i < interests.length - 1) {
				interestsArr += ',';
			}
		}
		
		Member mem = new Member(userId, userName, userPwd, birth, phone, email, nickName, interestsArr, userCreateDate, "Y");
		
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
