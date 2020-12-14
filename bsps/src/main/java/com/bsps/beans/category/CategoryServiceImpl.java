package com.bsps.beans.category;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> searchAllCategory() {
		List<Category> categoryList = new ArrayList<Category>();
		
		try {
			categoryList = categoryMapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categoryList;
	}

	@Override
	public Category searchCategory(Category category) {		
		int categoryNo = category.getCategoryNo();
		String categoryName = category.getCategoryName();
		
		try {
			if (null != category) {
				if (0 != categoryNo && null == categoryName) {
					category = categoryMapper.select(category);
				} else if (null != categoryName && 0 != categoryNo) {
					category = categoryMapper.select(category);
				} else {
					return category;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
}
