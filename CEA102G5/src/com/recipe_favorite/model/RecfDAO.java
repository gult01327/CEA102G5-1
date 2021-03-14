package com.recipe_favorite.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RecfDAO implements RecfDAO_interface {
	private static DataSource ds = null;
	static {
		
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_FAVORITE ="INSERT INTO RECIPE_FAVORITE (MEM_ID,REC_ID) VALUES (?,?)";
	private static final String DELETE_FAVORITE ="DELETE FROM RECIPE_FAVORITE WHERE MEM_ID=? AND REC_ID=?";
	private static final String GET_ALL_BY_MEMID ="SELECT * FROM RECIPE_FAVORITE WHERE MEM_ID=?";
	@Override
	public void insertByMemID(Integer memID, Integer recID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_FAVORITE);
			pstmt.setInt(1, memID);
			pstmt.setInt(2, recID);
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}
	@Override
	public void deleteByMemIDRecID(Integer memID, Integer recID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_FAVORITE);
			pstmt.setInt(1, memID);
			pstmt.setInt(2, recID);
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	
	}
	@Override
	public List<RecfVO> getAllByMemID(Integer memID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecfVO> list = new ArrayList<RecfVO>();
		RecfVO recfVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_MEMID);
			pstmt.setInt(1, memID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recfVO = new RecfVO();
				recfVO.setMemID(rs.getInt("MEM_ID"));
				recfVO.setRecID(rs.getInt("REC_ID"));
				
				list.add(recfVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs !=null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
}
