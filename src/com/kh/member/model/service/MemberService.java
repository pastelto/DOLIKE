package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		
		return loginUser;
	}
	
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao().selectMember(conn, userId);
		close(conn);
		
		return mem;
	}
	
	public Member updateMember(String userId, String userPwd, String nickname, String interests) {
		Connection conn = getConnection();
		Member updateMem = null;
		int result = new MemberDao().updateMember(conn, userId, userPwd, nickname, interests);
		
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}
	
	public int deleteMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
		
	
	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}


	public int nickCheck(String nickName) {
		Connection conn = getConnection();
		
		int result = new MemberDao().nickCheck(conn, nickName);
		
		close(conn);
		
		return result;
	}


	public int phoneCheck(String phone) {
		Connection conn = getConnection();
		
		int result = new MemberDao().phoneCheck(conn, phone);
		
		close(conn);
		
		return result;
	}


	public int emailCheck(String email) {
		Connection conn = getConnection();
		
		int result = new MemberDao().emailCheck(conn, email);
		
		close(conn);
		
		return result;
	}


	public int accessUpdate(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().accessUpdate(conn, userId, userPwd);
		
		close(conn);
		
		return result;
	}

	
}