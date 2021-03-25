package com.lesson.model;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.naming.*;
import javax.sql.*;

import com.tool.controller.QueryEdit;
import com.tool.controller.QueryEdit3;

public class LesDAO implements LesDAO_interface {
	
	private static final String selCol ="LES_ID,COA_ID,LES_DATE,LES_TIME,LES_BEGIN,LES_END,LES_AVAILABLE,LES_ALREADY,LES_PRICE,LES_STATUS,TAL_ID,LES_NAME";

	private static final String INSERT = "INSERT INTO LESSON (COA_ID,TAL_ID,LES_NAME,LES_DATE,LES_TIME,LES_PICTURE"
			+ ",LES_VIDEO,LES_BEGIN,LES_END,LES_AVAILABLE,LES_PRICE)" + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	private static final String ALL = "SELECT * FROM LESSON";
	private static final String LESBYMEM = "SELECT "+ selCol+" FROM LESSON";
	private static final String FINDONE = "SELECT les_ID,coa_ID,les_name FROM LESSON";
	private static final String BYCOACH = "SELECT "+selCol+" FROM LESSON where COA_ID=? and les_status=true order by LES_DATE";
	private static final String ONE = "SELECT * FROM LESSON where LES_ID=?";
	private static final String UPDATE = "UPDATE LESSON set LES_NAME=?,LES_PRICE=?,LES_PICTURE=?,LES_VIDEO=? WHERE LES_ID=?";
	private static final String DELETE = "UPDATE LESSON set LES_PICTURE='',LES_VIDEO='',LES_STATUS=FALSE WHERE LES_ID=?";
	private static final String BYCOACHFRONT = "SELECT "+selCol+" FROM LESSON where COA_ID=? AND LES_END>=? and les_status=true order by LES_DATE";
	private static final String ALLTRUE = "SELECT "+selCol+" FROM LESSON WHERE LES_STATUS=TRUE order by LES_DATE ,LES_TIME";
	private static final String ALLTRUEFRONT = "SELECT "+selCol+" FROM LESSON WHERE LES_STATUS=TRUE order by LES_END desc limit 3";
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void insert(LesVO lesVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setInt(1, lesVO.getCoaID());
			pstmt.setInt(2, lesVO.getTalID());
			pstmt.setString(3, lesVO.getLesName());
			pstmt.setDate(4, lesVO.getLesDate());
			pstmt.setString(5, lesVO.getLesTime());
			pstmt.setBytes(6, lesVO.getLesPicture());
			pstmt.setBytes(7, lesVO.getLesVideo());
			pstmt.setDate(8, lesVO.getLesBegin());
			pstmt.setDate(9, lesVO.getLesEnd());
			pstmt.setInt(10, lesVO.getLesAvailable());
			pstmt.setInt(11, lesVO.getLesPrice());
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
	public void update(LesVO lesVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, lesVO.getLesName());
			pstmt.setInt(2, lesVO.getLesPrice());
			pstmt.setBytes(3, lesVO.getLesPicture());
			pstmt.setBytes(4, lesVO.getLesVideo());
			pstmt.setInt(5, lesVO.getLesID());
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
	public void delete(Integer lesID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, lesID);
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
	public Set<LesVO> getAll() {
		Set<LesVO> set = new LinkedHashSet<LesVO>();

		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(LESBYMEM);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
				set.add(lesVO);
				
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
	public Set<LesVO> getByCoach(Integer coaID) {
		Set<LesVO> set = new LinkedHashSet<LesVO>();

		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(BYCOACH);
			pstmt.setInt(1, coaID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
				set.add(lesVO);
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
	public Map<String, String> getAll(Map<String, String[]> query) {
		Map<String, String> map = new LinkedHashMap<String, String>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			String sql = QueryEdit3.transForQuery(query);
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM " + sql);
			sql = "SELECT "+selCol+" FROM " + sql;
			map.put("sql", sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String total = rs.getString(1);
				map.put("total", total);
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
		return map;
	}

	@Override
	public Set<LesVO> getAll(String sql, Integer page, Integer nums,String orderBy) {
		Set<LesVO> set = new LinkedHashSet<LesVO>();

		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			Integer pass = (page - 1) * nums;
			pstmt = con.prepareStatement(sql + " order by "+ orderBy + " limit " + pass + "," + nums);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
				set.add(lesVO);
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
	public LesVO findByID(Integer lesID) {
		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ONE);
			pstmt.setInt(1, lesID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesPicture(rs.getBytes("LES_PICTURE"));
				lesVO.setLesVideo(rs.getBytes("LES_VIDEO"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
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
		return lesVO;
	}
	
	public LesVO findByIDnoByte(Integer lesID) {
		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ONE);
			pstmt.setInt(1, lesID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
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
		return lesVO;
	}
    
	public LesVO findOne(Integer lesID) {
		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDONE);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
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
		return lesVO;
	}

	
	@Override
	public Set<LesVO> getAllTrue() {
		Set<LesVO> set = new LinkedHashSet<LesVO>();

		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ALLTRUE);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
				set.add(lesVO);
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
	public Set<LesVO> getAllTrueToFront() {
		Set<LesVO> set = new LinkedHashSet<LesVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ALLTRUEFRONT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				LesVO lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
				set.add(lesVO);
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
	public Set<LesVO> getByCoachTrue(Integer coaID) {
		Set<LesVO> set = new LinkedHashSet<LesVO>();

		LesVO lesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(BYCOACHFRONT);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sf.format(new Date());
			pstmt.setInt(1, coaID);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lesVO = new LesVO();
				lesVO.setLesID(rs.getInt("LES_ID"));
				lesVO.setCoaID(rs.getInt("COA_ID"));
				lesVO.setTalID(rs.getInt("TAL_ID"));
				lesVO.setLesName(rs.getString("LES_NAME"));
				lesVO.setLesTime(rs.getString("LES_TIME"));
				lesVO.setLesStatus(rs.getBoolean("LES_STATUS"));
				lesVO.setLesAvailable(rs.getInt("LES_AVAILABLE"));
				lesVO.setLesAlready(rs.getInt("LES_Already"));
				lesVO.setLesPrice(rs.getInt("LES_PRICE"));
				lesVO.setLesDate(rs.getDate("LES_DATE"));
				lesVO.setLesBegin(rs.getDate("LES_BEGIN"));
				lesVO.setLesEnd(rs.getDate("LES_END"));
				set.add(lesVO);
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
	public String frontTotal() {
		String total = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sf.format(new Date());
			pstmt = con.prepareStatement("SELECT COUNT(1) FROM LESSON where LES_STATUS=TRUE AND LES_END >= "+date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				total = rs.getString(1);
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
		
		return total;
	}

}
