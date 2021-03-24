package com.coach.model;

import java.sql.*;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.naming.*;
import javax.sql.*;

public class CoaDAO implements CoaDAO_interface {

	private static final String INSERT = "INSERT INTO COACH (COA_NAME,COA_ACCOUNT,COA_PASSWORD,COA_SEX,COA_PICTURE)"
			+ "VALUES (?,?,?,?,?)";
	private static final String UPDATE = "UPDATE COACH set COA_NAME=?,COA_ACCOUNT=?,COA_PASSWORD=?,COA_SEX=?"
			+ ",COA_PICTURE=? where COA_ID=?";
	private static final String UPDATEII = "UPDATE COACH set COA_NAME=?,COA_ACCOUNT=?,COA_PASSWORD=?,COA_SEX=?"
			+ "where COA_ID=?";
	private static final String ALL = "SELECT * FROM COACH order by COA_STATUS desc";
	private static final String ONE = "SELECT * FROM COACH where COA_ID=?";
	private static final String ONEBYACCOUNT = "SELECT * FROM COACH where COA_ACCOUNT=?";
	private static final String DELETE = "UPDATE COACH set COA_STATUS=FALSE where COA_ID=?";
	private static final String BACK = "UPDATE COACH set COA_STATUS=TRUE where COA_ID=?";
	private static final String TRUE = "SELECT * FROM COACH where COA_STATUS=TRUE";
	private static final String FALSE = "SELECT * FROM COACH where COA_STATUS=FALSE";
	
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
	public CoaVO insert(CoaVO coaVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			String[] cols = { "COA_ID" };
			pstmt = con.prepareStatement(INSERT, cols);
			pstmt.setString(1, coaVO.getCoaName());
			pstmt.setString(2, coaVO.getCoaAccount());
			pstmt.setString(3, coaVO.getCoaPassword());
			pstmt.setString(4, coaVO.getCoaSex());
			pstmt.setBytes(5, coaVO.getCoaPicture());

			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			Integer key = null;
			if (rs.next()) {
				key = new Integer(rs.getString(1));
			}
			
			coaVO.setCoaID(key);
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return coaVO;
	}

	@Override
	public void update(CoaVO coaVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			if (coaVO.getCoaPicture().length == 0) {
				pstmt = con.prepareStatement(UPDATEII);
				pstmt.setString(1, coaVO.getCoaName());
				pstmt.setString(2, coaVO.getCoaAccount());
				pstmt.setString(3, coaVO.getCoaPassword());
				pstmt.setString(4, coaVO.getCoaSex());
				pstmt.setInt(5, coaVO.getCoaID());
				pstmt.executeUpdate();
			} else {
				pstmt = con.prepareStatement(UPDATE);
				pstmt.setString(1, coaVO.getCoaName());
				pstmt.setString(2, coaVO.getCoaAccount());
				pstmt.setString(3, coaVO.getCoaPassword());
				pstmt.setString(4, coaVO.getCoaSex());
				pstmt.setBytes(5, coaVO.getCoaPicture());
				pstmt.setInt(6, coaVO.getCoaID());
				pstmt.executeUpdate();
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(Integer coaID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, coaID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public CoaVO findByID(Integer coaID) {
		CoaVO coaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ONE);
			pstmt.setInt(1, coaID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				coaVO = new CoaVO();
				coaVO.setCoaID(rs.getInt("COA_ID"));
				coaVO.setCoaName(rs.getString("COA_NAME"));
				coaVO.setCoaAccount(rs.getString("COA_ACCOUNT"));
				coaVO.setCoaPassword(rs.getString("COA_PASSWORD"));
				coaVO.setCoaSex(rs.getString("COA_SEX"));
				coaVO.setCoaStatus(rs.getBoolean("COA_STATUS"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return coaVO;
	}

	@Override
	public Set<CoaVO> getAll() {
		Set<CoaVO> set = new LinkedHashSet<CoaVO>();

		CoaVO coaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ALL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				coaVO = new CoaVO();
				coaVO.setCoaID(rs.getInt("COA_ID"));
				coaVO.setCoaName(rs.getString("COA_NAME"));
				coaVO.setCoaAccount(rs.getString("COA_ACCOUNT"));
				coaVO.setCoaPassword(rs.getString("COA_PASSWORD"));
				coaVO.setCoaSex(rs.getString("COA_SEX"));
				coaVO.setCoaStatus(rs.getBoolean("COA_STATUS"));
				set.add(coaVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	@Override
	public void back(Integer coaID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(BACK);
			pstmt.setInt(1, coaID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public Set<CoaVO> getTrue() {
		Set<CoaVO> set = new LinkedHashSet<CoaVO>();

		CoaVO coaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(TRUE);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				coaVO = new CoaVO();
				coaVO.setCoaID(rs.getInt("COA_ID"));
				coaVO.setCoaName(rs.getString("COA_NAME"));
				coaVO.setCoaAccount(rs.getString("COA_ACCOUNT"));
				coaVO.setCoaPassword(rs.getString("COA_PASSWORD"));
				coaVO.setCoaSex(rs.getString("COA_SEX"));
				coaVO.setCoaStatus(rs.getBoolean("COA_STATUS"));
				set.add(coaVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	@Override
	public Set<CoaVO> getFalse() {
		Set<CoaVO> set = new LinkedHashSet<CoaVO>();

		CoaVO coaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FALSE);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				coaVO = new CoaVO();
				coaVO.setCoaID(rs.getInt("COA_ID"));
				coaVO.setCoaName(rs.getString("COA_NAME"));
				coaVO.setCoaAccount(rs.getString("COA_ACCOUNT"));
				coaVO.setCoaPassword(rs.getString("COA_PASSWORD"));
				coaVO.setCoaSex(rs.getString("COA_SEX"));
				coaVO.setCoaStatus(rs.getBoolean("COA_STATUS"));
				set.add(coaVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	@Override
	public CoaVO findByAccount(String coaAccount) {
		CoaVO coaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ONEBYACCOUNT);
			pstmt.setString(1, coaAccount);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				coaVO = new CoaVO();
				coaVO.setCoaID(rs.getInt("COA_ID"));
				coaVO.setCoaName(rs.getString("COA_NAME"));
				coaVO.setCoaAccount(rs.getString("COA_ACCOUNT"));
				coaVO.setCoaPassword(rs.getString("COA_PASSWORD"));
				coaVO.setCoaSex(rs.getString("COA_SEX"));
				coaVO.setCoaStatus(rs.getBoolean("COA_STATUS"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return coaVO;
	}


}
