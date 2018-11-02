package com.websystem.www.entity;



public class Course {

	private String courseid;
	private String coursename;
	private String kb_course;
	private String kb_coursename;
	private Integer coursetime;
	private String note;
	private String delkbn;
	private String price;


    public String getKb_coursename() {
        return kb_coursename;
    }

    public void setKb_coursename(String kb_coursename) {
        this.kb_coursename = kb_coursename;
    }

    public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getKb_course() {
		return kb_course;
	}

	public void setKb_course(String kb_course) {
		this.kb_course = kb_course;
	}

	public Integer getCoursetime() {
		return coursetime;
	}

	public void setCoursetime(Integer coursetime) {
		this.coursetime = coursetime;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDelkbn() {
		return delkbn;
	}

	public void setDelkbn(String delkbn) {
		this.delkbn = delkbn;
	}

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
