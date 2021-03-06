package com.kh.challenge.controller;

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

import com.kh.challenge.model.service.ChallengeService;
import com.kh.challenge.model.vo.Challenge;
import com.kh.challenge.model.vo.ChallengeAttachment;
import com.kh.challenge.model.vo.ChallengeVote;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ChallengeInsertServlet
 */
@WebServlet("/challengeInsert.ch")
public class ChallengeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChallengeInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		ArrayList<ChallengeVote> list = new ChallengeService().selectChallengeVoteList();
		
		int votecount = 0;
		int result = 0;
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;

			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\challenge_upfiles";

			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			String chTitle = mr.getParameter("chTitle");
			String content = mr.getParameter("content");
			int categoryNo = Integer.parseInt(mr.getParameter("categoryNo"));
			String start = mr.getParameter("start");
			String end = mr.getParameter("end");
			
			for(int i=0; i < list.size(); i++) {
				if(list.get(i).getChTitle().equals(chTitle)) {
					votecount = list.get(i).getVoteCount();
				}
			}	
			
			Challenge c = new Challenge();

			c.setChTitle(chTitle);
			c.setContent(content);
			c.setCategoryNo(categoryNo);
			c.setStart(start);
			c.setEnd(end);
			c.setVoteCount(votecount);
			

			ChallengeAttachment cat = null;

			if (mr.getOriginalFileName("file") != null) {

				String originName = mr.getOriginalFileName("file");
				String changeName = mr.getFilesystemName("file");

				System.out.println("originName ? " + originName);
				System.out.println("changeName ? " + changeName);

				cat = new ChallengeAttachment();
				cat.setLocation(savePath);
				cat.setOriginName(originName);
				cat.setNewName(changeName);
			}

			result = new ChallengeService().insertChallenge(c, cat);

			if (result > 0) {
				request.getSession().setAttribute("adMsg", "????????? ????????? ??????????????????.");
				response.sendRedirect("challengeMain.ch");	
				result = 0;
			} else {
				if (cat != null) {
					File failedFile = new File(savePath + cat.getNewName());
					failedFile.delete();
					result = 0;
				}

				request.setAttribute("errMsg", "????????? ?????? ??????");

				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
