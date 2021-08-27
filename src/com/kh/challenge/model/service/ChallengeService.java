package com.kh.challenge.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

<<<<<<< HEAD
import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
=======
>>>>>>> 83361499e0173ac1696b69f06884aac4475dca14
import com.kh.challenge.model.dao.ChallengeDao;
import com.kh.challenge.model.vo.Challenge;
import com.kh.challenge.model.vo.ChallengeApply;
import com.kh.challenge.model.vo.ChallengeAttachment;
import com.kh.challenge.model.vo.ChallengeReply;
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

<<<<<<< HEAD
	public ArrayList<ChallengeAttachment> selectAttach(int[] arr) {
		
		Connection conn = getConnection();
		
		ArrayList<ChallengeAttachment> filelist = new ChallengeDao().selectAttach(conn, arr);
=======
	}
	// detail at
	public ChallengeAttachment selectAttach(int chNo) {
		
		Connection conn = getConnection();
		
		ChallengeAttachment at = new ChallengeDao().selectAttach(conn, chNo);
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		
		close(conn);
		System.out.println(at +": servlet");
		
		return at;
		
	
	}

<<<<<<< HEAD
	public ArrayList<ChallengeReply> selectDetail() {
		// TODO Auto-generated method stub
		return null;
=======
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
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<ChallengeReply> selectReply(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
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
		
		// 첨부파일

		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		System.out.println(result);
		return result;
	}

}
