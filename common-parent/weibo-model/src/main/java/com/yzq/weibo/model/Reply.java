package com.yzq.weibo.model;

import java.util.Date;

public class Reply {
    private Integer id;

    private Integer comment_id;

    private Integer reply_id;

    private String reply_type;

    private String content;

    private Integer fromuser_id;

    private Integer touser_id;
    
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

	public Integer getComment_id() {
		return comment_id;
	}

	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}

	public Integer getReply_id() {
		return reply_id;
	}

	public void setReply_id(Integer reply_id) {
		this.reply_id = reply_id;
	}

	public String getReply_type() {
		return reply_type;
	}

	public void setReply_type(String reply_type) {
		this.reply_type = reply_type;
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

	public Integer getTouser_id() {
		return touser_id;
	}

	public void setTouser_id(Integer touser_id) {
		this.touser_id = touser_id;
	}

    
}