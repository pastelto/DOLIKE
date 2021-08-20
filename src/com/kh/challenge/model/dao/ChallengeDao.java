package com.kh.challenge.model.dao;

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

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.challenge.model.vo.Challenge;
import com.kh.challenge.model.vo.ChallengeAttachment;

public class ChallengeDao {
	
	private Properties prop = new Properties();
	
	public ChallengeDao() {
		String fileName = ChallengeDao.class.getResource("/sql/challenge/challenge-query.properties").getPath();
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

	public ArrayList<Challenge> selectList(Connection conn) {
		
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		/*selectChallengeList = SELECT CH_NO, CH_TITLE, CH_START, CH_END FROM CHALLENGE WHERE CH_STATUS = 'Y' ORDER BY CH_END ASC*/

		String sql = prop.getProperty("selectChallengeList");

		try {

			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Challenge c = new Challenge();
				c.setChNo(rset.getInt("CH_NO"));
				c.setChTitle(rset.getString("CH_TITLE"));
				c.setStart(rset.getDate("CH_START"));
				c.setEnd(rset.getDate("CH_END"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<ChallengeAttachment> selectAttach(Connection conn, int[] arr) {
		
		ArrayList<ChallengeAttachment> fileList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		/*selectChallengeAt = SELECT AT_NO, AT_NEWNAME, AT_ORIGINNAME FROM CH_ATTACHMENT WHERE CH_NO=?*/
		
		
		String sql = prop.getProperty("selectChallengeAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ChallengeAttachment ca = new ChallengeAttachment();
				ca.setAtNo(rset.getInt("AT_NO"));
				ca.setNewName(rset.getString("AT_NEWNAME"));
				ca.setOriginName(rset.getString("AT_ORIGINNAME"));
				
				for(int i=0; i <= arr.length ; i++) {
					ca.setChNo(rset.getInt(arr[i]));
					break;
				}
				
				fileList.add(ca);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return fileList;
	}

}
