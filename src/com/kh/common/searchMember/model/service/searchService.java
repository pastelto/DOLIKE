package com.kh.common.searchMember.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.searchMember.model.dao.searchDao;
import com.kh.common.searchMember.model.vo.SearchListPageInfo;
import com.kh.member.model.vo.Member;

public class searchService {

	public ArrayList<Member> getUserList(String userId, String searchWord, String choice,  SearchListPageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new searchDao().selectSearchUserList(conn, userId, searchWord, choice, pi);
		close(conn);
		
		return list;
	}

	public int getSearchUserListCount(String userId, String searchWord, String choice) {
		Connection conn = getConnection();
		
		int count = new searchDao().getSearchUserListCount(conn, userId, searchWord, choice);
		close(conn);
		
		return count;
	}

}
