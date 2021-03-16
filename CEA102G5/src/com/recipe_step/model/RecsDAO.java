package com.recipe_step.model;

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

import com.recipe_ingredients.model.ReciVO;

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
	private static final String GET_STEPS_BY_RECID_STMT ="SELECT * FROM RECIPE_STEP WHERE REC_ID = ?";
	private static final String FIND_BY_RECSID_STMT = "SELECT * FROM RECIPE_STEP WHERE RECS_ID = ?";
	private static final String DELETE_BY_RECID ="DELETE FROM RECIPE_STEP WHERE REC_ID=?";
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
	@Override
	public List<RecsVO> getAllStepsByRecID(Integer recID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecsVO> list = new ArrayList<RecsVO>();
		RecsVO recsVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STEPS_BY_RECID_STMT);
			pstmt.setInt(1, recID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recsVO = new RecsVO();
				recsVO.setRecsID(rs.getInt("RECS_ID"));
				recsVO.setRecID(rs.getInt("REC_ID"));
				recsVO.setRecsContent(rs.getString("RECS_CONTENT"));
				
				list.add(recsVO);
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
	public RecsVO findByRecsID(Integer recsID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		RecsVO recsVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_RECSID_STMT);
			pstmt.setInt(1, recsID);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				recsVO = new RecsVO();
				recsVO.setRecsID(rs.getInt("RECS_ID"));
				recsVO.setRecID(rs.getInt("REC_ID"));
				recsVO.setRecsPicture(rs.getBytes("RECS_PICTURE"));
				recsVO.setRecsContent(rs.getString("RECS_CONTENT"));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} {
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
		return recsVO;
	}
	@Override
	public void deleteByRecID(Integer recID, Connection con) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(DELETE_BY_RECID);
			pstmt.setInt(1, recID);
			
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
