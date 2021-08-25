package com.kh.challenge.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.challenge.model.dao.ChallengeDao;
import com.kh.challenge.model.vo.Challenge;
import com.kh.challenge.model.vo.ChallengeApply;
import com.kh.challenge.model.vo.ChallengeAttachment;
import com.kh.challenge.model.vo.ChallengeReply;
import com.kh.challenge.model.vo.ChallengeVote;
import com.kh.challenge.model.vo.PageInfo;
import com.kh.message.model.dao.MessageDao;


public class ChallengeService {

	public ArrayList<Challenge> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Challenge> list = new ChallengeDao().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<ChallengeAttachment> selectAttach(int chNo) {
		
		Connection conn = getConnection();
		
		ArrayList<ChallengeAttachment> filelist = new ChallengeDao().selectAttach(conn, chNo);
		
		close(conn);
		
		return filelist;
		
	}

	public int getListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ChallengeDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<ChallengeReply> selectReply(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<ChallengeReply> list = new ChallengeDao().selectReply(conn, pi);
		
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

	public ArrayList<Challenge> selectMyChallenge(String loginUser) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> list = new ChallengeDao().selectMyChallenge(conn, loginUser);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Challenge> selectDetail(int chno) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> list = new ChallengeDao().selectDetail(conn, chno);
		
		close(conn);
		
		return list;
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

	public ArrayList<ChallengeAttachment> selectAttach() {
		// TODO Auto-generated method stub
		return null;
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

}
