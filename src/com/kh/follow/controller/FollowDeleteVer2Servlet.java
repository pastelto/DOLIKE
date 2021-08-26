package com.kh.follow.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.follow.model.service.FollowService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FollowDeleteVer2Servlet
 */
@WebServlet("/deleteFl2.fl")
public class FollowDeleteVer2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowDeleteVer2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String followId = request.getParameter("flid");
		int result = new FollowService().deleteFollowVer2(userId, followId);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "친구 삭제 성공");
			response.sendRedirect("MyFollow.fl");
		}else {
			request.setAttribute("msg", "친구 삭제에 실패했습니다. ");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
