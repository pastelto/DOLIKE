package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024; //10M byte 
			String resources = request.getSession().getServletContext().getRealPath("/resources"); //로컬경로 
			String savePath = resources + "//board_upfiles//";
			System.out.println("savePath : " + savePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy()); //명시하지 않으면 디폴트로 생성해주는게 있다고 함
			
			String tag = multiRequest.getParameter("tag");
			String title = multiRequest.getParameter("boardTitle");
			String content = multiRequest.getParameter("boardContent");
			
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			
			Board b = new Board();
			b.setTagName(tag);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setNickName(userId);
			
			ArrayList<Attachment> fileList = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String name = "file" + i;
				
				if(multiRequest.getOriginalFileName(name) != null) {
					String originName = multiRequest.getOriginalFileName(name);
					String changeName = multiRequest.getFilesystemName(name);
					System.out.println("originName : "+originName);
					System.out.println("changeName : "+changeName);
						
					Attachment at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(originName);
					at.setChangeName(changeName);
					
					fileList.add(at);
						
				}
			}
			
			int result = new BoardService().insertBoard(b, fileList);
			
			if(result  > 0) {
				response.sendRedirect("list.bo");
				/*
				request.getSession().setAttribute("msg", "게시글 등록 성공");
				response.sendRedirect("list.bo");
				File successFile = new File(savePath+at.getChangeName());
				System.out.println("successFile : " + successFile );
				*/
			}else {
				for(int i =0; i<fileList.size(); i++) {
					File failedFile = new File(savePath+ fileList.get(i).getChangeName());
					failedFile.delete();
				}
				request.setAttribute("msg", "게시글 등록 실패");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
				/*
				 * if(at != null) {
					File failedFile = new File(savePath+at.getChangeName());
					failedFile.delete();
					
					request.setAttribute("msg", "게시글 등록 실패");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
				*/
			}
			
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
