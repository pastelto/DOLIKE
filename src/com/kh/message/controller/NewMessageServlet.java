package com.kh.message.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgAttachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NewMessageServlet
 */
@WebServlet("/write.ms")
public class NewMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 쪽지 작성
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\message_upfiles";
			System.out.println("savePath : " + savePath);

			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
//			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			Message m = new Message();
			
			String userId = mr.getParameter("userId");
			String recvId = mr.getParameter("recvId");
			String title = mr.getParameter("messageTitle");
			String messageContent = mr.getParameter("messageContent");
			
			m.setSenderId(userId);
			m.setRecvId(recvId);
			m.setMsgTitle(title);
			m.setMsgContent(messageContent);
			System.out.println("NewMessageServlet : " + userId + ", " + recvId + ", " + title + ", " + messageContent);
			
			MsgAttachment mat = null;
			
			if(mr.getOriginalFileName("upfile") != null) {
				
				String originName = mr.getOriginalFileName("upfile");
				String changeName = mr.getFilesystemName("upfile");
				
				System.out.println("originName ? " + originName);
				System.out.println("changeName ? " + changeName);
				
				mat = new MsgAttachment();
				mat.setMatLocation(savePath);
				mat.setMatOrigin(originName);
				mat.setMatNewName(changeName);
			}
			
			int result = new MessageService().insertNewMessage(m, mat);
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "쪽지를 성공적으로 발송했습니다.");
				response.sendRedirect("list.ms");
				System.out.println("쪽지 발송 성공!");
			} else {
				if(mat != null) {
					File failedFile = new File(savePath + mat.getMatNewName());
					failedFile.delete();
				}
				
				request.setAttribute("msg", "쪽지 발송에 실패했습니다.");
				
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
