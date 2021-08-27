package com.kh.challenge.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.challenge.model.vo.Challenge;
import com.kh.challenge.model.vo.ChallengeApply;
import com.kh.challenge.model.vo.ChallengeAttachment;
<<<<<<< HEAD
=======
import com.kh.challenge.model.vo.ChallengeReply;
import com.kh.challenge.model.vo.ChallengeVote;
import com.kh.challenge.model.vo.PageInfo;
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626

public class ChallengeDao {

	private Properties prop = new Properties();

	public ChallengeDao() {
		String fileName = ChallengeDao.class.getResource("/sql/challenge/challenge-query.properties").getPath();
<<<<<<< HEAD
		System.out.println("fileName   " + fileName);
=======

>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
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
<<<<<<< HEAD

	public ArrayList<Challenge> selectList(Connection conn) {
		
		ArrayList<Challenge> list = new ArrayList<>();
=======

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null; // 파라미터에서 받아오지 않아도 되기 떄문에 --> 전체 받아올 것
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql); // 쿼리실행

			if (rset.next()) {
				listCount = rset.getInt("CH_NO"); // 컬럼명을 적어도 되고 컬럼인덱스로 적어도 된다.
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

	public ArrayList<Challenge> selectList(Connection conn) {

		ArrayList<Challenge> list = new ArrayList<Challenge>();
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		/*
		 * selectChallengeList = SELECT CH_NO, CH_TITLE, CH_START, CH_END FROM CHALLENGE
		 * WHERE CH_STATUS = 'Y' ORDER BY CH_END ASC
		 */

		String sql = prop.getProperty("selectChallengeList");
		System.out.println(sql);

		try {
<<<<<<< HEAD

			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Challenge c = new Challenge();
				c.setChNo(rset.getInt("CH_NO"));
				c.setChTitle(rset.getString("CH_TITLE"));
				c.setStart(rset.getDate("CH_START"));
				c.setEnd(rset.getDate("CH_END"));
				list.add(c);
=======
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();			
			
			while (rset.next()) {									
				list.add(new Challenge(rset.getInt("CH_NO"),
									   rset.getString("CH_TITLE"), 
									   rset.getString("CH_START"),
									   rset.getString("CH_END"), 
									   rset.getString("CATEGORY_NAME")));
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
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

<<<<<<< HEAD
	public ArrayList<ChallengeAttachment> selectAttach(Connection conn, int[] arr) {
=======
	//MAIN
	public ArrayList<ChallengeAttachment> selectAttach(Connection conn) {
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		
		ArrayList<ChallengeAttachment> fileList = new ArrayList<ChallengeAttachment>();
		ResultSet rset = null;
<<<<<<< HEAD
		
		/*selectChallengeAt = SELECT AT_NO, AT_NEWNAME, AT_ORIGINNAME FROM CH_ATTACHMENT WHERE CH_NO=?*/
		
		
=======
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

>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		String sql = prop.getProperty("selectChallengeAt");

		try {
			pstmt = conn.prepareStatement(sql);
<<<<<<< HEAD
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ChallengeAttachment ca = new ChallengeAttachment();
				ca.setAtNo(rset.getInt("AT_NO"));
				ca.setNewName(rset.getString("AT_NEWNAME"));
				ca.setOriginName(rset.getString("AT_ORIGINNAME"));
				
				for(int i=0; i <= arr.length ; i++) {
					ca.setChNo(rset.getInt(arr[i]));
					break;
				}
				
				fileList.add(ca);
=======
			pstmt.setInt(1, chno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				at = new ChallengeAttachment(rset.getInt("AT_NO"),
						 					 rset.getString("AT_NEWNAME"),
						 				     rset.getString("AT_ORIGINNAME"));
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
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

<<<<<<< HEAD
=======
	public ArrayList<Challenge> selectEndedList(Connection conn) {
		ArrayList<Challenge> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;

		/*
		 * selectChallengeList = SELECT CH_NO, CH_TITLE, CH_START, CH_END FROM CHALLENGE
		 * WHERE CH_STATUS = 'N' ORDER BY CH_END ASC
		 */

		String sql = prop.getProperty("selectEndChallenge");

		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				Challenge c = new Challenge();
				c.setChNo(rset.getInt("CH_NO"));
				c.setChTitle(rset.getString("CH_TITLE"));
				c.setStart(rset.getString("CH_START"));
				c.setEnd(rset.getString("CH_END"));
				list.add(c);
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
											rset.getString("RP_USER"),
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

	public ArrayList<Challenge> selectMyChallenge(Connection conn, String loginUser) {
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("myChallengeAc");
		/*
		 * SELECT CH_NO, CH_TITLE, RP_COUNT, ACHIEVEMENT FROM CHALLENGE C JOIN
		 * CHALLENGE_USER U ON C.CH_NO = U.CH_NO WEHRE CH_USER = ?
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Challenge(rset.getInt("CH_NO"), 
									   rset.getString("CH_TITLE"), 
									   rset.getInt("RP_COUNT"),
									   rset.getString("ACHIEVEMENT")));
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

	public Challenge selectDetail(Connection conn, int chno) {
		Challenge c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectChallengeInfo");
		/*
		 * SELECT CH_TITLE, CH_BODY, CATEGORY_NAME FROM CHALLENGE A JOIN CATEGORY B ON
		 * A.CATEGORY_NO = B.CATEGORY_NO WHERE CH_NO= ?
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				c = new Challenge(rset.getString("CH_TITLE"), 
								  rset.getString("CH_BODY"),
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

	

>>>>>>> 83361499e0173ac1696b69f06884aac4475dca14
}
