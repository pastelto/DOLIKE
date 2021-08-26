package com.kh.follow.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.follow.model.dao.FollowDao;
import com.kh.follow.model.vo.Follow;
import com.kh.follow.model.vo.FollowPageInfo;
import com.kh.member.model.vo.Member;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageInfo;

public class FollowService {

	public int searchId(String followId) {
		Connection conn = getConnection();
		
		int result = new FollowDao().searchId(conn, followId);
		
		close(conn);
		return result;
	}

	public int insertId(Follow fl) {
		Connection conn = getConnection();
		
		int result = new FollowDao().insertId(conn, fl);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;	
	}

	public ArrayList<Follow> selectList(String userId, FollowPageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Follow> list = new FollowDao().selectList(conn, userId, pi);
		close(conn);
		return list;
	}

	public int countId(String userId, String followId) {
		Connection conn = getConnection();
		
		int result = new FollowDao().countId(conn, userId, followId);
		
		close(conn);
		return result;
	}

	public int getListCount(String userId) {
		Connection conn = getConnection();
		
		int listCount = new FollowDao().getListCount(conn, userId);
		
		close(conn);
		return listCount;
	}

	public int deleteFollow(int fno) {
		Connection conn = getConnection();
		
		int result = new FollowDao().deleteFollow(conn, fno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int followCount(String userId) {
		Connection conn = getConnection();
		
		int result = new FollowDao().followCount(conn, userId);
		
		close(conn);
		return result;
	}

	public Member selectFollowInfo(String followId) {
		Connection conn = getConnection();
		
		Member m = new FollowDao().selectFollowInfo(conn, followId);
		
		close(conn);
		
		return m;
	}

	public int deleteFollowVer2(String userId, String followId) {
		Connection conn = getConnection();
		
		int result = new FollowDao().deleteFollowVer2(conn, userId, followId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
