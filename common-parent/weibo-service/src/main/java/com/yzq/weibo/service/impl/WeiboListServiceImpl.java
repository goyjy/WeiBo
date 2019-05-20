package com.yzq.weibo.service.impl;

import java.util.List;

import com.yzq.weibo.mapper.BeforeMapper;
import com.yzq.weibo.model.CommentList;
import com.yzq.weibo.model.Description;
import com.yzq.weibo.model.WeiboList;
import com.yzq.weibo.service.WeiboListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WeiboListServiceImpl implements WeiboListService {
	
	@Autowired
	private BeforeMapper beforeMapper;

	@Override
	public List<WeiboList> weiboList() throws Exception {
		List<WeiboList> list = beforeMapper.weiboList();
		return list;
	}

	@Override
	public List<CommentList> commentList(Integer id) throws Exception {
		List<CommentList> list = beforeMapper.commentList(id);
		return list;
	}

	@Override
	public WeiboList weibo(Integer id) throws Exception {
		WeiboList weibo = beforeMapper.weibo(id);
		return weibo;
	}

	@Override
	public List<WeiboList> findWeiboByContent(String content) throws Exception {
		List<WeiboList> list = beforeMapper.findWeiboByContent(content);
		return list;
	}

	@Override
	public List<Description> findUser() throws Exception {
		List<Description> list = beforeMapper.findUser();
		return list;
	}

	@Override
	public List<Description> findUserBynickname(String nickname) throws Exception {
		List<Description> list = beforeMapper.findUserBynickname(nickname);
		return list;
	}

	@Override
	public List<WeiboList> findWeiboByUser_id(int user_id) throws Exception {
		List<WeiboList> list = beforeMapper.findWeiboByUser_id(user_id);
		return list;
	}

}
