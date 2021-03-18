package com.util.model;

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

public class ComCommentDAO implements ComCommentDAO_interface {
	
	private static final String GETALL=
			"SELECT m.ORDM_ID, M.MEM_ID,MEM_NAME,COM_ID,ORDD_MESSAGE,ORDD_RESPONSE,ORDD_POINT \r\n" + 
			"FROM ORDER_DETAIL D LEFT JOIN order_master M ON D.ORDM_ID = M.ORDM_ID\r\n" + 
			"LEFT JOIN MEMBER_INFO I ON M.MEM_ID = I.MEM_ID\r\n" + 
			"WHERE ORDD_MESSAGE IS NOT NULL and Ordd_response is null";
	private static DataSource ds =null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myproject");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<ComCommentVO> getAll() {
		// TODO Auto-generated method stub
		List<ComCommentVO> list = new ArrayList<ComCommentVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ComCommentVO ccVO= new ComCommentVO();
				ccVO.setComID(rs.getInt("COM_ID"));
				ccVO.setMemName(rs.getString("MEM_NAME"));
				ccVO.setMemID(rs.getInt("MEM_ID"));
				ccVO.setOdMessage(rs.getString("ORDD_MESSAGE"));
				ccVO.setOdPoint(rs.getInt("ORDD_POINT"));
				ccVO.setOdResponse(rs.getString("ORDD_RESPONSE"));
				ccVO.setOrdmID(rs.getInt("ORDM_ID"));
				list.add(ccVO);
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

}
