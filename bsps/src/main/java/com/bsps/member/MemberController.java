package com.bsps.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/form")
	public ModelAndView doRegisterMember() {
		return  new ModelAndView("member/register");
	}

	@PostMapping
	public ModelAndView doRegisterMember(@ModelAttribute Member member) {
		ModelAndView mav = new ModelAndView(new RedirectView("/main"));
		
		memberService.registerMember(member);
		return mav;
	}

	@GetMapping("/{emailAddress}")
	public ModelAndView doSearchMember(@PathVariable String emailAddress) {
		ModelAndView mav = new ModelAndView("member/view");
		Member member = (Member) session.getAttribute("member");

		if (member.getEmailAddress().equals(emailAddress)) {
			mav.addObject("targetMember", member);
		}
		
		return mav;
	}

	@GetMapping("/{emailAddress}/form")
	public ModelAndView doModifyMember(@PathVariable String emailAddress) {
		ModelAndView mav = new ModelAndView("member/modify");
		
		mav.addObject("member", memberService.searchMember(emailAddress));
		return mav;
	}

	@PutMapping
	public ModelAndView doModifyMember(@ModelAttribute Member member) {
		ModelAndView mav = new ModelAndView();
		Member targetMember = (Member) session.getAttribute("member");
		
		if (memberService.checkEmpty(targetMember)) {
			session.setAttribute("member", memberService.modifyMember(member));
			member = (Member) session.getAttribute("member");
		}
		
		mav.setView(new RedirectView("/member/" + member.getEmailAddress()));
		return mav;
	}

	@DeleteMapping
	public ModelAndView doDeleteMember() {
		ModelAndView mav = new ModelAndView(new RedirectView("/main"));
		Member member = (Member) session.getAttribute("member");
		
		if(memberService.deleteMember(member)) {
			session.invalidate();
		}
		return mav;
	}
}
