package com.recipeb_report.model;

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
}
