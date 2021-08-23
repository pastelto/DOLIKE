package com.kh.follow.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.dao.MemberDao;

public class FollowDao {

	private Properties prop = new Properties();

	public FollowDao() {
		String fileName = FollowDao.class.getResource("/sql/follow/follow-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	public int searchId(Connection conn, String followId) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, followId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { //값이 있으면 해당 아이디를 사용하는 사용자가 있는 상태
				result = rset.getInt(1); //하나만 있어서 이렇게 하나 여러개면 컬럼명 명시 필요
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}
