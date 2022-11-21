package com.javaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="comment")
public class CommentEntity extends BaseEntity {	
		
		@Column(name = "context", columnDefinition = "TEXT")
		private String context;
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name="user_id")
		private UserEntity userId;
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name="news_id")
		private NewsEntity newsId;

		public String getContext() {
			return context;
		}

		public void setContext(String context) {
			this.context = context;
		}

		public UserEntity getUserId() {
			return userId;
		}

		public void setUserId(UserEntity userId) {
			this.userId = userId;
		}

		public NewsEntity getNewsId() {
			return newsId;
		}

		public void setNewsId(NewsEntity newsId) {
			this.newsId = newsId;
		}

		
		
		
}
