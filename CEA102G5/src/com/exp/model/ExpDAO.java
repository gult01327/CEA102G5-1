package com.exp.model;

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


public class ExpDAO implements ExpDAO_interface {

	private static final String INSERT= 
			"INSERT INTO EXPERIENCE (COA_ID,EXP_CONTENT) VALUES (?,?)";
	private static final String UPDATE = 
			"UPDATE EXPERIENCE set EXP_CONTENT=? where EXP_ID=?";
	private static final String ALL=
			"SELECT * FROM EXPERIENCE order by EXP_ID";
	private static final String LIST=
			"SELECT * FROM EXPERIENCE where COA_ID=?";
	private static final String ONE=
			"SELECT * FROM EXPERIENCE where EXP_ID=?";
	private static final String DELETE=
			"DELETE FROM EXPERIENCE where EXP_ID = ?";
	private static final String DELETEII=
			"DELETE FROM EXPERIENCE where COA_ID = ?";
	
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
	public void insert(ExpVO expVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setInt(1, expVO.getCoaID());
			pstmt.setString(2, expVO.getExpContent());
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
	public void update(ExpVO expVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, expVO.getExpContent());
			pstmt.setInt(2, expVO.getCoaID());
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
	public void delete(Integer expID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, expID);
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
	public ExpVO findByID(Integer expID) {
		ExpVO expVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ONE);

			pstmt.setInt(1, expID);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				expVO = new ExpVO();
				expVO.setExpID(rs.getInt("EXP_ID"));
				expVO.setCoaID(rs.getInt("COA_ID"));
				expVO.setExpContent(rs.getString("EXP_CONTENT"));
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
		return expVO;
	}

	@Override
	public List<ExpVO> getAll() {
		List<ExpVO> list = new ArrayList<ExpVO>();
		
		ExpVO expVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ALL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				expVO = new ExpVO();
				expVO.setExpID(rs.getInt("EXP_ID"));
				expVO.setCoaID(rs.getInt("COA_ID"));
				expVO.setExpContent(rs.getString("EXP_CONTENT"));
				list.add(expVO);
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
	public List<ExpVO> getByCoach(Integer coaID) {
		List<ExpVO> list = new ArrayList<ExpVO>();
		
		ExpVO expVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(LIST);
			pstmt.setInt(1, coaID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				expVO = new ExpVO();
				expVO.setExpID(rs.getInt("EXP_ID"));
				expVO.setCoaID(rs.getInt("COA_ID"));
				expVO.setExpContent(rs.getString("EXP_CONTENT"));
				list.add(expVO);
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
	public void deleteByCoach(Integer coaID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETEII);
			pstmt.setInt(1, coaID);
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

}
