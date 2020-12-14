package com.bsps.beans.category;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface CategoryMapper {
	public List<Category> selectAll() throws Exception;
	public Category select(Category category) throws Exception;
}