package com.kh.common.searchMember.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.searchMember.model.dao.searchDao;
import com.kh.member.model.vo.Member;
import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgPageInfo;

public class searchService {

	public ArrayList<Member> getUserList(String userId, String searchWord, MsgPageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new searchDao().selectSearchUserList(conn, userId, searchWord, pi);
		close(conn);
		
		return list;
	}

	public int getSearchUserListCount(String userId, String searchWord) {
		Connection conn = getConnection();
		
		int count = new searchDao().getSearchUserListCount(conn, userId, searchWord);
		close(conn);
		
		return count;
	}

}
