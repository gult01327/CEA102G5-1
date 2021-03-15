package com.recipeb_report.model;

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

import com.util.model.RecbrUtilVO;

public class RecbrDAO implements RecbrDAO_interface {
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
	private static final String INSERT_STMT ="INSERT INTO RECIPEB_REPORT (RECB_ID,MEM_ID,RECBR_CONTENT,RECBR_STATUS) VALUES (?,?,?,?)";
	private static final String GET_ALL_RECBRREPORT_BY_STATUS = "SELECT B.RECB_ID,REC_ID,B.MEM_ID as B_MEM_ID,RECB_CONTENT,RECB_STATUS,RECBR_ID,R.MEM_ID,RECBR_CONTENT,\r\n" + 
			"RECBR_STATUS,RECBR_REPLY\r\n" + 
			"FROM RECIPEB_REPORT R LEFT JOIN RECIPE_BOARD B ON R.RECB_ID = B.RECB_ID\r\n" + 
			"WHERE RECBR_STATUS=? ORDER BY RECBR_ID";
	private static final String UPDATE_RECBR_REPLY="UPDATE RECIPEB_REPORT SET RECBR_REPLY=? ,RECBR_STATUS=? WHERE RECBR_ID=?";
	@Override
	public void addrecbReport(RecbrVO recbrVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, recbrVO.getRecbID());
			pstmt.setInt(2, recbrVO.getMemID());
			pstmt.setString(3, recbrVO.getRecbrContent());
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
	public List<RecbrUtilVO> getAllRecbrforBackEnd(Integer recbrStatus) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<RecbrUtilVO> list = new ArrayList<RecbrUtilVO>();
		RecbrUtilVO recbrUtilVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_RECBRREPORT_BY_STATUS);
			pstmt.setInt(1, recbrStatus);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recbrUtilVO = new RecbrUtilVO();
				recbrUtilVO.setRecbID(rs.getInt("RECB_ID"));
				recbrUtilVO.setRecID(rs.getInt("REC_ID"));
				recbrUtilVO.setbMemID(rs.getInt("B_MEM_ID"));
				recbrUtilVO.setRecbContent(rs.getString("RECB_CONTENT"));
				recbrUtilVO.setRecbStatus(rs.getInt("RECB_STATUS"));
				recbrUtilVO.setRecbrID(rs.getInt("RECBR_ID"));
				recbrUtilVO.setrMemID(rs.getInt("MEM_ID"));
				recbrUtilVO.setRecbrContent(rs.getString("RECBR_CONTENT"));
				recbrUtilVO.setRecbrStatus(rs.getInt("RECBR_STATUS"));
				recbrUtilVO.setRecbrReply(rs.getString("RECBR_REPLY"));
			
				list.add(recbrUtilVO);
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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
	public void updateRecbrReply(Integer recbrID, String recbrReply, Integer recbrStatus) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(UPDATE_RECBR_REPLY);
			
			pstmt.setString(1, recbrReply);
			pstmt.setInt(2, recbrStatus);
			pstmt.setInt(3, recbrID);
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
