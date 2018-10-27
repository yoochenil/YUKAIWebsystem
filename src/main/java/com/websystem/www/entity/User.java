package com.websystem.www.entity;
import java.sql.Timestamp;

public class User {


	private String userid;
	private String userName;
	private String password;
	private String email;
	private String name_kanji;
	private String name_kana;
	private String birthday;
	private String gender;
	private String post;
	private String todohuken;
	private String address1;
	private String address2;
	private String address3;
	private String storeid;
	private String work_time;
	private String note;
	private Timestamp dts_rec_cre;
	private String user_rec_cre;
	private Timestamp dts_rec_upd;
	private String user_rec_upd;
	private String delkbn;
	private String roleid;
	private String name_display;

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName_kanji() {
		return name_kanji;
	}
	public void setName_kanji(String name_kanji) {
		this.name_kanji = name_kanji;
	}
	public String getName_kana() {
		return name_kana;
	}
	public void setName_kana(String name_kana) {
		this.name_kana = name_kana;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getTodohuken() {
		return todohuken;
	}
	public void setTodohuken(String todohuken) {
		this.todohuken = todohuken;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getStoreid() {
		return storeid;
	}
	public void setStoreid(String storeid) {
		this.storeid = storeid;
	}
	public String getWork_time() {
		return work_time;
	}
	public void setWork_time(String work_time) {
		this.work_time = work_time;
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
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getName_display() {
		return name_display;
	}
	public void setName_display(String name_display) {
		this.name_display = name_display;
	}
}