package com.kh.category.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.category.model.service.CategoryService;
import com.kh.category.model.vo.Category;

/**
 * Servlet implementation class CategoryAjaxMenuBarServlet
 */
@WebServlet("/categoryMenuBar.ca")
public class CategoryAjaxMenuBarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryAjaxMenuBarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		ArrayList<Category> list = new CategoryService().categoryMenuBarList();
						
//		JSONArray jArr = new JSONArray();
//		
//		JSONObject jsonUser = null;
//		System.out.println("ajax 서블릿 list 값 :" + list);
////		for(Category caMenu: list) {
////			
////				jsonUser.put("name", caMenu.getCategoryName());
////				
////				jArr.add(jsonUser);
////			
////		}
//		Category ca = null;
//		
//		for(int i = 0; i < list.size(); i++) {
//			ca = list.get(i);
//			jsonUser = new JSONObject();
//			
//			jsonUser.put("name", ca.getCategoryName());
//			jArr.add(jsonUser);
//		}
//		
////		JSONObject jsonMap = null;
////		
////		if(jArr != null) {
////			jsonMap = new JSONObject();
////			
////			jsonMap.put("jArr", jArr);
////			
////			
////		}
//		
//		
//		System.out.println("jArr 값 : " + jArr);
//		System.out.println("list 값 : " + list);
		
		
//		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().print(jArr);
//		System.out.println("Gson### : " + list);
		response.setContentType("application/json; charset=utf-8");
		System.out.println("서블릿 전송에 성공하였습니다. list 값 :" + list);
		new Gson().toJson(list, response.getWriter());
		
		//RequestDispatcher view = request.getRequestDispatcher("views/category/menuSideBar.jsp");
		//view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
