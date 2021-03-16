package com.recipe_board.model;

import java.util.List;

public class RecbService {
	private RecbDAO_interface dao;
	
	public RecbService() {
		dao = new RecbDAO();
	}
	
	public RecbVO addBoardMsg(Integer recID, Integer memID, String recbContent) {
		RecbVO recbVO = new RecbVO();
		recbVO.setRecID(recID);
		recbVO.setMemID(memID);
		recbVO.setRecbContent(recbContent);
		
		RecbVO recbVO2 = dao.insertMsg(recbVO);
		return recbVO2;
	}
	
	public List<RecbVO> getAllMsgByRecID(Integer recID){
		return dao.getAllByRecID(recID);
	}
	
	public void deleteMsgByRecbID(Integer recbID) {
		dao.deleteByRecbID(recbID);
	}
	
	public void updateRecbStatus(Integer recbID, Integer recbStatus) {
		dao.updateRecbStatus(recbID, recbStatus);
	}

}
