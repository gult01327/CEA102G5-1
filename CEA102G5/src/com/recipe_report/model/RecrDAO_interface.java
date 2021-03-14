package com.recipe_report.model;

import java.util.List;

public interface RecrDAO_interface {
	
	public void addReport(RecrVO recrVO);
	public List<RecrVO> getAllRecrByStatus(Integer status);
	public void updateReply(RecrVO recrVO);
}
