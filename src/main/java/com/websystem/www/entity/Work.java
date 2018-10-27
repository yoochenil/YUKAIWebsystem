package com.websystem.www.entity;

import java.sql.Timestamp;

public class Work {

	private String id;
	private String title;
	private String storeid;
	private String roomid;
	private String resourceid;
	private Timestamp start;
	private Timestamp end;
	private String courseid;
	private String note;
	private Timestamp dts_rec_cre;
	private String user_rec_cre;
	private Timestamp dts_rec_upd;
	private String user_rec_upd;
	private String delkbn;
	private String level;
	private String staffid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStoreid() {
		return storeid;
	}
	public void setStoreid(String storeid) {
		this.storeid = storeid;
	}
	public String getRoomid() {
		return roomid;
	}
	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}
	public String getResourceid() {
		return resourceid;
	}
	public void setResourceid(String resourceid) {
		this.resourceid = resourceid;
	}
	public Timestamp getStart() {
		return start;
	}
	public void setStart(Timestamp start) {
		this.start = start;
	}
	public Timestamp getEnd() {
		return end;
	}
	public void setEnd(Timestamp end) {
		this.end = end;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Timestamp getDts_rec_cre() {
		return dts_rec_cre;
	}
	public void setDts_rec_cre(Timestamp dts_rec_cre) {
		this.dts_rec_cre = dts_rec_cre;
	}
	public String getUser_rec_cre() {
		return user_rec_cre;
	}
	public void setUser_rec_cre(String user_rec_cre) {
		this.user_rec_cre = user_rec_cre;
	}
	public Timestamp getDts_rec_upd() {
		return dts_rec_upd;
	}
	public void setDts_rec_upd(Timestamp dts_rec_upd) {
		this.dts_rec_upd = dts_rec_upd;
	}
	public String getUser_rec_upd() {
		return user_rec_upd;
	}
	public void setUser_rec_upd(String user_rec_upd) {
		this.user_rec_upd = user_rec_upd;
	}
	public String getDelkbn() {
		return delkbn;
	}
	public void setDelkbn(String delkbn) {
		this.delkbn = delkbn;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getStaffid() {
		return staffid;
	}
	public void setStaffid(String staffid) {
		this.staffid = staffid;
	}


}
