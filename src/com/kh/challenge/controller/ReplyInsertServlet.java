package com.kh.challenge.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.ChallengeReply;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet(name = "RplyInsertServlet", urlPatterns = { "/rplyInsert.ch" })
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result = 0;
		ChallengeReply cp = new ChallengeReply();
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;

			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\challenge_upfiles";
			
			System.out.println("savePath : " + savePath);

			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			int chno = Integer.parseInt(mr.getParameter("chno"));
			String content = mr.getParameter("content");
			String wirter = ((Member)request.getSession().getAttribute("loginUser")).getUserId();

			System.out.println(chno + " rp servlet");
			System.out.println(content + "rp servlet");
			System.out.println(wirter + "rp servlet");

			cp.setChNo(chno);
			cp.setContent(content);
			cp.setRpWriter(wirter);
			

			System.out.println("RplyInsertServlet : " + chno + ", " + content + ", " + wirter );

			if (mr.getOriginalFileName("file") != null) {

				String originName = mr.getOriginalFileName("file");
				String changeName = mr.getFilesystemName("file");

				System.out.println("originName ? " + originName);
				System.out.println("changeName ? " + changeName);

				cp.setLocation(savePath);
				cp.setOriginName(originName);
				cp.setNewName(changeName);
			}
			System.out.println(cp + " cp servlet");

			result = new ChallengeService().insertReply(cp);

			if (result > 0) {
				response.sendRedirect("challengedetail.ch?chno="+chno);
				
				result = 0;
			} else {
				if (cp != null) {
					File failedFile = new File(savePath + cp.getNewName());
					failedFile.delete();
					result = 0;
				}

				//request.setAttribute("msg", "댓글등록이 실패했습니다.");

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
