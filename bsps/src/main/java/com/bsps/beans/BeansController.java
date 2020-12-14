package com.bsps.beans;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bsps.beans.category.Category;
import com.bsps.beans.category.CategoryServiceImpl;
import com.bsps.beans.picture.Picture;
import com.bsps.beans.picture.PictureServiceImpl;

@RestController
@RequestMapping("/beans")
public class BeansController {
	@Autowired
	private BeansServiceImpl beansService;
	@Autowired
	private PictureServiceImpl pictureService;
	@Autowired
	private CategoryServiceImpl categoryService;

	@GetMapping("/form")
	public ModelAndView doRegisterBeans() {
		ModelAndView mav = new ModelAndView("beans/register");
		
		try {			
			List<Category> categoryList = categoryService.searchAllCategory();

			mav.addObject("categoryList", categoryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	@PostMapping
	public ModelAndView doRegisterBeans(@ModelAttribute @Valid Beans beans, @RequestBody MultipartFile attach, Errors errors) {
		if (errors.hasErrors()) {
			return new ModelAndView("/error");
		}
		
		if (beansService.checkEmpty(beans)) {
			Picture picture = pictureService.registerPicture(attach);

			beans.setPictureNo(picture.getPictureNo());
			beansService.registerBeans(beans);
		}
		
		return new ModelAndView(new RedirectView("/beans"));
	}
	
	@GetMapping
	public ModelAndView doSearchAllBeans() {
		ModelAndView mav = new ModelAndView("beans/menu");

		try {
			List<Beans> beansList = beansService.searchAllBeans(null);
			List<Category> categoryList = categoryService.searchAllCategory();

			if (null != beansList && null != categoryList) {
				mav.addObject("beansList", beansList);
				mav.addObject("categoryList", categoryList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	@GetMapping("/category/{categoryNo}")
	public ModelAndView doSearchBeansByCategory(@PathVariable int categoryNo) {
		ModelAndView mav = new ModelAndView("beans/menu");
		Beans beans = new Beans(0, categoryNo);
		
		try {
			List<Beans> beansList = beansService.searchAllBeans(beans);

			if (null != beansList) {
				mav.addObject("beansList", beansList);

				List<Category> categoryList = categoryService.searchAllCategory();
				Category category = categoryService.searchCategory(new Category(categoryNo));

				if (null != category && null != categoryList) {
					mav.addObject("categoryList", categoryList);
					mav.addObject("category", category);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	@GetMapping("/{beansNo}")
	public ModelAndView doSearchBeans(@PathVariable int beansNo) {
		ModelAndView mav = new ModelAndView("beans/view");

		try {
			if (0 != beansNo) {
				Beans beans = new Beans(beansNo);
				beans = beansService.searchBeans(beans);

				if (beansService.checkEmpty(beans)) {
					mav.addObject("beans", beans);
					
					List<Category> categoryList = categoryService.searchAllCategory();
					Category category = categoryService.searchCategory(new Category(beans.getCategoryNo()));

					if (null != category && null != categoryList) {
						mav.addObject("categoryList", categoryList);
						mav.addObject("category", category);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	@GetMapping("/{beansNo}/form")
	public ModelAndView doModifyBeans(@PathVariable int beansNo) {
		ModelAndView mav = new ModelAndView("beans/modify");
		Beans beans = new Beans(beansNo);
		
		try {
			List<Category> categoryList = categoryService.searchAllCategory();

			mav.addObject("categoryList", categoryList);
			mav.addObject("beans", beansService.searchBeans(beans));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@PutMapping
	public ModelAndView doModifyBeans(@ModelAttribute @Valid Beans beans, @RequestBody MultipartFile attach, Errors errors) {
		if (errors.hasErrors()) {
			return new ModelAndView("/error");
		}
		
		if (beansService.checkEmpty(beans)) {
			beansService.modifyBeans(beans);
			
			if (pictureService.checkChange(beans.getPictureNo(), attach)) {
				pictureService.modifyPicture(beans.getPictureNo(), attach);
			}
		}

		return new ModelAndView(new RedirectView("/beans/" + beans.getBeansNo()));
	}

	@DeleteMapping
	public ModelAndView doDeleteBeans(@ModelAttribute Beans beans) {
		if (beansService.checkEmpty(beans)) {
			beansService.deleteBeans(beans);
		}

		return new ModelAndView(new RedirectView("/beans"));
	}

	@GetMapping("/picture/{pictureNo}")
	public void doDisplayBeansPicture(@PathVariable int pictureNo) {
		pictureService.displayPicture(pictureService.searchPictureByNo(pictureNo));
	}
}
