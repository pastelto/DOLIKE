package com.kh.myFavBoard.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.category.model.vo.Category;
import com.kh.member.model.dao.MemberDao;
import com.kh.myFavBoard.model.vo.myFavBoard;

public class FavBoardDao {
	
	
	private Properties prop = new Properties();
	
	public FavBoardDao() { //sql 문을 불러오기 위한 연결 코드 작성함

		String fileName = FavBoardDao.class.getResource("/sql/favboard/favboard-query.properties").getPath();
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

	public ArrayList<myFavBoard> getMyFavBoardList(Connection conn, String userId) {
		ArrayList<myFavBoard> flist = new ArrayList<myFavBoard>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMyFavBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				flist.add(new myFavBoard(
								rset.getInt("CATEGORY_NO"),
								rset.getString("FB_TITLE")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("myFavBoard의 flist 값 : " + flist);
		return flist;
	}

}
