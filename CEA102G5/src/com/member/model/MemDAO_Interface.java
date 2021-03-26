package com.member.model;

import java.util.List;
import java.util.Map;

import com.commodity.model.ComVO;

public interface MemDAO_Interface {
	
	public MemVO insert(MemVO memVO);
    public void update(MemVO memVO);
    public void updateMemPassword(String password,Integer memID);
    public void delete(Integer memID);
    public MemVO findByPrimaryKey(Integer memID);
    public MemVO findByMemAccount(String memAccount);
    public List<MemVO> getAll();   //�U�νƦX�d�� 
    public MemVO getMemBonus(Integer memID);
	public void updateStatus(MemVO memVO);
	public List<MemVO> newgetAll(Map<String, String[]> map);//�U�νƦX�d��
	public void update2(MemVO memVO);
	 

}
