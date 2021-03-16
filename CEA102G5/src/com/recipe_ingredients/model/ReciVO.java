package com.recipe_ingredients.model;

import java.io.Serializable;

public class ReciVO implements Serializable {

	private Integer recID;
	private Integer comID;
	private Integer reciNums;
	private String  comName;
	private Float comCal;
	private Float comCarb;
	private Float comPro;
	private Float comFat;
	
	public ReciVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getRecID() {
		return recID;
	}

	public void setRecID(Integer recID) {
		this.recID = recID;
	}

	public Integer getComID() {
		return comID;
	}

	public void setComID(Integer comID) {
		this.comID = comID;
	}

	public Integer getReciNums() {
		return reciNums;
	}

	public void setReciNums(Integer reciNums) {
		this.reciNums = reciNums;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public Float getComCal() {
		return comCal;
	}

	public void setComCal(Float comCal) {
		this.comCal = comCal;
	}

	public Float getComCarb() {
		return comCarb;
	}

	public void setComCarb(Float comCarb) {
		this.comCarb = comCarb;
	}

	public Float getComPro() {
		return comPro;
	}

	public void setComPro(Float comPro) {
		this.comPro = comPro;
	}

	public Float getComFat() {
		return comFat;
	}

	public void setComFat(Float comFat) {
		this.comFat = comFat;
	}
	
	
	
	
	
	
}
