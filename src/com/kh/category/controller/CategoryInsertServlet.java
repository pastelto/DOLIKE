package com.kh.category.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.model.service.CategoryService;
import com.kh.category.model.vo.Category;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CategoryInsertServlet
 */
@WebServlet("/insert.ca")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		System.out.println("1caNo 값 확인중");
		
		
		String caTitle = request.getParameter("caTitle");
		
		Category cat = new Category(caTitle);
		
		int result = new CategoryService().insertCatogory(cat);
		System.out.println("categoryInsertServlet 확인중");
		System.out.println(result);
		if(result > 0) {
			request.getSession().setAttribute("msg", "새로운 게시판 등록 성공!");
			response.sendRedirect("categoryList.ca");
		}else {
			request.setAttribute("msg", "새로운 게시판 등록 실패!!");
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