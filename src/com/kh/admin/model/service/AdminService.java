package com.kh.admin.model.service;

import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.AdminPageInfo;
import com.kh.board.model.vo.Board;
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
		System.out.println("서비스에서 listCount 값 : " + listCount);
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
		System.out.println("서비스에서 black list의 값 : " + list);
		close(conn);
		
		return list;
	}

	public int getBlackListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AdminDao().getBlackListCount(conn);
		System.out.println("서비스에서 listCount 값 : " + listCount);
		close(conn);
		
		return listCount;
	}

	public int getBoardListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AdminDao().getBoardListCount(conn);
		System.out.println("서비스에서 listCount 값 : " + listCount);
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> adminBoardList(AdminPageInfo amb) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new AdminDao().adminBoardList(conn, amb);
		System.out.println("서비스에서 board list 값 : " + list);
		close(conn);
		
		return list;
	}

	public int restoreMember(String status, String userId) {
		
		Connection conn = getConnection();
		
		int result = new AdminDao().restoreMember(conn, status, userId);
		
		if(result > 0) {
	         commit(conn);
	      }else {
	         rollback(conn);
	      }
	      
	      close(conn);
	      
	      return result;
		
	}

	
}
