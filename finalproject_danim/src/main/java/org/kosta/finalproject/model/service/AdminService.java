package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.member.MemberListVO;
import org.kosta.finalproject.model.vo.member.MemberVO;

public interface AdminService {

	public abstract MemberListVO memberList(String pageNo);
	public abstract MemberListVO memberList(int pageNo);
	public abstract int checkPass(MemberVO vo);
	public abstract void deleteMember(String id);
	public abstract List<MemberVO> adminList();
	public abstract List<MemberVO> memberById(String id);
	public abstract List<MemberVO> memberByNick(String nickname);
	public abstract MemberVO checkMemberId(String id);
	public abstract void appointAdmin(String id);
	public abstract void fireAdmin(String id);
}