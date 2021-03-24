package com.member.model;

import java.util.List;
import java.util.Map;

import com.commodity_category.model.ComcVO;

public class MemService {
	
	private MemDAO_Interface dao;

	public MemService() {
		dao = new MemDAO();
	}
	
	public MemVO addMem (String memName,String memAccount,String memPassword,String memPhone,String memEmail,byte[] memPicture) {
		
		MemVO memVO = new MemVO();
		memVO.setMemName(memName);
		memVO.setMemAccount(memAccount);
		memVO.setMemPassword(memPassword);
		memVO.setMemPhone(memPhone);
		memVO.setMemEmail(memEmail);
		memVO.setMemPicture(memPicture);
		
		MemVO memVO2 = dao.insert(memVO);
		
		return memVO2;
	}
	
	public MemVO getOneMem(Integer memID) {
		return dao.findByPrimaryKey(memID);
	}
	public MemVO getOneMemByAccount(String memAccount) {
		return dao.findByMemAccount(memAccount);
	}
	
	
	public List<MemVO> getAll() {
		return dao.getAll();
	}
	
	public MemVO updateMem(Integer memID,String memName,String memPassword,String memPhone,String memEmail,byte[] memPicture) {
		MemVO memVO = new MemVO();
		memVO.setMemID(memID);
		memVO.setMemName(memName);
		memVO.setMemPassword(memPassword);
		memVO.setMemPhone(memPhone);
		memVO.setMemEmail(memEmail);
		memVO.setMemPicture(memPicture);
		
		dao.update(memVO);
		
		
		return memVO;
	}
	
	public void updateMemPassword(String password,Integer memID) {
		
		dao.updateMemPassword(password, memID);
	}
	
	public MemVO getMemBonus(Integer memID) {
		return dao.getMemBonus(memID);
	}

	public void updateStatus(MemVO memVO) {
		
		dao.updateStatus(memVO);		
	}

	public List<MemVO> newgetAll(Map<String, String[]> map) {
		
		return dao.newgetAll(map);
	}
	
	
	

}
