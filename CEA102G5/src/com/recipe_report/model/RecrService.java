package com.recipe_report.model;

import java.util.List;

public class RecrService {
	private RecrDAO_interface dao;
	
	public RecrService() {
		dao = new RecrDAO();
	}
	
	public RecrVO addReport(Integer recID, Integer memID, String recrContent) {
		RecrVO recrVO = new RecrVO();
		recrVO.setRecID(recID);
		recrVO.setMemID(memID);
		recrVO.setRecrContent(recrContent);
		dao.addReport(recrVO);
		
		return recrVO;
	}
	
	public List<RecrVO> getAllByStatus(Integer status){
		return dao.getAllRecrByStatus(status);
	}
	
	public RecrVO updateRecrReply(String reply,Integer recrID) {
		RecrVO recrVO = new RecrVO();
		recrVO.setRecrID(recrID);
		recrVO.setRecrReplyContent(reply);
		recrVO.setRecrStatus(1);
		dao.updateReply(recrVO);
		
		return recrVO;
	}

}
