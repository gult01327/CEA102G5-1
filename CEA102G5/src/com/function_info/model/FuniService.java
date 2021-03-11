package com.function_info.model;

import java.util.Set;

public class FuniService {
	FuniDAO_interface dao = null;
	
	public FuniService() {
		dao = new FuniDAO();
	}
	
	public void updateFuni(Integer funID,String funName) {
		FuniVO funiVO = new FuniVO();
		funiVO.setFunID(funID);
		funiVO.setFunName(funName);
		dao.update(funiVO);
	}
	
	public Set<FuniVO> getAll(){
		return dao.getALl();
	}
	
	public void addFuni(String funName) {
		FuniVO funiVO = new FuniVO();
		funiVO.setFunName(funName);
		dao.insert(funiVO);
	}
	public void delFuni(Integer funID) {
		dao.delete(funID);;
	}
	public FuniVO findOne(Integer funID) {
		return dao.findByID(funID);
	}
	
	
}
