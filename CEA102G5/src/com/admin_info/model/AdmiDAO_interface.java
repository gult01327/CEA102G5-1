package com.admin_info.model;

import java.util.Set;

public interface AdmiDAO_interface {
	public AdmiVO insert(AdmiVO admiVO, Integer[] funID);
	public void update(AdmiVO admiVO);
	public void delete(Integer admID);
	public AdmiVO findByID(Integer admID);
	public AdmiVO findByAccount(String admAccount);
	public Set<AdmiVO> getALl();
}
