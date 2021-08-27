package com.kh.admin.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.AdminPageInfo;
import com.kh.member.model.vo.Member;

public class AdminService {

	public int getListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AdminDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	
	public ArrayList<Member> adminMemberList(AdminPageInfo ami) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDao().adminMemberList(conn, ami);
		
		close(conn);
		
		return list;
	}

}
