package com.lesson.model;

import java.util.Map;
import java.util.Set;

public interface LesDAO_interface {
	public void insert(LesVO lesVO);
	public void update(LesVO lesVO);
	public void delete(Integer lesID);
	public LesVO findByID(Integer lesID);
	public LesVO findByIDnoByte(Integer lesID);
	public Set<LesVO>getAll();
	public Set<LesVO>getAllTrue();
	public Set<LesVO>getAllTrueToFront();
	public Set<LesVO>getByCoach(Integer coaID);
	public Set<LesVO>getByCoachTrue(Integer coaID);
	public Map<String,String>getAll(Map<String, String[]> query);
	public Set<LesVO> getAll(String sql, Integer page, Integer nums, String orderBy);
}
