package com.javaweb.converter;

import org.springframework.stereotype.Component;

import com.javaweb.dto.NewsDTO;
import com.javaweb.entity.NewsEntity;

@Component
public class NewsConverter {
	//khi làm chúng ta sẽ không làm trực tiếp xuống entity mà thông qua 1 tầng khác gọi là DTO để tránh ảnh hưởng quá nhiều tới entity
	//convert data từ DTO->Entity (giống resultSet trong jdbc)
	//@Component để sử dụng autowired trong NewsService
	public NewsDTO toDto(NewsEntity newsEntity) {
		NewsDTO result = new NewsDTO();
		result.setId(newsEntity.getId()); //Khi có data thì DTO mới đổ lên entity nên phải có id
		result.setTitle(newsEntity.getTitle());
		result.setShortDescription(newsEntity.getShortDescription());
		result.setContent(newsEntity.getContent());
		result.setThumbnail(newsEntity.getThumbnail());
		result.setBreakingNews(newsEntity.isBreakingNews());
		result.setLatestNews(newsEntity.isLatestNews());
		result.setCategoryCode(newsEntity.getCategory().getCode());
		result.setCreatedBy(newsEntity.getCreatedBy());
		result.setCreatedDate(newsEntity.getCreatedDate());
		result.setModifiedBy(newsEntity.getModifiedBy());
		result.setModifiedDate(newsEntity.getModifiedDate());
		return result;
	}
	
	//Convert data từ entity -> DTO (entity hoàn toàn mới)
	public NewsEntity toEntity(NewsDTO newsDto) {
		NewsEntity result = new NewsEntity();
		//Ko cần id vì id ở entity là tự tăng
		result.setTitle(newsDto.getTitle());
		result.setShortDescription(newsDto.getShortDescription());
		result.setContent(newsDto.getContent());
		result.setThumbnail(newsDto.getThumbnail());
		result.setBreakingNews(newsDto.isBreakingNews());
		result.setLatestNews(newsDto.isLatestNews());
		return result;
	}
	
	// Trả về enity dựa trên entity đã có (cập nhật thông tin)
	public NewsEntity toEntity(NewsEntity newsEntity, NewsDTO newsDto) {
		//Ko cần id vì id ở entity là tự tăng
		newsEntity.setTitle(newsDto.getTitle());
		newsEntity.setShortDescription(newsDto.getShortDescription());
		newsEntity.setContent(newsDto.getContent());
		newsEntity.setThumbnail(newsDto.getThumbnail());
		newsEntity.setBreakingNews(newsDto.isBreakingNews());
		newsEntity.setLatestNews(newsDto.isLatestNews());
		return newsEntity;
	}
}
