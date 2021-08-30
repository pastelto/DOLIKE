package com.kh.challenge.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.challenge.model.vo.Challenge;
import com.kh.challenge.model.vo.ChallengeApply;
import com.kh.challenge.model.vo.ChallengeAttachment;
import com.kh.challenge.model.vo.ChallengeReply;
import com.kh.challenge.model.vo.ChallengeVote;
import com.kh.challenge.model.vo.PageInfo;

public class ChallengeDao {

	private Properties prop = new Properties();

	public ChallengeDao() {
		String fileName = ChallengeDao.class.getResource("/sql/challenge/challenge-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int getrpListCount(Connection conn, int chno) {
		int listCount = 0;
		PreparedStatement pstmt = null; 
		ResultSet rset = null;

		String sql = prop.getProperty("getrpListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);
			
			rset = pstmt.executeQuery(); 
			
			if (rset.next()) {
				listCount = rset.getInt(1); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(listCount +" listcount dao");
		return listCount;
	}
	
	
	public int getecListCount(Connection conn) {
		
		int listCount = 0;
		Statement stmt = null; 
		ResultSet rset = null;

		String sql = prop.getProperty("getecListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount =  rset.getInt(1);  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println(listCount +" listcount dao");
		return listCount;
	}

	public int getApListCount(Connection conn) {
		
		int listCount = 0;
		Statement stmt = null; 
		ResultSet rset = null;

		String sql = prop.getProperty("getapListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount =  rset.getInt(1);  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println(listCount +" listcount dao");
		return listCount;
	}
	
	public int getMyApListCount(Connection conn, String loginUser) {
		int listCount = 0;
		PreparedStatement pstmt = null; 
		ResultSet rset = null;

		String sql = prop.getProperty("getmaListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser);
			
			rset = pstmt.executeQuery(); 
			
			if (rset.next()) {
				listCount = rset.getInt(1); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(listCount +" listcount dao");
		return listCount;
	}

	public ArrayList<Challenge> selectList(Connection conn) {

		ArrayList<Challenge> list = new ArrayList<Challenge>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		/*
		 *	SELECT CH_NO, CH_TITLE, CH_BODY, CH_START, CH_END, CH_STATUS, CATEGORY_NAME 
		 *	FROM CHALLENGE A JOIN CATEGORY B ON A.CATEGORY_NO = B.CATEGORY_NO 
		 *	WHERE CH_STATUS = 'Y' ORDER BY CH_END ASC
		 */

		String sql = prop.getProperty("selectChallengeList");
		System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();			
			
			while (rset.next()) {									
				list.add(new Challenge(rset.getInt("CH_NO"),
									   rset.getString("CH_TITLE"), 
									   rset.getString("CH_START"),
									   rset.getString("CH_END"),
									   rset.getString("CH_STATUS"),
									   rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(list +": dao");

		return list;
	}
	
	public ArrayList<Challenge> selectEndList(Connection conn, PageInfo pi) {
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectEndChallenge");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;
		
		/*
		 * SELECT * 
		 * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT CH_NO, CH_TITLE, CH_BODY, CH_START, CH_END, CH_STATUS, CATEGORY_NAME 
		 * FROM CHALLENGE A JOIN CATEGORY B ON A.CATEGORY_NO = B.CATEGORY_NO WHERE CH_STATUS = 'N' ORDER BY CH_END DESC) A) 
		 * WHERE RNUM BETWEEN ? AND ?
		 */
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);	
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Challenge(rset.getInt("CH_NO"),
						   			   rset.getString("CH_TITLE"), 
						   			   rset.getString("CH_BODY"), 
						   			   rset.getString("CH_START"),
						   			   rset.getString("CH_END"),
						   			   rset.getString("CH_STATUS"),
						   			   rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	

	//MAIN
	public ArrayList<ChallengeAttachment> selectAttach(Connection conn) {
		
		ArrayList<ChallengeAttachment> fileList = new ArrayList<ChallengeAttachment>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		/*
		 * SELECT AT_NO, AT_NEWNAME, AT_ORIGINNAME, CH_NO FROM CH_ATTACHMENT
		 */

		String sql = prop.getProperty("selectMainAt");
		System.out.println(sql);

		try {
			
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
	
			while (rset.next()) {			
				fileList.add(new ChallengeAttachment(rset.getInt("AT_NO"),
													 rset.getString("AT_NEWNAME"),
													 rset.getString("AT_ORIGINNAME"), 
													 rset.getInt("CH_NO")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(fileList + ": dao");
		return fileList;
	}
	
	
	// DETAIL
	public ChallengeAttachment selectAttach(Connection conn, int chno) {

		ChallengeAttachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		/*
		 * selectChallengeAt = SELECT AT_NO, AT_NEWNAME, AT_ORIGINNAME FROM
		 * CH_ATTACHMENT WHERE CH_NO=?
		 */

		String sql = prop.getProperty("selectChallengeAt");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				at = new ChallengeAttachment(rset.getInt("AT_NO"),
						 					 rset.getString("AT_NEWNAME"),
						 				     rset.getString("AT_ORIGINNAME"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(at + ": rpat dao");
		return at;
	}


	public ArrayList<ChallengeReply> selectReply(Connection conn, PageInfo pi, int chno) {
		ArrayList<ChallengeReply> list = new ArrayList<ChallengeReply>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectChallengeRp");

		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;
		/*SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM 
		 * (SELECT CH_RP_NO, RP_USER, CREATE_DATE, RP_BODY, PH_ORIGINNAME, PH_NEWNAME, PH_LOCATION, RP_LIKE FROM CHALLENGE_REPLY 
		 * WHERE CH_NO = ?, RP_STATUS = 'Y') A)WHERE RNUM BETWEEN ? AND ?
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ChallengeReply(rset.getInt("CH_RP_NO"),
											rset.getString("NICKNAME"),
											rset.getDate("CREATE_DATE"),
											rset.getString("RP_BODY"),
											rset.getString("PH_ORIGINNAME"),
											rset.getString("PH_NEWNAME"),
											rset.getString("PH_LOCATION"),
											rset.getInt("RP_LIKE")));			
			};

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list +": rplist dao");
		return list;
	}

	public ArrayList<ChallengeVote> selectVote(Connection conn) {

		ArrayList<ChallengeVote> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("voteChallengeList");

		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				list.add(new ChallengeVote(rset.getString("CH_TITLE"), 
										   rset.getString("VOTE_CONTENT"),
										   rset.getString("VOTE_START"), 
										   rset.getString("VOTE_END"), 
										   rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;

	}

	public Challenge selectMyChallenge(Connection conn, String loginUser) {
		Challenge c = new Challenge();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		System.out.println("loginUser dao" + loginUser);
		

		String sql = prop.getProperty("myChallenge");
		/*
		 *myChallenge = SELECT C.CH_NO, C.CH_TITLE, C.CH_START, C.CH_END, T.CATEGORY_NAME 
		 *FROM CHALLENGE C JOIN CHALLENGE_USER U ON C.CH_NO = U.CH_NO 
		 *JOIN CATEGORY T ON C.CATEGORY_NO = T.CATEGORY_NO WHERE U.CH_USER=? AND C.CH_STATUS = 'Y'
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser);

			rset = pstmt.executeQuery();

			while (rset.next()) {			
				c = new Challenge(rset.getInt("CH_NO"),
			   			   		  rset.getString("CH_TITLE"), 
			   			   		  rset.getString("CH_START"),
			   			   		  rset.getString("CH_END"),
			   			   		  rset.getString("CH_STATUS"),
			   			   		  rset.getString("CATEGORY_NAME"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println(c +": myc dao");
				
		return c;
	}
	
	public ArrayList<Challenge> selectMyEndChallenge(Connection conn, PageInfo pi, String loginUser) {
		
		ArrayList<Challenge> list = new ArrayList<Challenge>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		/*
		 *  SELECT *
		 *  FROM (SELECT ROWNUM RNUM, A.* 
		 *  FROM (SELECT CH_TITLE, CH_BODY, CH_START, CH_END, CH_STATUS, CATEGORY_NAME FROM CHALLENGE 
		 *  WHERE CH_STATUS = 'N' AND CH_USER=? ORDER BY CH_END DESC) A)
		 *  WHERE RNUM BETWEEN ? AND ?
		 */

		String sql = prop.getProperty("myEndChallenge");		
		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();			
			
			while (rset.next()) {									
				list.add(new Challenge(rset.getInt("CH_NO"),
									   rset.getString("CH_TITLE"), 
									   rset.getString("CH_START"),
									   rset.getString("CH_END"), 
									   rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(list +": dao");

		return list;
	}
	
	
	public Challenge selectMyChList(Connection conn, String loginUser) {
		
		Challenge c = new Challenge();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("myChallenge");
		/*
		 * myChallenge = SELECT C.CH_NO, C.CH_TITLE, C.CH_START, C.CH_END  C.CATEGORY_NAME 
		 * FROM CHALLENGE C JOIN CHALLENGE_USER U ON C.CH_NO = U.CH_NO WHERE CH_USER=? AND CH_STATUS = 'Y'
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser);

			rset = pstmt.executeQuery();

			while (rset.next()) {			
				c.setChNo(rset.getInt("C.CH_NO"));
				c.setChTitle(rset.getString("C.CH_TITLE"));
				c.setStart(rset.getString("C.CH_START"));
				c.setEnd(rset.getString("C.CH_END"));
				c.setCategoryTitle(rset.getString("C.CATEGORY_NAME"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println(c +": myc dao");
		
		
		
		return c;
	}

	public Challenge selectDetail(Connection conn, int chno) {
		Challenge c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectChallengeInfo");
		/*
		 *	SELECT CH_TITLE, CH_BODY, CH_START, CH_END, CH_STATUS, CATEGORY_NAME 
		 *	FROM CHALLENGE A JOIN CATEGORY B ON A.CATEGORY_NO = B.CATEGORY_NO  WHERE CH_NO= ?
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				c = new Challenge(rset.getString("CH_TITLE"), 
								  rset.getString("CH_BODY"),
								  rset.getString("CH_START"),
								  rset.getString("CH_END"),
								  rset.getString("CH_STATUS"),
								  rset.getString("CATEGORY_NAME"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return c;
	}

	public int insertApply(Connection conn, ChallengeApply ca) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("challengeAp");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ca.getContent());
			pstmt.setString(2, ca.getApUser());
			pstmt.setInt(3, ca.getCategoryNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("챌린지 신청 : " + result);

		return result;
	}

	public ArrayList<ChallengeApply> selectApplyList(Connection conn, PageInfo pi) {
		ArrayList<ChallengeApply> list = new ArrayList<ChallengeApply>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectChallengeApList");
		/*
		 * SELECT AP_NO, AP_BODY, AP_DATE, AP_USER, CATEGORY_NAME FROM CHALLENGE_APPLY A
		 * JOIN CATEGORY C ON A.CATEGORY_NO = C.CATEGORY_NO ORDER BY AP_DATE DESC
		 */

		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ChallengeApply(rset.getInt("AP_NO"), rset.getString("AP_BODY"), rset.getDate("AP_DATE"),
						rset.getString("AP_USER"), rset.getString("CATEGORY_NAME")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int insertVote(Connection conn, ChallengeVote cv) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertVote");
		
		java.sql.Date start = java.sql.Date.valueOf(cv.getStart());
		java.sql.Date end = java.sql.Date.valueOf(cv.getEnd());
		
		System.out.println(start );
		System.out.println(end);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cv.getChTitle());
			pstmt.setInt(2, cv.getApNo());
			pstmt.setDate(3, start);
			pstmt.setDate(4, end);
			pstmt.setString(5, cv.getContent());			
			pstmt.setInt(6, cv.getCategoryNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("투표 등록 : " + result);

		return result;
	}

	public ArrayList<ChallengeApply> selectVoteApList(Connection conn) {
		ArrayList<ChallengeApply> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;

		// SELECT AP_NO, AP_DATE, CATEGORY_NO

		String sql = prop.getProperty("selectVoteApList");

		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				ChallengeApply ca = new ChallengeApply();
				ca.setApNo(rset.getInt("AP_NO"));
				ca.setApDate(rset.getDate("AP_DATE"));
				ca.setCategoryNo(rset.getInt("CATEGORY_NO"));
				list.add(ca);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}
	
	public ArrayList<ChallengeApply> selectMyApplyList(Connection conn, PageInfo pi, String loginUser) {
		ArrayList<ChallengeApply> list = new ArrayList<ChallengeApply>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("myApplyList");
		/*
		 *  SELECT * 
		 *  FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT AP_NO, AP_BODY, AP_DATE, AP_USER, C.CATEGORY_NAME 
		 *  FROM CHALLENGE_APPLY P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO 
		 *  WHERE AP_USER=? ORDER BY AP_DATE DESC) A) 
		 *  WHERE RNUM BETWEEN ? AND ?
		 */

		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ChallengeApply(rset.getInt("AP_NO"), 
											rset.getString("AP_BODY"),
											rset.getDate("AP_DATE"),
											rset.getString("AP_USER"), 
											rset.getString("CATEGORY_NAME")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}


	public ArrayList<ChallengeVote> selectChallengeVoteList(Connection conn) {
		ArrayList<ChallengeVote> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;

		// SELECT CH_TITLE, CH_VOTECOUNT, CATEGORY_NO FROM (SELECT * FROM CH_VOTE ORDER BY CH_VOTECOUNT DESC) WHERE ROWNUM=5
		String sql = prop.getProperty("selectChallengeVoteList");
		System.out.println(sql + "dao");
		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				ChallengeVote cv = new ChallengeVote();
				cv.setChTitle(rset.getString("CH_TITLE"));
				cv.setVoteCount(rset.getInt("VOTE_COUNT"));
				cv.setCategoryNo(rset.getInt("CATEGORY_NO"));
				list.add(cv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		System.out.println(list + "dao");
		return list;
	}

	public int insertChallenge(Connection conn, Challenge c) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChallenge");
		
		java.sql.Date start = java.sql.Date.valueOf(c.getStart());
		java.sql.Date end = java.sql.Date.valueOf(c.getEnd());
		//insertChallenge = INSERT INTO CHALLENGE VALUES(SEQ_CH_NO.NEXTVAL, ?,?,?,?,DEFAULT,?,0,?)	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getChTitle());
			pstmt.setInt(2,c.getVoteCount());
			pstmt.setDate(3, start);
			pstmt.setDate(4, end);
			pstmt.setString(5, c.getContent());
			pstmt.setInt(6, c.getCategoryNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println(c.getChTitle());
			System.out.println(c.getCategoryNo());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("챌린지 dao " + result);
		return result;
	}
	

	public int insertChAttachment(Connection conn, ChallengeAttachment cat) {
		//insertAttachment=INSERT INTO CH_ATTACHMENT VALUES(SEQ_CHAT_NO.NEXTVAL, ?, ?, ?, SEQ_CH_NO.CURVAL)
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		System.out.println(sql + " atdao ");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cat.getNewName());
			pstmt.setString(2, cat.getOriginName());
			pstmt.setString(3, cat.getLocation());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("챌린지at dao " + result);
		return result;
	}

	public int voteCountUp(Connection conn, ChallengeVote cv) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("voteChallenge");
		System.out.println(sql);
		System.out.println(cv.getChTitle());
		
		String title = cv.getChTitle();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public int insertReply(Connection conn, ChallengeReply cp) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChallengeRp");
		
		//insertChallengeRp = INSERT INTO CHALLENGE_REPLY VALUES(SEQ_CHRP_NO.NEXTVAL,?,?,DEFAULT,?,?,?,?,NULL,DEFAULT)	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cp.getChNo());
			pstmt.setString(2, cp.getRpWriter());
			pstmt.setString(3, cp.getContent());
			pstmt.setString(4, cp.getOriginName());
			pstmt.setString(5, cp.getNewName());
			pstmt.setString(6, cp.getLocation());
			
			result = pstmt.executeUpdate();
			
			System.out.println(cp.getChNo() +" rp dao");
			System.out.println(cp.getNewName() +"rp dao");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("챌린지 dao " + result);
		return result;
	}

	public int enrollCh(Connection conn, Challenge cu) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		//insertChUser = INSERT INTO CHALLENGE_USER VALUES(?, ?, 0, DEFAULT)
		
		String sql = prop.getProperty("insertChUser");
		System.out.println(sql);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cu.getUser());
			pstmt.setInt(2, cu.getChNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public Challenge selectTdRp(Connection conn, String loginUser, int chno) {
		
		Challenge cu = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectTdRp");
		/*
		 * selectTdRp = SELECT RP_USER, CH_NO FROM CHALLENGE_REPLY WHERE RP_USER = ? AND CH_NO=? AND CREATE_DATE = SYSDATE 
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,loginUser);
			pstmt.setInt(2, chno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				cu = new Challenge(rset.getString("RP_USER"), 
								  rset.getInt("CH_NO"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("dao cu : " + cu);
		return cu;
		
	}

	public int deleteChallenge(Connection conn, int chno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteChallenge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public int updateUserStatus(Connection conn, int chno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateChallenger");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	







	



	

}
