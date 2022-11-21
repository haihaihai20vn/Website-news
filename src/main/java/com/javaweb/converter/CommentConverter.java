package com.javaweb.converter;

import org.springframework.stereotype.Component;

import com.javaweb.dto.CommentDTO;
import com.javaweb.entity.CommentEntity;

@Component
public class CommentConverter {
	public CommentDTO toDto(CommentEntity commentEntity) {
		 CommentDTO result = new  CommentDTO();
		result.setId(commentEntity.getId()); //Khi có data thì DTO mới đổ lên entity nên phải có id
		result.setContext(commentEntity.getContext());
		result.setCreatedDate(commentEntity.getCreatedDate());
		result.setModifiedDate(commentEntity.getModifiedDate());
		result.setUserId(commentEntity.getUserId().getId());
		result.setNewsId(commentEntity.getNewsId().getId());
		return result;
	}
	
	//Convert data từ entity -> DTO (entity hoàn toàn mới)
	public CommentEntity toEntity(CommentDTO commentDto) {
		CommentEntity result = new CommentEntity();
		//Ko cần id vì id ở entity là tự tăng
		result.setContext(commentDto.getContext());
		return result;
	}
	
	// Trả về enity dựa trên entity đã có (cập nhật thông tin)
	public CommentEntity toEntity(CommentEntity commentEntity, CommentDTO commentDto) {
		//Ko cần id vì id ở entity là tự tăng
		commentEntity.setContext(commentDto.getContext());
		return commentEntity;
	}
}
