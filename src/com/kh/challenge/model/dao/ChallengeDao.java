package com.kh.challenge.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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

		return listCount;
	}

	public ArrayList<Challenge> selectList(Connection conn) {

		ArrayList<Challenge> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;

		/*
		 * selectChallengeList = SELECT CH_NO, CH_TITLE, CH_START, CH_END FROM CHALLENGE
		 * WHERE CH_STATUS = 'Y' ORDER BY CH_END ASC
		 */

		String sql = prop.getProperty("selectChallengeList");

		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				Challenge c = new Challenge();
				c.setChNo(rset.getInt("CH_NO"));
				c.setChTitle(rset.getString("CH_TITLE"));
				c.setStart(rset.getDate("CH_START"));
				c.setEnd(rset.getDate("CH_END"));
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

	public ArrayList<ChallengeAttachment> selectAttach(Connection conn, int chNo) {

		ArrayList<ChallengeAttachment> fileList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		/*
		 * selectChallengeAt = SELECT AT_NO, AT_NEWNAME, AT_ORIGINNAME FROM
		 * CH_ATTACHMENT WHERE CH_NO=?
		 */

		String sql = prop.getProperty("selectChallengeAt");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				ChallengeAttachment ca = new ChallengeAttachment();
				ca.setAtNo(rset.getInt("AT_NO"));
				ca.setNewName(rset.getString("AT_NEWNAME"));
				ca.setOriginName(rset.getString("AT_ORIGINNAME"));
				fileList.add(ca);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return fileList;
	}

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
				c.setStart(rset.getDate("CH_START"));
				c.setEnd(rset.getDate("CH_END"));
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

	public ArrayList<ChallengeReply> selectReply(Connection conn, PageInfo pi) {
		ArrayList<ChallengeReply> list = new ArrayList<ChallengeReply>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectChallengeRp");

		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;
		// SELECT CH_RP_NO, RP_USER, CREATE_DATE, RP_BODY, PH_ORIGINNAME, PH_NEWNAME,
		// PH_LOCATION, RP_LIKE FROM CHALLENGE_REPLY WHERE CH_NO = ?, RP_STATUS = 'Y'
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				ChallengeReply ch = new ChallengeReply();
				ch.setChNo(rset.getInt("CH_RP_NO"));
				ch.setRpWriter(rset.getString("RP_USER"));
				ch.setWriteDate(rset.getDate("CREATE_DATE"));
				ch.setContent(rset.getString("RP_BODY"));
				ch.setOriginName(rset.getString("PH_ORIGINNAME"));
				ch.setNewName(rset.getString("PH_NEWNAME"));
				ch.setLocation(rset.getString("PH_LOCATION"));
				ch.setRpLike(rset.getInt("RP_LIKE"));
				list.add(ch);
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

	public ArrayList<ChallengeVote> selectVote(Connection conn) {

		ArrayList<ChallengeVote> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("voteChallengeList");

		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				list.add(new ChallengeVote(rset.getString("CH_TITLE"), rset.getString("CH_VOTE"),
						rset.getDate("VOTE_START"), rset.getDate("VOTE_END"), rset.getString("CATEGORY_NAME")));
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
				list.add(new Challenge(rset.getInt("CH_NO"), rset.getString("CH_TITLE"), rset.getInt("RP_COUNT"),
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

	public ArrayList<Challenge> selectDetail(Connection conn, int chno) {
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("myChallengeAc");
		/*
		 * SELECT CH_TITLE, CH_BODY, CATEGORY_NAME FROM CHALLENGE A JOIN CATEGORY B ON
		 * A.CATEGORY_NO = B.CATEGORY_NO WHERE CH_NO= ?
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Challenge(rset.getString("CH_TITLE"), rset.getString("CH_BODY"),
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
		// INSERT INTO CH_VOTE VALUES(CH_TITLE=?, AP_NO=?, VOTE_START=?,
		// VOTE_END=?,,CATEGORY_NO=?)
		String sql = prop.getProperty("insertVote");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cv.getChTitle());
			pstmt.setString(2, cv.getContent());
			pstmt.setInt(3, cv.getApNo());
			pstmt.setDate(4, (Date) cv.getStart());
			pstmt.setDate(5, (Date) cv.getEnd());
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

		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				ChallengeVote cv = new ChallengeVote();
				cv.setChTitle(rset.getString("CH_TITLE"));
				cv.setVoteCount(rset.getInt("CH_VOTECOUNT"));
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

		return list;
	}

	public int insertChallenge(Connection conn, Challenge c) {
		//insertChallenge = INSERT INTO CHALLENGE VALUES(SEQ_CH_NO.NEXTVAL, ?,?, ?,?,DEFAULT, ?,,?)
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChallenge");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getChTitle());
			pstmt.setInt(2,c.getVoteCount());
			pstmt.setDate(3, (Date) c.getStart());
			pstmt.setDate(4, (Date) c.getEnd());
			pstmt.setString(5, c.getContent());
			pstmt.setInt(6, c.getCategoryNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("쪽지 발송?" + result);
		return result;
	}
	

	public int insertChAttachment(Connection conn, ChallengeAttachment cat) {
		//insertAttachment=INSERT INTO CH_ATTACHMENT VALUES(SEQ_CHAT_NO.NEXTVAL, ?, ?, ?, SEQ_CH_NO.NEXTVAL)
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMsgAttachment");
		
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
		
		return result;
	}

}
