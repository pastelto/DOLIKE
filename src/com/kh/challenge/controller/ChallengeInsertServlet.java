package com.kh.challenge.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;

			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\challenge_upfiles";
			System.out.println("savePath : " + savePath);

			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			String chTitle = request.getParameter("chTitle");
			String content = request.getParameter("content");
			int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
			String ss = request.getParameter("start");
			String se = request.getParameter("end");

			SimpleDateFormat sf = new SimpleDateFormat("yy-mm-dd");

			Date start = null;
			Date end = null;
			try {
				start = sf.parse(ss);
				end = sf.parse(se);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Challenge c = new Challenge();

			c.setChTitle(chTitle);
			c.setContent(content);
			c.setChNo(categoryNo);
			c.setStart(start);
			c.setEnd(end);

			System.out.println("ChallengeInsertServlet : " + chTitle + ", " + content + ", " + categoryNo + ", " + start
					+ ", " + end);

			ChallengeAttachment cat = null;

			if (mr.getOriginalFileName("upfile") != null) {

				String originName = mr.getOriginalFileName("upfile");
				String changeName = mr.getFilesystemName("upfile");

				System.out.println("originName ? " + originName);
				System.out.println("changeName ? " + changeName);

				cat = new ChallengeAttachment();
				cat.setLocation(savePath);
				cat.setOriginName(originName);
				cat.setNewName(changeName);
			}

			int result = new ChallengeService().insertChallenge(c, cat);

			if (result > 0) {
				request.getSession().setAttribute("msg", "챌린지 등록이 완료됐습니다.");
				response.sendRedirect("challengeMain.ch");				
			} else {
				if (cat != null) {
					File failedFile = new File(savePath + cat.getNewName());
					failedFile.delete();
				}

				request.setAttribute("msg", "챌린지 등록이 실패했습니다.");

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
