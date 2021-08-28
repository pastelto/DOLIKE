package com.kh.challenge.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.challenge.model.dao.ChallengeDao;
import com.kh.challenge.model.vo.Challenge;
import com.kh.challenge.model.vo.ChallengeApply;
import com.kh.challenge.model.vo.ChallengeAttachment;
import com.kh.challenge.model.vo.ChallengeReply;
import com.kh.challenge.model.vo.ChallengeVote;
import com.kh.challenge.model.vo.PageInfo;


public class ChallengeService {

	public ArrayList<Challenge> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Challenge> list = new ChallengeDao().selectList(conn);
		System.out.println(list +": service");
		
		close(conn);
		
		return list;
	}
	//main at
	public ArrayList<ChallengeAttachment> selectAttach() {
		
		Connection conn = getConnection();
		
		ArrayList<ChallengeAttachment> fileList = new ChallengeDao().selectAttach(conn);
		
		close(conn);
		System.out.println(fileList +": servlet");
		
		return fileList;

	}
	// detail at
	public ChallengeAttachment selectAttach(int chNo) {
		
		Connection conn = getConnection();
		
		ChallengeAttachment at = new ChallengeDao().selectAttach(conn, chNo);
		
		close(conn);
		System.out.println(at +": servlet");
		
		return at;
		
	}

	public int getListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ChallengeDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<ChallengeReply> selectReply(PageInfo pi, int chno) {
		Connection conn = getConnection();
		
		ArrayList<ChallengeReply> list = new ChallengeDao().selectReply(conn, pi, chno);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Challenge> selectEndedList() {
		Connection conn = getConnection();
		
		ArrayList<Challenge> list = new ChallengeDao().selectEndedList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<ChallengeVote> selectVote() {
		Connection conn = getConnection();
		
		ArrayList<ChallengeVote> list = new ChallengeDao().selectVote(conn);
		
		close(conn);
		
		return list;
	}

	public Challenge selectMyChallenge(String loginUser) {
		Connection conn = getConnection();
		
		Challenge c = new ChallengeDao().selectMyChallenge(conn, loginUser);
		
		close(conn);
		System.out.println(loginUser +" myc service user");
		System.out.println(c +": myc service");
		
		return c;
	}
	
	public ArrayList<Challenge> selectMyEndChallenge(String loginUser) {

		Connection conn = getConnection();
		ArrayList<Challenge> list = new ChallengeDao().selectMyEndChallenge(conn, loginUser);		
		
		close(conn);
		
		return list;
	}
	

	public Challenge selectDetail(int chno) {
		Connection conn = getConnection();
		
		Challenge c = new ChallengeDao().selectDetail(conn, chno);
		
		close(conn);
		
		return c;
	}


	public int insertApply(ChallengeApply ca) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().insertApply(conn, ca);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<ChallengeApply> selectApplyList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<ChallengeApply> list = new ChallengeDao().selectApplyList(conn, pi);
		close(conn);
		return list;
	}

	public int insertVote(ChallengeVote cv) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().insertVote(conn, cv);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<ChallengeApply> selectVoteApList() {
		Connection conn = getConnection();
		ArrayList<ChallengeApply> list = new ChallengeDao().selectVoteApList(conn);
		close(conn);
		return list;
	}

	public ArrayList<ChallengeVote> selectChallengeVoteList() {
		Connection conn = getConnection();
		ArrayList<ChallengeVote> list = new ChallengeDao().selectChallengeVoteList(conn);
		close(conn);
		System.out.println(list + "service");
		return list;
	}

	public int insertChallenge(Challenge c, ChallengeAttachment cat) {
		Connection conn = getConnection();
		
		// 챌린지
		int result1 = new ChallengeDao().insertChallenge(conn, c);
		
		// 첨부파일
		int result2 = 1;
		if(cat != null) {
			result2 = new ChallengeDao().insertChAttachment(conn, cat);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		System.out.println(result1 * result2);
		return result1 * result2;
	}

	public int voteCountUp(ChallengeVote cv) {
		Connection conn = getConnection();
		int result = new ChallengeDao().voteCountUp(conn, cv);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int insertReply(ChallengeReply cp) {
		Connection conn = getConnection();
		
		// 챌린지
		int result = new ChallengeDao().insertReply(conn, cp);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		System.out.println(result);
		return result;
	}
	
	public int enrollCh(Challenge cu) {
		Connection conn = getConnection();
		int result = new ChallengeDao().enrollCh(conn, cu);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Challenge selectTdRp(String loginUser, int chno) {
		
		Connection conn = getConnection();
		Challenge cu = new ChallengeDao().selectTdRp(conn, loginUser, chno);
		close(conn);
		System.out.println(cu + "service");
		return cu;
	}
	
	public int deleteChallenge(int chno) {
		
		Connection conn = getConnection();
		
		int result = new ChallengeDao().deleteChallenge(conn, chno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	public int updateUserStatus(int chno) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().updateUserStatus(conn, chno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	


}
