package com.recipeb_report.model;

import java.util.List;

import com.util.model.RecbrUtilVO;

public interface RecbrDAO_interface {
	
	public void addrecbReport(RecbrVO recbrVO);
	public List<RecbrUtilVO> getAllRecbrforBackEnd(Integer recbrStatus);
	public void updateRecbrReply(Integer recbrID,String recbrReply,Integer recbrStatus);

}
