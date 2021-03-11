package com.recipe.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.recipe_ingredients.model.ReciVO;
import com.recipe_step.model.RecsVO;

public class RecService {
	private RecDAO_interface dao;
	
	public RecService() {
		dao = new RecDAO();
	}
	
	
	public RecVO addRec(Integer memID,String recName,byte[] recPic,String recContent,Integer recSize,
			Integer recCookTime, Float totalCal, Float totalCarb, Float totalPro, Float totalFat, 
			Integer recStatus, Integer recBonus,
			Integer[] ingComID, Integer[] ingNums,
			List<Part> parts, String[] recsContent) {
		
		//包裝給主檔用的RecVO
		RecVO recVO = new RecVO();
		
		recVO.setMemID(memID);
		recVO.setRecName(recName);
		recVO.setRecPicture1(recPic);
		recVO.setRecContent(recContent);
		recVO.setRecSize(recSize);
		recVO.setRecCooktime(recCookTime);
		recVO.setRecCal(totalCal);
		recVO.setRecCarb(totalCarb);
		recVO.setRecProtein(totalPro);
		recVO.setRecFat(totalFat);
		recVO.setRecStatus(recStatus);
		recVO.setRecBonus(recBonus);
		
		//包裝給食材用的List<ReciVO>
		List<ReciVO> reciList = new ArrayList<ReciVO>();
		ReciVO reciVO = null;
		for(int i = 0; i<ingComID.length;i++) {
			reciVO = new ReciVO();
			reciVO.setComID(ingComID[i]);
			reciVO.setReciNums(ingNums[i]);
			
			reciList.add(reciVO);
		}
		//包裝給步驟用的List<RecsVO>
		List<RecsVO> recsList = new ArrayList<RecsVO>();
		RecsVO recsVO = null;
		byte[] recsPic = null;
		
		for(int i = 0 ; i<recsContent.length;i++) {
			 recsVO = new RecsVO();
			 Part part = parts.get(i);
			 try {
				InputStream is = part.getInputStream();
				recsPic = new byte[is.available()];
				is.read(recsPic);
				is.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 recsVO.setRecsPicture(recsPic);
			 recsVO.setRecsContent(recsContent[i]);
			 
			 recsList.add(recsVO);
			 
		}
		
		dao.insertWithReciRecs(recVO, reciList, recsList);
		
		return recVO;
	}
	
	public RecVO updateRec() {
			
			return null;
	}
	public void deleteRec() {
		
		
	}
	
	public RecVO getOneRec() {
		
		return null;
	}
	
	public List<RecVO> getAll(){
		
		return null;
	}
	
	public List<RecVO> getRecByMemID(){
		
		return null;
	}
	
	public List<RecVO> getAll(Map<String, String[]> map){
		
		return null;
	}

}
