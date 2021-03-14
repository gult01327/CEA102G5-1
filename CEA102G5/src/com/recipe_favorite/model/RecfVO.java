package com.recipe_favorite.model;

import java.io.Serializable;

public class RecfVO implements Serializable {

	private Integer memID;
	private Integer recID;
	
	
	public RecfVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memID == null) ? 0 : memID.hashCode());
		result = prime * result + ((recID == null) ? 0 : recID.hashCode());
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
		RecfVO other = (RecfVO) obj;
		if (memID == null) {
			if (other.memID != null)
				return false;
		} else if (!memID.equals(other.memID))
			return false;
		if (recID == null) {
			if (other.recID != null)
				return false;
		} else if (!recID.equals(other.recID))
			return false;
		return true;
	}


	public Integer getMemID() {
		return memID;
	}


	public void setMemID(Integer memID) {
		this.memID = memID;
	}


	public Integer getRecID() {
		return recID;
	}


	public void setRecID(Integer recID) {
		this.recID = recID;
	}
	
	
}
