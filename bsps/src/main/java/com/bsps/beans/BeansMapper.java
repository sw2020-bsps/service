package com.bsps.beans;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BeansMapper {
	public List<Beans> selectAll(Beans beans) throws Exception;
	public Beans select(Beans beans) throws Exception;
	public void insert(Beans beans) throws Exception;
	public void update(Beans beans) throws Exception;
}