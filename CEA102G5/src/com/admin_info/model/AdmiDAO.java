package com.admin_info.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.authority.model.*;



public class AdmiDAO implements AdmiDAO_interface {

	
	private static final String INSERT= 
			"INSERT INTO ADMIN_INFO (ADM_NAME,ADM_ACCOUNT,ADM_PASSWORD) VALUES (?,?,?)";
	private static final String UPDATE = 
			"UPDATE ADMIN_INFO set ADM_NAME=? ADM_ACCOUNT=? ADM_PASSWORD=? where ADM_ID=?";
	private static final String ALL=
			"SELECT * FROM ADMIN_INFO order by ADM_ID";
	private static final String ONE=
			"SELECT * FROM ADMIN_INFO where ADM_ID=?";
	private static final String ONEBYACCOUNT=
			"SELECT * FROM ADMIN_INFO where ADM_ACCOUNT=?";
	private static final String DELETE = "UPDATE ADMIN_INFO set ADM_STATUS=FALSE where ADM_ID=?";
	private static final String BACK = "UPDATE ADMIN_INFO set ADM_STATUS=TRUE where ADM_ID=?";

	
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
	public AdmiVO insert(AdmiVO admiVO, Integer[] funID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			con.setAutoCommit(false);
			String[] cols = { "ADM_ID" };
			pstmt = con.prepareStatement(INSERT, cols);
			pstmt.setString(1, admiVO.getAdmName());
			pstmt.setString(2, admiVO.getAdmAccount());
			pstmt.setString(3, admiVO.getAdmPassword());

			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			Integer key = null;
			if (rs.next()) {
				key = new Integer(rs.getString(1));
			}
			for (int i = 0 ; i < funID.length ; i++) {
				AutDAO dao = new AutDAO();
				AutVO autVO = new AutVO();
				autVO.setAdmID(key);
				autVO.setFunID(funID[i]);
				dao.insert(autVO, con);
			}
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException se) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "+excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "+se.getMessage());
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
		return admiVO;
		
	}

	@Override
	public void update(AdmiVO admiVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, admiVO.getAdmName());
			pstmt.setString(2, admiVO.getAdmAccount());
			pstmt.setString(3, admiVO.getAdmPassword());
			pstmt.setInt(4, admiVO.getAdmID());
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
	public void delete(Integer admID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, admID);
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
	public AdmiVO findByID(Integer admID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdmiVO admiVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ONE);
			pstmt.setInt(1, admID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				admiVO = new AdmiVO();
				admiVO.setAdmID(rs.getInt("ADM_ID"));
				admiVO.setAdmName(rs.getString("ADM_name"));
				admiVO.setAdmAccount(rs.getString("ADM_ACCOUNT"));
				admiVO.setAdmPassword(rs.getString("ADM_PASSWORD"));
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
		return admiVO;
	}

	@Override
	public Set<AdmiVO> getALl() {
		Set<AdmiVO> set = new LinkedHashSet<AdmiVO>();

		AdmiVO admiVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ALL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				admiVO = new AdmiVO();
				admiVO.setAdmID(rs.getInt("ADM_ID"));
				admiVO.setAdmName(rs.getString("ADM_NAME"));
				admiVO.setAdmAccount(rs.getString("ADM_ACCOUNT"));
				admiVO.setAdmPassword(rs.getString("ADM_PASSWORD"));
				admiVO.setAdmStatus(rs.getBoolean("ADM_STATUS"));
				set.add(admiVO);
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
	public AdmiVO findByAccount(String admAccount) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdmiVO admiVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(ONEBYACCOUNT);
			pstmt.setString(1, admAccount);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				admiVO = new AdmiVO();
				admiVO.setAdmID(rs.getInt("ADM_ID"));
				admiVO.setAdmName(rs.getString("ADM_name"));
				admiVO.setAdmAccount(rs.getString("ADM_ACCOUNT"));
				admiVO.setAdmPassword(rs.getString("ADM_PASSWORD"));
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
		return admiVO;
	}

}
