package com.function_info.model;

import java.util.Set;

public interface FuniDAO_interface {
	public void insert(FuniVO funiVO);
	public void update(FuniVO funiVO);
	public void delete(Integer funID);
	public FuniVO findByID(Integer funID);
	public Set<FuniVO> getALl();
}
