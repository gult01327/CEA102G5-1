package com.authority.model;

import java.sql.Connection;
import java.util.Set;

public interface AutDAO_interface {
	public void insert(AutVO autVO,Connection con);
    public void delete(AutVO autVO);
    public Set<AutVO> getByAdmi(Integer admID);
}
