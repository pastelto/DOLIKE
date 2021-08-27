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
@WebServlet("/memberUpdate.me")
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
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userPwd = request.getParameter("userPwd");
		String nickName = request.getParameter("nickName");
		String interests1 = request.getParameter("interests1");
		String interests2 = request.getParameter("interests2");
		String interests3 = request.getParameter("interests3");
		
		Member updateMem = new MemberService().updateMember(userId, userPwd, nickName, interests1, interests2, interests3);
		
		if(updateMem != null) {
			request.getSession().setAttribute("msg", "성공적으로 회원정보를 수정하였습니다.");
			request.getSession().setAttribute("loginUser", updateMem);
			response.sendRedirect(request.getContextPath() + "/mypage.me");
		}else {
			request.setAttribute("msg", "회원정보 변경에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
