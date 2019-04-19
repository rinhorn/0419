package game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import game.model.domain.Member;
import game.model.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/admin/member/edit", method=RequestMethod.POST)
	public ModelAndView update(Member member) {
		ModelAndView mav=new ModelAndView("/admin/member/index");
		memberService.update(member);
		return mav;
	}
	
	@RequestMapping(value="/admin/member/delete", method=RequestMethod.POST)
	public ModelAndView delete(int member_id) {
		ModelAndView mav=new ModelAndView("/admin/member/index");
		memberService.delete(member_id);
		return mav;
	}
}
