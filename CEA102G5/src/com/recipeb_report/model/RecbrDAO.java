package com.recipeb_report.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RecbrDAO implements RecbrDAO_interface {
	private static DataSource ds = null;
	
	private static final String INSERT_STMT ="INSERT INTO RECIPEB_REPORT (RECB_ID,MEM_ID,RECBR_CONTENT,RECBR_STATUS) VALUES (?,?,?,?)";
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
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

}
