package com.talent.model;

import java.sql.*;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.naming.*;
import javax.sql.*;

public class TalDAO implements TalDAO_interface {

	private static final String INSERT= 
			"INSERT INTO TALENT (TAL_NAME) VALUES (?)";
	private static final String UPDATE = 
			"UPDATE TALENT set TAL_NAME=? where TAL_ID=?";
	private static final String ALL=
			"SELECT * FROM TALENT order by TAL_ID";
	private static final String ONE=
			"SELECT * FROM TALENT where TAL_ID=?";
	private static final String DELETE=
			"DELETE FROM TALENT where TAL_ID = ?";
	
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
	public void insert(TalVO TalVO) {
	
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setString(1, TalVO.getTalName());
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
	public void update(TalVO TalVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, TalVO.getTalName());
			pstmt.setInt(2, TalVO.getTalID());
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
	public void delete(Integer talID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, talID);
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
	public TalVO findByID(Integer talID) {
		
		TalVO TalVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ONE);

			pstmt.setInt(1, talID);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				TalVO = new TalVO();
				TalVO.setTalID(rs.getInt("tal_ID"));
				TalVO.setTalName(rs.getString("tal_name"));
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
		return TalVO;
	}

	@Override
	public Set<TalVO> getAll() {
		Set<TalVO> set = new LinkedHashSet<TalVO>();
		
		TalVO TalVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ALL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TalVO = new TalVO();
				TalVO.setTalID(rs.getInt("tal_ID"));
				TalVO.setTalName(rs.getString("tal_name"));
				set.add(TalVO);
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