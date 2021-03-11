package com.recipe.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.recipe_ingredients.model.ReciDAO;
import com.recipe_ingredients.model.ReciVO;
import com.recipe_step.model.RecsDAO;
import com.recipe_step.model.RecsVO;

public class RecDAO implements RecDAO_interface {
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
	
	//SQL指令
	private static final String INSERT_STMT = "INSERT INTO RECIPE (MEM_ID,REC_NAME,REC_PICTURE_1\r\n" + 
			",REC_CAL,REC_CARB,REC_PROT,REC_FAT,REC_STATUS,\r\n" + 
			"REC_BONUS,REC_CONTENT,REC_SIZE,REC_COOKTIME)VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
	private static final String GET_ALL_STMT ="SELECT * FROM RECIPE ORDER BY REC_ID";
	
	@Override
	public void insertWithReciRecs(RecVO recVO,List<ReciVO> reciList,List<RecsVO> recsList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			
			//1.新增食譜主檔
			int cols[]= {1};
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			
			pstmt.setInt(1, recVO.getMemID());
			pstmt.setString(2, recVO.getRecName());
			pstmt.setBytes(3, recVO.getRecPicture1());
			pstmt.setFloat(4, recVO.getRecCal());
			pstmt.setFloat(5, recVO.getRecCarb());
			pstmt.setFloat(6, recVO.getRecProtein());
			pstmt.setFloat(7, recVO.getRecFat());
			pstmt.setInt(8, recVO.getRecStatus());
			pstmt.setInt(9, recVO.getRecBonus());
			pstmt.setString(10, recVO.getRecContent());
			pstmt.setInt(11, recVO.getRecSize());
			pstmt.setInt(12, recVO.getRecCooktime());
			
			pstmt.executeUpdate();
			
			Integer recID = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				recID = rs.getInt(1);
				System.out.println("Auto PKID is  " + recID +"(success!)");
			}else {
				System.out.println("fail to get AutoID");
			}
			rs.close();
			
			//再新增食譜食材表
			ReciDAO reciDAO = new ReciDAO();
			for(ReciVO reciVO : reciList) {
				reciVO.setRecID(recID);
				reciDAO.insertReci(reciVO, con);
			}
			
			//再新增步驟
			RecsDAO recsDAO = new RecsDAO();
			for(RecsVO recsVO : recsList) {
				recsVO.setRecID(recID);
				recsDAO.insertRecs(recsVO, con);
			}
			
			con.commit();
			con.setAutoCommit(true);
			System.out.println("新增食譜編號:" +recID+"時，共有"+reciList.size()+"筆食材&"+recsList.size()+"段步驟被新增進資料庫了");
			
			
			
			

		} catch (SQLException se) {
			if(con!=null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back by recDAO");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					// TODO Auto-generated catch block
					se.printStackTrace(System.err);
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(RecVO recVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer recID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public RecVO findByPrimaryKey(Integer recID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RecVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecVO> list = new ArrayList<RecVO>();
		RecVO recVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recVO = new RecVO();
				recVO.setRecID(rs.getInt("REC_ID"));
				recVO.setMemID(rs.getInt("MEM_ID"));
				recVO.setRecName(rs.getString("REC_NAME"));
				recVO.setRecCal(rs.getFloat("REC_CAL"));
				recVO.setRecCarb(rs.getFloat("REC_CARB"));
				recVO.setRecProtein(rs.getFloat("REC_PROT"));
				recVO.setRecFat(rs.getFloat("REC_FAT"));
				recVO.setRecStatus(rs.getInt("REC_STATUS"));
				recVO.setRecBonus(rs.getInt("REC_BONUS"));
				recVO.setRecContent(rs.getString("REC_CONTENT"));
				recVO.setRecSize(rs.getInt("REC_SIZE"));
				recVO.setRecCooktime(rs.getInt("REC_COOKTIME"));
				recVO.setRecTime(rs.getDate("REC_TIME"));
				recVO.setRecADate(rs.getDate("REC_ADATE"));
				
				list.add(recVO);
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
	public List<RecVO> getAllByMemID(Integer memID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RecVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
