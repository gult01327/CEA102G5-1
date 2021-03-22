package com.lesson_reservation.model;

import java.util.*;

import com.lesson.model.LesVO;

public interface LesrDAO_interface {
          public void insert(LesrVO lesrVO);
          public void update(LesrVO lesrVO);
          public void delete(Integer lesID, Integer memID);
          public void updateLes(LesVO lesVO);
          public LesrVO findByPrimaryKey(Integer lesId , Integer memID);
         
          public List<LesrVO> getAll();
          public Set<LesrVO> getLesByMem(Integer memID);
          public Set<LesrVO> getMemByLes(Integer lesID);
//          //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//          public List<LesrVO> getAll(Map<String, String[]> map); 
}