package com.lesson.model;

import java.util.Map;
import java.util.Set;

public class LesService {
	LesDAO_interface dao = null;

	public LesService() {
		dao = new LesDAO();
	}
	
	public void cancelLesson(Integer lesID) {
		dao.delete(lesID);
	}

	public void addLesson(Integer coaID, Integer talID, String lesName, java.sql.Date lesDate, String lesTime,
			java.sql.Date lesBegin, java.sql.Date lesEnd, byte[] lesPicture, byte[] lesVideo, Integer lesAvailable,
			Integer lesPrice) {
		LesVO lesVO = new LesVO();
		lesVO.setCoaID(coaID);
		lesVO.setTalID(talID);
		lesVO.setLesName(lesName);
		lesVO.setLesDate(lesDate);
		lesVO.setLesTime(lesTime);
		lesVO.setLesBegin(lesBegin);
		lesVO.setLesEnd(lesEnd);
		lesVO.setLesAvailable(lesAvailable);
		lesVO.setLesPrice(lesPrice);
		lesVO.setLesPicture(lesPicture);
		lesVO.setLesVideo(lesVideo);
		dao.insert(lesVO);
	}

	public void updateLesson(Integer lesID,String lesName, Integer lesPrice, byte[] lesPicture, byte[] lesVideo) {
		LesVO lesVO = dao.findByID(lesID);
		lesVO.setLesName(lesName);
		lesVO.setLesPrice(lesPrice);
		if (lesPicture.length != 0) {
			lesVO.setLesPicture(lesPicture);
		}
		if (lesVideo.length != 0) {
			lesVO.setLesVideo(lesVideo);
		}
		dao.update(lesVO);
	}

	public Set<LesVO> getAll() {
		return dao.getAll();
	}
	
	public Set<LesVO> getAllTrue() {
		return dao.getAllTrue();
	}

	public Map<String, String> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}

	public Set<LesVO> getAll(String sql, Integer page, Integer nums, String orderBy) {
		return dao.getAll(sql, page, nums, orderBy);
	}

	public LesVO searchOneByID(Integer lesID) {
		return dao.findByIDnoByte(lesID);

	}
	public Set<LesVO> getByCoach(Integer coaID){
		return dao.getByCoach(coaID);
	}
	
	public Set<LesVO> getByCoachFront(Integer coaID){
		return dao.getByCoachTrue(coaID);
	}
	
	public Set<LesVO> getAllTrueToFront() {
		return dao.getAllTrueToFront();
	}

}
