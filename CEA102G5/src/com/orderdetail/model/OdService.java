package com.orderdetail.model;

import java.util.List;

import com.cart.model.CartService;
import com.cart.model.CartVO;
import com.ordermaster.model.OmVO;

public class OdService {
	private OdDAO_interface dao;

	public OdService() {
		dao = new OdDAO();
	}
	
	public OmVO addOd (List<CartVO> checkOutList,Integer memID, Integer mrID, Integer omPrice, String omrName, String omrPhone, String omrAdd,Integer omDiscount) {
		OmVO omVO = new OmVO();
		
		omVO.setMemID(memID);
		omVO.setMrID(mrID);
		omVO.setOmPrice(omPrice);
		omVO.setOmrName(omrName);
		omVO.setOmrPhone(omrPhone);
		omVO.setOmrAddress(omrAdd);
		omVO.setOmDiscount(omDiscount);
		
		
		
		dao.insert(checkOutList, omVO);
		
		
		return omVO;
	}
	
	public List<OdVO> getAllByOmID(Integer omID){
		
		List<OdVO> list = dao.getAllByOmID(omID);
		
		
		return list;
	}
	
	public void addMessage(Integer omID, Integer comID, String odMessage, String column,Integer odPoint) {
		String sql = "UPDATE ORDER_DETAIL SET "+ column +"=? , ORDD_POINT= ? WHERE ORDM_ID=? AND COM_ID=?";
		dao.addMessage(omID, comID, odMessage, sql,odPoint);
		
		
	}
	
	public void updateByComComment(List<OdVO> list) {
		dao.updateByodResponse(list);
	}

}
