package com.kh.challenge.model.service;

import static com.kh.common.JDBCTemplate.*;

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
		
		close(conn);
		
		return list;
	}

	public ArrayList<ChallengeAttachment> selectAttach(int[] arr) {
		
		Connection conn = getConnection();
		
		ArrayList<ChallengeAttachment> filelist = new ChallengeDao().selectAttach(conn, arr);
		
		close(conn);
		
		return filelist;
		
	
	}

	public ArrayList<ChallengeReply> selectDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<ChallengeReply> selectReply(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
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

}
