package com.cart.model;

import java.io.Serializable;
import java.sql.Date;

public class CartVO implements Serializable {
	private Integer memID;
	private Integer comID;
	private Integer cardCount;
	private Date cardTime;
	private String comName;
	private Integer comPrice;

	
	
	public CartVO() {
		super();
	}
	public String getComPicSrc() {
		String src = "?id="+this.comID+"&table=COMMODITY&column=COM_PICTURE&idname=COM_ID";
		return src;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public Integer getComID() {
		return comID;
	}
	public void setComID(Integer comID) {
		this.comID = comID;
	}
	public Integer getCardCount() {
		return cardCount;
	}
	public void setCardCount(Integer cardCount) {
		this.cardCount = cardCount;
	}
	public Date getCardTime() {
		return cardTime;
	}
	public void setCardTime(Date cardTime) {
		this.cardTime = cardTime;
	}
	
	
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public Integer getComPrice() {
		return comPrice;
	}
	public void setComPrice(Integer comPrice) {
		this.comPrice = comPrice;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comID == null) ? 0 : comID.hashCode());
		result = prime * result + ((memID == null) ? 0 : memID.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartVO other = (CartVO) obj;
		if (comID == null) {
			if (other.comID != null)
				return false;
		} else if (!comID.equals(other.comID))
			return false;
		if (memID == null) {
			if (other.memID != null)
				return false;
		} else if (!memID.equals(other.memID))
			return false;
		return true;
	}
	
	
	
}
