package com.yzq.weibo.model;

import java.util.List;

public class CommentList extends CommentUser{
	private List<ReplyUser> replyUserList;

	public List<ReplyUser> getReplyUserList() {
		return replyUserList;
	}

	public void setReplyUserList(List<ReplyUser> replyUserList) {
		this.replyUserList = replyUserList;
	}

	
	
}
