package com.recipe_step.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RecsDAO implements RecsDAO_interface {
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
	
	private static final String INSERT_STMT ="INSERT INTO RECIPE_STEP (REC_ID,RECS_CONTENT,RECS_PICTURE) VALUES (?,?,?)";
	@Override
	public void insertRecs(RecsVO recsVO, Connection con) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, recsVO.getRecID());
			pstmt.setString(2, recsVO.getRecsContent());
			pstmt.setBytes(3, recsVO.getRecsPicture());
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			if(con!=null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back by recsDAO");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
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
		}
		
	}

}
