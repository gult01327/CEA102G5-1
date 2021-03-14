package com.recipe_board.model;

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

public class RecbDAO implements RecbDAO_interface {
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
	
	private static final String INSERT_STMT = "INSERT INTO RECIPE_BOARD (REC_ID,MEM_ID,RECB_CONTENT) VALUES (?,?,?)";
	private static final String GET_ALL_BY_RECID_STMT = "SELECT RECB_ID,REC_ID,B.MEM_ID,MEM_NAME,RECB_CONTENT,RECB_STATUS,RECB_TIME\r\n" + 
			"FROM RECIPE_BOARD B LEFT JOIN MEMBER_INFO M ON B.MEM_ID=M.MEM_ID\r\n" + 
			"WHERE REC_ID = ? ORDER BY RECB_ID;";
	private static final String DELETE_BY_RECBID = "DELETE FROM RECIPE_BOARD WHERE RECB_ID=?";
	@Override
	public RecbVO insertMsg(RecbVO recbVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			int cols[]= {1};
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			pstmt.setInt(1, recbVO.getRecID());
			pstmt.setInt(2, recbVO.getMemID());
			pstmt.setString(3, recbVO.getRecbContent());
			
			pstmt.executeUpdate();
			
			Integer recbID = null;
			rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				recbID = rs.getInt(1);
				recbVO.setRecbID(recbID);
				System.out.println("Auto PKID is  " + recbID +"(success!)");
			}else {
				System.out.println("fail to get AutoID");
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					// TODO Auto-generated catch block
					se.printStackTrace(System.err);
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace(System.err);
				}
			}
		}
		return recbVO;
	}

	@Override
	public List<RecbVO> getAllByRecID(Integer recID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecbVO> list = new ArrayList<RecbVO>();
		RecbVO recbVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_RECID_STMT);
			pstmt.setInt(1, recID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recbVO = new RecbVO();
				recbVO.setRecbID(rs.getInt("RECB_ID"));
				recbVO.setRecID(rs.getInt("REC_ID"));
				recbVO.setMemID(rs.getInt("MEM_ID"));
				recbVO.setMemName(rs.getString("MEM_NAME"));
				recbVO.setRecbContent(rs.getString("RECB_CONTENT"));
				recbVO.setRecbStatus(rs.getInt("RECB_STATUS"));
				recbVO.setRecbTime(rs.getTimestamp("RECB_TIME"));
				recbVO.setRecbTimeLong((recbVO.getRecbTime().getTime())/1000);
				
				list.add(recbVO);
			}
			
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if (rs != null) {
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

	@Override
	public void deleteByRecbID(Integer recbID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_BY_RECBID);
			pstmt.setInt(1, recbID);
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					// TODO Auto-generated catch block
					se.printStackTrace(System.err);
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

}
