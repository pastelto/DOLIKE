package com.kh.admin.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.AdminPageInfo;
import com.kh.member.model.vo.Member;

public class AdminService {

	public ArrayList<Member> adminMemberList(AdminPageInfo ami) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDao().adminMemberList(conn, ami);
		System.out.println("서비스에서 list 값 : " + list);
		close(conn);
		
		return list;
	}

	public int getListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AdminDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
}
