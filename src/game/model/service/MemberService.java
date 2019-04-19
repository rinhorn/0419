package game.model.service;

import java.util.List;

import game.model.domain.Member;

public interface MemberService {
	public int insert(Member member);
	public List selectAll();
	public Member select(int member_id);
	public void update(Member member);
	public void delete(int member_id);
	public Member search(String id);
}