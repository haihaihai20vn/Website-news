package com.javaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class CategoryEntity extends BaseEntity {
	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;
	
	//ALTER TABLE news ADD CONSTRAINT fk_news_catetory foreign key (catetoryid) references category(id);
	//mappedBy = "category" vì đã khai báo private CategoryEntity category ở NewsEntity
	//@OneToMany: Một thể loại sẽ có nhiều bài viết
	@OneToMany(mappedBy = "category")
	private List<NewsEntity> news = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<NewsEntity> getNews() {
		return news;
	}

	public void setNews(List<NewsEntity> news) {
		this.news = news;
	}
	
	
}
