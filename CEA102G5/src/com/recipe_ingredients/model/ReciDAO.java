package com.recipe_ingredients.model;

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
	private static final String Get_ALL_INGS_BY_RECID = "SELECT REC_ID,R.COM_ID,COM_NAME,"
			+ "RECI_NUMS,COM_CAL,COM_CARB,COM_PRO,COM_FAT "
			+ "FROM RECIPE_INGREDIENTS R LEFT JOIN COMMODITY C ON R.COM_ID = C.COM_ID WHERE REC_ID=?";
	private static final String DELETE_BY_RECID ="DELETE FROM RECIPE_INGREDIENTS WHERE REC_ID=?";
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
	@Override
	public List<ReciVO> getIngsByRecID(Integer recID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ReciVO> list = new ArrayList<ReciVO>();
		ReciVO reciVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Get_ALL_INGS_BY_RECID);
			pstmt.setInt(1, recID);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reciVO = new ReciVO();
				reciVO.setComID(rs.getInt("COM_ID"));
				reciVO.setRecID(rs.getInt("REC_ID"));
				reciVO.setComName(rs.getString("COM_NAME"));
				reciVO.setReciNums(rs.getInt("RECI_NUMS"));
				reciVO.setComCal(rs.getFloat("COM_CAL"));
				reciVO.setComCarb(rs.getFloat("COM_CARB"));
				reciVO.setComPro(rs.getFloat("COM_PRO"));
				reciVO.setComFat(rs.getFloat("COM_FAT"));
				
				list.add(reciVO);
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void deleteByRecID(Integer recID,Connection con) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(DELETE_BY_RECID);
			pstmt.setInt(1, recID);
			
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
