package com.admin_info.model;

import java.util.Set;

public class AdmiService {
	AdmiDAO_interface dao = null ; 
	public AdmiService() {
		dao = new AdmiDAO();
	}
	
	public AdmiVO getByAccount(String admAccount) {
		return dao.findByAccount(admAccount);
	}
	public AdmiVO getByID(Integer admID) {
		return dao.findByID(admID);
	}
	public void addAdmiVO(String admName,String admAccount,String admPassword,Integer[] funID) {
		AdmiVO admiVO = new AdmiVO();
		admiVO.setAdmName(admName);
		admiVO.setAdmAccount(admAccount);
		admiVO.setAdmPassword(admPassword);
		dao.insert(admiVO,funID);
	}
	public Set<AdmiVO> getAll(){
		return dao.getALl();
	}
	
	
}
