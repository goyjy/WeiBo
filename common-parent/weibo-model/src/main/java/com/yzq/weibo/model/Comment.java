package com.yzq.weibo.model;

import java.util.Date;

public class Comment {
    private Integer id;

    private Integer weibo_id;

    private String content;

    private Integer fromuser_id;
    
    private Date datetime;
    
    

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getWeibo_id() {
		return weibo_id;
	}

	public void setWeibo_id(Integer weibo_id) {
		this.weibo_id = weibo_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getFromuser_id() {
		return fromuser_id;
	}

	public void setFromuser_id(Integer fromuser_id) {
		this.fromuser_id = fromuser_id;
}

    
   
}