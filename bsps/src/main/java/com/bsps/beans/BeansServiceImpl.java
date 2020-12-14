package com.bsps.beans;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BeansServiceImpl implements BeansService {
	@Autowired
	private BeansMapper beansMapper;

	@Override
	public void registerBeans(Beans beans) {
		try {
			if (null != beans) {
				if (false == this.checkDuplicate(beans)) {
					if (0 != beans.getPictureNo() ) {
						beansMapper.insert(beans);
					} else {
						beans.setPictureNo(1);
						beansMapper.insert(beans);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Beans> searchAllBeans(Beans beans) {
		List<Beans> beansList = new ArrayList<Beans>();
		
		try {
			if (this.checkEmpty(beans)) {				
				beansList = beansMapper.selectAll(beans);
			} else {
				beansList = beansMapper.selectAll(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return beansList;
	}
	
	@Override
	public Beans searchBeans(Beans beans) {
		try {
			beans = beansMapper.select(beans);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return beans;
	}

	@Override
	public void modifyBeans(Beans beans) {
		try {
			if (this.checkEmpty(beans)) {
				beansMapper.update(beans);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteBeans(Beans beans) {		
		try {
			if (this.checkEmpty(beans)) {
				beans.setDisplayStatus('N');
				beansMapper.update(beans);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean checkDuplicate(Beans beans) {
		boolean isDupli = false;
		
		try {
			List<Beans> targetList = beansMapper.selectAll(null);
			
			Iterator<Beans> iterator = targetList.iterator();
						
			while (iterator.hasNext()) {
				Beans targetBeans = iterator.next();
				
				if (this.checkEmpty(beans) && this.checkEmpty(targetBeans)) {
					if (beans.getName().equals(targetBeans.getName())) {
						isDupli = true;
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return isDupli;
	}
	
	@Override
	public boolean checkEmpty(Beans beans) {
		boolean isNotEmpty = false;
		
		if (null != beans) {
			if (null != beans.getName() && "" != beans.getName()) {
				isNotEmpty = true;
			}
		}
		return isNotEmpty;
	}
}
