package com.bsps.beans;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BeansService {
	public void registerBeans(Beans beans);
	public List<Beans> searchAllBeans(Beans beans);
	public Beans searchBeans(Beans beans);
	public void modifyBeans(Beans beans);
	public void deleteBeans(Beans beans);
	public boolean checkDuplicate(Beans beans);
	public boolean checkEmpty(Beans beans);
}
