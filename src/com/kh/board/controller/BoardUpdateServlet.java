package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

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
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/update.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "/board_upfiles";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy()); //명시하지 않으면 디폴트로 생성해주는게 있다고 함
			
			String tag = multiRequest.getParameter("tag");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			int bno = Integer.parseInt(multiRequest.getParameter("bno"));
			System.out.println("update.bo 서블릿에서 받는 bno 값 " + bno);
			Board b = new Board();
			b.setTagName(tag);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setBoardNo(bno);
			
			Attachment at = null;
			
			
			if(multiRequest.getOriginalFileName("upFile") != null) {// 새로 파일이 들어온경우
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upFile"));
				at.setChangeName(multiRequest.getFilesystemName("upFile"));
				at.setFilePath(savePath);
				System.out.println("upfile");
				//기존 등록 파일은 삭제해주기
				if(multiRequest.getParameter("originFile") != null ) {
					
					File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));
					System.out.println("deleteFile   "+ deleteFile);
					deleteFile.delete();
					
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
					//파일이 만약 없었던 게시글에 사진 추가하는 경우 넘버 부여해줘야 함
					at.setRefBoardNo(bno);
				}
			}
			int result = new BoardService().updateBoard(b, at);
			
			if(result > 0) {
				response.sendRedirect("detail.bo?bno="+bno);
			}else {
					
				request.setAttribute("msg", "게시판 수정 실패");
				
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
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
