package com.yzq.weibo.mapper;

import com.yzq.weibo.model.CommentList;
import com.yzq.weibo.model.Description;
import com.yzq.weibo.model.WeiboList;

import java.util.List;



public interface BeforeMapper {
	
	public List<WeiboList> findWeiboByContent(String content) throws Exception;
	public WeiboList weibo(Integer id) throws Exception;
	public List<WeiboList> weiboList() throws Exception;
	public List<CommentList> commentList(Integer id) throws Exception;
	public List<Description> findUser() throws Exception ;
	public List<Description> findUserBynickname(String nickname) throws Exception;

	public List<WeiboList> findWeiboByUser_id(int user_id) throws Exception;

}
