package com.talent.model;

import java.util.Set;

public class TalService {
	TalDAO_interface dao = null;
	public TalService() {
		dao = new TalDAO();
	}
	
	public TalVO addTalent(String talName) {
		TalVO talentVO = new TalVO();
		talentVO.setTalName(talName);
		dao.insert(talentVO);
		return talentVO;
	}
	
	public TalVO getTalent(Integer talID) {
		TalVO talVO = new TalVO();
		return talVO = dao.findByID(talID);
	}
	public String getTalentName(Integer talID) {
		TalVO talVO = new TalVO();
		return dao.findByID(talID).getTalName();
	}
	
	public void delTalent(Integer talID) {
		dao.delete(talID);
	}
	public void updateTalent(Integer talID,String talName) {
		TalVO talVO = new TalVO();
		talVO.setTalID(talID);
		talVO.setTalName(talName);
		dao.update(talVO);;
	}
	
	public Set<TalVO> getAll() {
		return dao.getAll();
	}
	
}
