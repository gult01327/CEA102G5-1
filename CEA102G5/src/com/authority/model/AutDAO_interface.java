package com.authority.model;

import java.sql.Connection;
import java.util.List;

public interface AutDAO_interface {
	
	public void insert (AutVO autVO,Connection con);//��admin���P�@���s�u
	public void delete (Integer admID);
	public boolean check(Integer admiID,Integer funID);
	public List<String> getFun(Integer admID);
	
}
