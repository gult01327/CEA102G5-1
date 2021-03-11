package com.coach.model;

import java.util.Set;

public interface CoaDAO_interface {
	public CoaVO insert(CoaVO coaVO);
    public void update(CoaVO coaVO);
    public void delete(Integer coaID);
    public void back(Integer coaID);
    public CoaVO findByID(Integer coaID);
    public CoaVO findByAccount(String coaAccount);
    public Set<CoaVO> getAll();
    public Set<CoaVO> getTrue();
    public Set<CoaVO> getFalse();
}
