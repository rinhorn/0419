package game.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import game.common.board.Pager;
import game.model.domain.Member;
import game.model.service.MemberService;

@RestController
public class RestMemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private Pager pager;
	
	@RequestMapping(value="/admin/members", method=RequestMethod.GET)
	public List list() {
		List<Member> memberList=memberService.selectAll();
		return memberList;
	}
	
	@RequestMapping(value="/admin/pagers", method=RequestMethod.GET)
	public Pager paging(HttpServletRequest request) {
		List<Member> memberList=memberService.selectAll();
		pager.init(request,memberList.size());
		return pager;
	}
	
	@RequestMapping(value="/admin/member/{member_id}", method=RequestMethod.GET)
	public Member detail(@PathVariable("member_id") int member_id) {
		Member member=memberService.select(member_id);
		
		return member;
	}
	
	@RequestMapping(value="admin/membersearch", method=RequestMethod.GET)
	public Member search(@RequestParam("id") String id) {
		Member member=memberService.search(id);
		
		return member;
	}
}