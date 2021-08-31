package com.kh.myFavBoard.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.category.model.dao.CategoryDao;
import com.kh.category.model.vo.Category;
import com.kh.myFavBoard.model.dao.FavBoardDao;
import com.kh.myFavBoard.model.vo.myFavBoard;

public class myFBService {

	public ArrayList<myFavBoard> getMyFavBoardList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<myFavBoard> flist = new FavBoardDao().getMyFavBoardList(conn, userId);
		
		close(conn);
		
		System.out.println("getMyFavBoardList의 flist 값 : " +  flist);
		return flist;
	}

}
