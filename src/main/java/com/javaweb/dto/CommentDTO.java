package com.javaweb.dto;


public class CommentDTO extends AbstractDTO<CommentDTO> {
	private String context;
	private Long userId;
	private Long newsId;
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getNewsId() {
		return newsId;
	}
	public void setNewsId(Long newsId) {
		this.newsId = newsId;
	}
	
}
