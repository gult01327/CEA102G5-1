package com.function_info.model;

import java.sql.*;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.naming.*;
import javax.sql.*;

public class FuniDAO implements FuniDAO_interface {

	private static final String INSERT= 
			"INSERT INTO FUNCTION_INFO (FUN_NAME) VALUES (?)";
	private static final String UPDATE = 
			"UPDATE FUNCTION_INFO set FUN_NAME=? where FUN_ID=?";
	private static final String ALL=
			"SELECT * FROM FUNCTION_INFO order by FUN_ID";
	private static final String ONE=
			"SELECT * FROM FUNCTION_INFO where FUN_ID=?";
	private static final String DELETE=
			"DELETE FROM FUNCTION_INFO where FUN_ID = ?";
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	@Override
	public void insert(FuniVO funiVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setString(1, funiVO.getFunName());
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
	public void update(FuniVO funiVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, funiVO.getFunName());
			pstmt.setInt(2, funiVO.getFunID());
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
	public void delete(Integer funID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, funID);
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
	public FuniVO findByID(Integer funID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FuniVO funiVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ONE);

			pstmt.setInt(1, funID);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				funiVO = new FuniVO();
				funiVO.setFunID(rs.getInt("FUN_ID"));
				funiVO.setFunName(rs.getString("FUN_name"));
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
		return funiVO;
	}

	@Override
	public Set<FuniVO> getALl() {
		Set<FuniVO> set = new LinkedHashSet<FuniVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FuniVO funiVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ALL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				funiVO = new FuniVO();
				funiVO.setFunID(rs.getInt("FUN_ID"));
				funiVO.setFunName(rs.getString("FUN_name"));
				set.add(funiVO);
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
		return set;
	}

}
