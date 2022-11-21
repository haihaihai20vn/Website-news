package com.javaweb.dto;

import java.util.ArrayList;
import java.util.List;

public class NewsDTO extends AbstractDTO<NewsDTO> {
	private String title;
	private String thumbnail;
	private String shortDescription;
	private String content;
	private Long categoryId;
	private String categoryCode;
	private boolean breakingNews;
	private boolean latestNews;
	private List<NewsDTO> listVideo = new ArrayList<>();
	private List<NewsDTO> listBreakingNews = new ArrayList<>();
	private List<NewsDTO> listLatestNews = new ArrayList<>();

	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public boolean isBreakingNews() {
		return breakingNews;
	}
	public void setBreakingNews(boolean breakingNews) {
		this.breakingNews = breakingNews;
	}
	public boolean isLatestNews() {
		return latestNews;
	}
	public void setLatestNews(boolean latestNews) {
		this.latestNews = latestNews;
	}
	public List<NewsDTO> getListVideo() {
		return listVideo;
	}
	public void setListVideo(List<NewsDTO> listVideo) {
		this.listVideo = listVideo;
	}
	public List<NewsDTO> getListBreakingNews() {
		return listBreakingNews;
	}
	public void setListBreakingNews(List<NewsDTO> listBreakingNews) {
		this.listBreakingNews = listBreakingNews;
	}
	public List<NewsDTO> getListLatestNews() {
		return listLatestNews;
	}
	public void setListLatestNews(List<NewsDTO> listLatestNews) {
		this.listLatestNews = listLatestNews;
	}
	
	
	
}
