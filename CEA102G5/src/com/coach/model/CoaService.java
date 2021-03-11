package com.coach.model;

import java.util.List;
import java.util.Set;

import com.coach_talent.model.CoatService;
import com.exp.model.ExpService;

public class CoaService {
	CoaDAO_interface dao = null;
	public CoaService() {
		dao = new CoaDAO();
	}
	public void addCoach(String coaName,String coaAccount,
			String coaPassword,String coaSex,byte[] coaPicture,
			Integer[] talID,List<String> expContent){
			CoaVO coaVO = new CoaVO();
			coaVO.setCoaName(coaName);
			coaVO.setCoaAccount(coaAccount);
			coaVO.setCoaPassword(coaPassword);
			coaVO.setCoaSex(coaSex);
			coaVO.setCoaPicture(coaPicture);
			coaVO = dao.insert(coaVO);
			//轉交其他SVC
			CoatService CoatSvc = new CoatService();
			CoatSvc.addCoat(coaVO.getCoaID(), talID);
			
			if(expContent.size()!=0) {
				ExpService ExpSvc = new ExpService();
				ExpSvc.addExpContent(coaVO.getCoaID(), expContent);
			}
		}
		
		public void updateCoach(Integer coaID, String coaName,String coaAccount,
				String coaPassword,String coaSex,byte[] coaPicture,
				Integer[] talID,List<String> expContent) {
			CoaVO coaVO = new CoaVO();
			coaVO.setCoaID(coaID);
			coaVO.setCoaName(coaName);
			coaVO.setCoaAccount(coaAccount);
			coaVO.setCoaPassword(coaPassword);
			coaVO.setCoaSex(coaSex);
			coaVO.setCoaPicture(coaPicture);
			dao.update(coaVO);
			//轉交其他SVC
			CoatService CoatSvc = new CoatService();
			CoatSvc.delCoat(coaID, talID);
			CoatSvc.addCoat(coaID, talID);	
			if(expContent.size()!=0) {
				ExpService ExpSvc = new ExpService();
				ExpSvc.delExpContent(coaID, expContent);
				ExpSvc.addExpContent(coaID, expContent);
			}
		}
		public void delCoach(Integer coaID) {
			dao.delete(coaID);
		}
		public void backCoach(Integer coaID) {
			dao.back(coaID);
		}
		public CoaVO getOneCoach(Integer coaID) {
			return dao.findByID(coaID);
		}
		public String getOneCoachName(Integer coaID) {
			return dao.findByID(coaID).getCoaName();
		}
		public Set<CoaVO> getAll() {
			return dao.getAll();
		}
		public Set<CoaVO> getNormal() {
			return dao.getTrue();
		}
		public CoaVO getByAccount(String account) {
			return dao.findByAccount(account);
		}
}
