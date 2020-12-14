package com.bsps.beans.picture;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface PictureMapper {
	public List<Picture> selectAll() throws Exception;
	public Picture select(Picture picture) throws Exception;
	public void insert(Picture picture) throws Exception;
	public void update(Picture picture) throws Exception;
}