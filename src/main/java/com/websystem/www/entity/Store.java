package com.websystem.www.entity;

import java.sql.Timestamp;

public class Store {

	private String storeId;
	private String storeName;
	private Timestamp dts_rec_cre;
	private String user_rec_cre;
	private Timestamp dts_rec_upd;
	private String user_rec_upd;

	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
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


}
