package com.kh.common.searchMember.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.searchMember.model.dao.searchDao;
import com.kh.member.model.vo.Member;
import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;

public class searchService {

	public ArrayList<Member> getUserList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new searchDao().selectSearchUserList(conn, userId);
		close(conn);
		
		return list;
	}

	public int getSearchUserListCount(String userId) {
		Connection conn = getConnection();
		
		int count = new searchDao().getSearchUserListCount(conn, userId);
		close(conn);
		
		return count;
	}

}
