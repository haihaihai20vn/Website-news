package com.javaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="news")
public class NewsEntity extends BaseEntity {
	//Dùng để mapping table news trong mysql
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "thumbnail")
	private String thumbnail;
	
	@Column(name = "shortdescription", columnDefinition = "TEXT")
	private String shortDescription;
	
	@Column(name = "content", columnDefinition = "TEXT")
	private String content;
	
	@Column(name = "breakingnews")
	private boolean breakingNews;
	
	@Column(name = "latestnews")
	private boolean latestNews;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="category_id")
	private CategoryEntity category;
	
	@OneToMany(mappedBy = "newsId")
	private List<CommentEntity> comment = new ArrayList<>();

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

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
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

	public List<CommentEntity> getComment() {
		return comment;
	}

	public void setComment(List<CommentEntity> comment) {
		this.comment = comment;
	}
	
	
	
}
