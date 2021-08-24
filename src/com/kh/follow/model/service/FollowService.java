package com.kh.follow.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.follow.model.dao.FollowDao;

public class FollowService {

	public int searchId(String followId) {
		Connection conn = getConnection();
		
		int result = new FollowDao().searchId(conn, followId);
		
		close(conn);
		return result;
	}

}
