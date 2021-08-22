package com.kh.category.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.category.model.dao.CategoryDao;
import com.kh.category.model.vo.Category;
import com.kh.category.model.vo.CategoryPageInfo;


public class CategoryService {

	
	public int getListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new CategoryDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	
	public ArrayList<Category> categoryList(CategoryPageInfo ca) {

		Connection conn = getConnection();
		
		ArrayList<Category> list = new CategoryDao().categoryList(conn, ca);
		
		close(conn);
		
		return list;
	}


	public int insertCatogory(Category cat) {
		
		Connection conn = getConnection();
		
		int result = new CategoryDao().insertCategory(conn, cat);
		
		System.out.println(cat);
		System.out.println("1. null 발생함");
		System.out.println(result);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public Category selectCategory(int cno) { // 카테고리 선
		
		Connection conn = getConnection();
		
		int result = new CategoryDao().increaseCount(conn, cno);
		
		//int result = new CategoryDao().selectCategory(conn, cno);
		
		Category c = null;
		if(result > 0) {
			commit(conn);
			c= new CategoryDao().selectCategory(conn, cno);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return c;
	}

	

}

