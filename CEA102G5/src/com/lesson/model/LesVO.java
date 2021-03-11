package com.lesson.model;

import java.sql.Date;

import com.coach.model.CoaService;
import com.talent.model.TalService;

public class LesVO {
	private Integer lesID;
	private Integer	coaID;
	private Integer talID;
	private String lesName;
	private java.sql.Date lesDate;
	private String lesTime;
	private byte[] lesPicture;
	private byte[] lesVideo;
	private java.sql.Date lesBegin;
	private java.sql.Date lesEnd;
	private Integer	lesAvailable;
	private Integer	lesAlready;
	private Integer	lesPrice;
	private Boolean	lesStatus;
	
	
	
	
	
	
	public LesVO() {
		super();
	}
	
	public LesVO(Integer lesID, Integer coaID, Integer talID, String lesName, Date lesDate, String lesTime,
			byte[] lesPicture, byte[] lesVideo, Date lesBegin, Date lesEnd, Integer lesAvailable, Integer lesAlready,
			Integer lesPrice, Boolean lesStatus) {
		super();
		this.lesID = lesID;
		this.coaID = coaID;
		this.talID = talID;
		this.lesName = lesName;
		this.lesDate = lesDate;
		this.lesTime = lesTime;
		this.lesPicture = lesPicture;
		this.lesVideo = lesVideo;
		this.lesBegin = lesBegin;
		this.lesEnd = lesEnd;
		this.lesAvailable = lesAvailable;
		this.lesAlready = lesAlready;
		this.lesPrice = lesPrice;
		this.lesStatus = lesStatus;
	}
	
	public Integer getLesID() {
		return lesID;
	}
	public void setLesID(Integer lesID) {
		this.lesID = lesID;
	}
	public Integer getCoaID() {
		return coaID;
	}
	public void setCoaID(Integer coaID) {
		this.coaID = coaID;
	}
	public Integer getTalID() {
		return talID;
	}
	public void setTalID(Integer talID) {
		this.talID = talID;
	}
	public String getLesName() {
		return lesName;
	}
	public void setLesName(String lesName) {
		this.lesName = lesName;
	}
	public java.sql.Date getLesDate() {
		return lesDate;
	}
	public void setLesDate(java.sql.Date lesDate) {
		this.lesDate = lesDate;
	}
	public String getLesTime() {
		return lesTime;
	}
	public void setLesTime(String lesTime) {
		this.lesTime = lesTime;
	}
	public byte[] getLesPicture() {
		return lesPicture;
	}
	public void setLesPicture(byte[] lesPicture) {
		this.lesPicture = lesPicture;
	}
	public byte[] getLesVideo() {
		return lesVideo;
	}
	public void setLesVideo(byte[] lesVideo) {
		this.lesVideo = lesVideo;
	}
	public java.sql.Date getLesBegin() {
		return lesBegin;
	}
	public void setLesBegin(java.sql.Date lesBegin) {
		this.lesBegin = lesBegin;
	}
	public java.sql.Date getLesEnd() {
		return lesEnd;
	}
	public void setLesEnd(java.sql.Date lesEnd) {
		this.lesEnd = lesEnd;
	}
	public Integer getLesAvailable() {
		return lesAvailable;
	}
	public void setLesAvailable(Integer lesAvailable) {
		this.lesAvailable = lesAvailable;
	}
	public Integer getLesAlready() {
		return lesAlready;
	}
	public void setLesAlready(Integer lesAlready) {
		this.lesAlready = lesAlready;
	}
	public Integer getLesPrice() {
		return lesPrice;
	}
	public void setLesPrice(Integer lesPrice) {
		this.lesPrice = lesPrice;
	}
	public Boolean getLesStatus() {
		return lesStatus;
	}
	public void setLesStatus(Boolean lesStatus) {
		this.lesStatus = lesStatus;
	}
	
	public String getPic() {
		return "/FindPicFromDBServlet?table=LESSON&col=LES_PICTURE&idName=LES_ID&id="+lesID;
	}
	public String getVideo() {
		return "/FindVideoFromDBServlet?table=LESSON&col=LES_VIDEO&idName=LES_ID&id="+lesID;
	}
	public String getCoaName() {
		return new CoaService().getOneCoachName(coaID);
	}
	public String getTalName() {
		return new TalService().getTalentName(talID);
	}
}
