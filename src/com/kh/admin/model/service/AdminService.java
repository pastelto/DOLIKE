package com.kh.admin.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.AdminPageInfo;
import com.kh.category.model.dao.CategoryDao;
import com.kh.category.model.vo.Category;
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

	public Member selectAdminMember(String amno) {
		
		Connection conn = getConnection();
		
		Member result = new AdminDao().selectAdminMember(conn, amno);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Member> adminBlackList(AdminPageInfo amb) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDao().adminBlackList(conn, amb);
		System.out.println("서비스에서 list 값 : " + list);
		close(conn);
		
		return list;
	}

	public int getBlackListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AdminDao().getBlackListCount(conn);
		
		close(conn);
		
		return listCount;
	}
}
