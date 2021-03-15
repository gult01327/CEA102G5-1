package com.recipeb_report.model;

import java.util.List;

import com.util.model.RecbrUtilVO;

public class RecbrService {
	private RecbrDAO_interface dao;
	
	public RecbrService() {
		dao = new RecbrDAO();
	}
	
	public RecbrVO addRecbReport(Integer recbID,Integer memID,String recbrContent) {
		RecbrVO recbrVO = new RecbrVO();
		recbrVO.setRecbID(recbID);
		recbrVO.setMemID(memID);
		recbrVO.setRecbrContent(recbrContent);
		
		dao.addrecbReport(recbrVO);
		
		return recbrVO;
	}
	
	public List<RecbrUtilVO> getAllRecbrforBackEnd(Integer recbrStatus){
		return dao.getAllRecbrforBackEnd(recbrStatus);
	}
	public void updateRecbrReply(Integer recbrID, String recbrReply, Integer recbrStatus) {
		dao.updateRecbrReply(recbrID, recbrReply, recbrStatus);
	}
}
