package com.bsps.beans.category;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface CategoryService {
	public List<Category> searchAllCategory();
	public Category searchCategory(Category category);
}