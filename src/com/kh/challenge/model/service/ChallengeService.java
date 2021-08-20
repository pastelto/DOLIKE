package com.kh.challenge.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.challenge.model.dao.ChallengeDao;
import com.kh.challenge.model.vo.Challenge;
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

}
