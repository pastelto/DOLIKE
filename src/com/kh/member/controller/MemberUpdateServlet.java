package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newPwd = request.getParameter("newPwd");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userPwd = request.getParameter("userPwd");
		String nickName = request.getParameter("nickName");
		String[] interests = request.getParameterValues("interest");
		
		Member updateMem = new MemberService().updateMember(newPwd, userId, userPwd, nickName, interests);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/memberUpdateForm.jsp");
		
		if(updateMem != null) {
			request.setAttribute("sTag", "Y");
			request.setAttribute("msg", "성공적으로 비밀번호를 변경하였습니다.");
			
			request.getSession().setAttribute("loginUser", updateMem);
			
		}else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
		}
		
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
