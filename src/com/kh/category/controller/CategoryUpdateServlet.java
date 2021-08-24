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

/**
 * Servlet implementation class CategoryUpdateServlet
 */
@WebServlet("/updateForm.ca")
public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		//String cno = request.getParameter("cno");
		
		System.out.println("cno 값 : " + cno);
		String caName = request.getParameter("caName");
		
		Category c = new Category();
		c.setCategoryNo(cno);
		c.setCategoryName(caName);
		System.out.println("caName 값 : " + caName);
		int result = new CategoryService().updateCategory(c);
		System.out.println("==============11111=================");
		if(result > 0) {
			request.getSession().setAttribute("msg", "성공적으로 카테고리를 수정하였습니다.");
			//request.getSession().setAttribute("loginUser", updateCat);
			response.sendRedirect("categoryList.ca?cno"+cno);
		}else {	
	         request.setAttribute("msg", "카테고리 수정 실패");
	         
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
