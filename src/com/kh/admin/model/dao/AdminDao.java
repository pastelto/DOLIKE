package com.kh.admin.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.vo.AdminPageInfo;
import com.kh.category.model.vo.Category;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
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
	
	public int getListCount(Connection conn) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) { // 결과 값이 있으면 화면에 전체를 출력한다.
				listCount = rset.getInt(1); // 컬럼명을 적어주던가 , 숫자를 적어주면 된다.(컬럼명을 적는 것이 좋음)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return listCount;
	}

	public ArrayList<Member> adminMemberList(Connection conn, AdminPageInfo ami) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminMemberList");
		
		int startRow = (ami.getCurrentPage()-1)*ami.getAdminLimit()+1;
		int endRow = startRow + ami.getAdminLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
//			while(rset.next()) {
//				list.add(new Member(rset.getInt("CATEGORY_NO"), 
//								      rset.getString("CATEGORY_NAME")
//						));
//			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
