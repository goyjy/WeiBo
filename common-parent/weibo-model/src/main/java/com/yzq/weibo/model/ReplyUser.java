package com.yzq.weibo.model;

public class ReplyUser extends Reply{
	private String fromnickname;
	private String fromheadimage;
	private String tonickname;
	private String toheadimage;
	public String getFromnickname() {
		return fromnickname;
	}
	public void setFromnickname(String fromnickname) {
		this.fromnickname = fromnickname;
	}
	public String getFromheadimage() {
		return fromheadimage;
	}
	public void setFromheadimage(String fromheadimage) {
		this.fromheadimage = fromheadimage;
	}
	public String getTonickname() {
		return tonickname;
	}
	public void setTonickname(String tonickname) {
		this.tonickname = tonickname;
	}
	public String getToheadimage() {
		return toheadimage;
	}
	public void setToheadimage(String toheadimage) {
		this.toheadimage = toheadimage;
	}
	
}
