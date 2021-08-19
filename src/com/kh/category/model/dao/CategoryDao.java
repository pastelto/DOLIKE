package com.kh.category.model.dao;

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

import com.kh.board.model.vo.Board;
import com.kh.category.model.vo.Category;
import com.kh.category.model.vo.CategoryPageInfo;
import com.kh.member.model.dao.MemberDao;

public class CategoryDao {

	private Properties prop = new Properties();
	
	public CategoryDao() { //sql 문을 불러오기 위한 연결 코드 작성함

		String fileName = MemberDao.class.getResource("/sql/category/category-query.properties").getPath();
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

	public ArrayList<Category> categoryList(Connection conn, CategoryPageInfo ca) {
		
		ArrayList<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("categoryList");
		
		int startRow = (ca.getCurrentPage()-1)*ca.getCategoryLimit()+1;
		int endRow = startRow + ca.getCategoryLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("BOARD_NO"), //Board의 생성자를 사용해서
								      rset.getString("CATEGORY_NAME")
								      // 추후에 게시판과 연동 시켜야 할것으로 보임 일단 카테고리만 보이게끔 작성
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 화면에 뛰우기 위함
		
		return list;
	}

}
