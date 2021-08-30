package com.kh.main.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Board;
import com.kh.category.model.vo.Category;
import com.kh.follow.model.dao.FollowDao;
import com.kh.follow.model.vo.Follow;
import com.kh.main.model.dao.MainDao;

public class MainService {

	public ArrayList<Board> selectTopList() {
		Connection conn = getConnection();
		
		ArrayList<Board> bAllList = new MainDao().selectTopList(conn);
		close(conn);
		return bAllList;
	}

	public ArrayList<Category> getCList() {
		Connection conn = getConnection();
		
		ArrayList<Category> catList = new MainDao().categoryList(conn);
		close(conn);
		return catList;	
}

	public ArrayList<Board> selectEachBoardTopList(String cTitle) {
		Connection conn = getConnection();
		ArrayList<Board> eList = new MainDao().selectEachBoardTopList(conn, cTitle);
		close(conn);
		return eList;
	}

}
