package com.kh.dlmain.model.dao;

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
import com.kh.dlmain.model.vo.DLMain;

public class MainDao {
	
	private Properties prop = new Properties();
	
	public MainDao() {
		String fileName = MainDao.class.getResource("/sql/main/main-query.properties").getPath();
		System.out.println("fileName: " + fileName);
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
	
	// 전체 인기 게시글 선택 
	public ArrayList<DLMain> selectTopList(Connection conn) {
		ArrayList<DLMain> bTopList = new ArrayList<DLMain>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTopList1");
		/*
		 * String bno = "BNO"; String bno = "BTITLE"; String bno = "WRITER"; String bno
		 * = "VCOUNT"; String bno = "CNO"; String bno = "FNO"; String bno = "FONAME";
		 * String bno = "FNNAME";
		 */
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			System.out.println("1. rset? " + rset);
			while(rset.next()) {
				bTopList.add(new DLMain(rset.getInt("BNO"), 
									  rset.getString("BTITLE"),
								      rset.getString("WRITER"),
								      rset.getInt("VCOUNT"),
								      rset.getInt("CNO"),
								      rset.getString("CNAME"),
								      rset.getInt("FNO"),
								      rset.getString("FONAME"),
								      rset.getString("FNNAME")
					      ));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("bTopList? : " + bTopList);
		return bTopList;
	}
	
	// 카테고리 리스트 
	public ArrayList<Category> categoryList(Connection conn) {
		ArrayList<Category> cList = new ArrayList<Category>();
		Statement stmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				cList.add(new Category(rset.getInt("CATEGORY_NO"), 
								      rset.getString("CATEGORY_NAME")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		System.out.println("cList? : " + cList);
		return cList;
	}
	
	// 카테고리 별 인기 게시글
	public ArrayList<Board> selectEachBoardTopList(Connection conn, String cTitle) {
		ArrayList<Board> eList = new ArrayList<Board>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectEachBoardTopList");


		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cTitle);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				eList.add(new Board(rset.getInt("BOARD_NO"), 
					      rset.getString("NICKNAME"),
					      rset.getString("BOARD_TITLE"),
					      rset.getInt("VIEWS"),
					      rset.getInt("CATEGORY_NO")
					      ));
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("eList? : " + eList);
		return eList;
	}

}
