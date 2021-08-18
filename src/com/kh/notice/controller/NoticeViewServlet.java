package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/noticeView.no")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("출력");
//		ArrayList<Notice> list = new ArrayList<Notice>();
//		list.add(new Notice(1, "123", "123", "admin", 1, "Y"));
		
//		System.out.println(list);
//		ArrayList<Member> mem = new ArrayList<Member>();
//		System.out.println(mem);
//		
//		Member m = new Member();
//		System.out.println(m);
		
		ArrayList<Notice> list = new NoticeService().selectList();
//		
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/notice/noticeView.jsp");
		System.out.println("나와라");
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
