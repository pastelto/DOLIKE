package com.kh.category.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.model.service.CategoryService;

/**
 * Servlet implementation class CategoryDeleteServlet
 */
@WebServlet("/deleteC.ca")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("cno"));
		
		int result = new CategoryService().deleteCategory(cid);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "성공적으로 카테고리가 삭제되었습니다.");
			response.sendRedirect("categoryList.ca");
		}else {
			 request.setAttribute("msg", "카테고리 삭제 실패");
	         
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
