package com.kh.admin.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminRestoreServlet
 */
@WebServlet("/restore.am")
public class AdminRestoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRestoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String status = request.getParameter("status");
		String userId = request.getParameter("userId");
			
		System.out.println("post로 받아오는 status 값 : " + status);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserStatus(status);
		
		int result = new AdminService().restoreMember(status, userId);
		
		Member mem = new AdminService().selectAdminMember(userId);
		
		if(result > 0) {
			request.getSession().setAttribute("adMsg", "복구가 성공적으로 이루어졌습니다.");
			response.setContentType("application/json; charset=utf-8");
			System.out.println("서블릿 전송에 성공하였습니다. am 값 :" + mem);
			new Gson().toJson(mem, response.getWriter());
		}else {
			 request.setAttribute("errMsg", "계정 복구 실패");
	         
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
