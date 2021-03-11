package com.recipe_ingredients.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReciDAO implements ReciDAO_interface {
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
	
	private static final String INSERT_RECI_STMT="INSERT INTO RECIPE_INGREDIENTS (REC_ID,COM_ID,RECI_NUMS) VALUES (?,?,?)";
	@Override
	public void insertReci(ReciVO reciVO,Connection con) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(INSERT_RECI_STMT);
			pstmt.setInt(1, reciVO.getRecID());
			pstmt.setInt(2, reciVO.getComID());
			pstmt.setInt(3, reciVO.getReciNums());
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			if(con!=null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back by reciDAO");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured."+se.getMessage());
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
