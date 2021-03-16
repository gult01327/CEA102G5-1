package com.recipe_report.model;

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

public class RecrDAO implements RecrDAO_interface {
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
	private static final String INSERT_STMT ="INSERT INTO RECIPE_REPORT (REC_ID,MEM_ID,RECR_CONTENT,RECR_STATUS) VALUES(?,?,?,?)";
	private static final String GET_ALL_BY_STATUS = "SELECT RECR_ID,E.REC_ID,REC_NAME,E.MEM_ID,RECR_CONTENT,RECR_REPLY,RECR_STATUS,RECR_TIME \r\n" + 
			"FROM RECIPE_REPORT E LEFT JOIN RECIPE R ON E.REC_ID = R.REC_ID\r\n" + 
			"WHERE RECR_STATUS = ?";
	private static final String UPDATE_RECR_REPLY = "UPDATE RECIPE_REPORT SET RECR_REPLY=?,RECR_STATUS=? WHERE RECR_ID=?";
	@Override
	public void addReport(RecrVO recrVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, recrVO.getRecID());
			pstmt.setInt(2, recrVO.getMemID());
			pstmt.setString(3, recrVO.getRecrContent());
			pstmt.setInt(4, 0);
			
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
	@Override
	public List<RecrVO> getAllRecrByStatus(Integer status) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		RecrVO recrVO = null;
		List<RecrVO> list = new ArrayList<RecrVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_STATUS);
			pstmt.setInt(1, status);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recrVO = new RecrVO();
				recrVO.setRecrID(rs.getInt("RECR_ID"));
				recrVO.setRecID(rs.getInt("REC_ID"));
				recrVO.setRecName(rs.getString("REC_NAME"));
				recrVO.setMemID(rs.getInt("MEM_ID"));
				recrVO.setRecrContent(rs.getString("RECR_CONTENT"));
				recrVO.setRecrReplyContent(rs.getString("RECR_REPLY"));
				recrVO.setRecrStatus(rs.getInt("RECR_STATUS"));
				recrVO.setRecrTime(rs.getDate("RECR_TIME"));
				
				list.add(recrVO);
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
		return list;
	}
	@Override
	public void updateReply(RecrVO recrVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_RECR_REPLY);
			pstmt.setString(1, recrVO.getRecrReplyContent());
			pstmt.setInt(2, recrVO.getRecrStatus());
			pstmt.setInt(3, recrVO.getRecrID());
			
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
