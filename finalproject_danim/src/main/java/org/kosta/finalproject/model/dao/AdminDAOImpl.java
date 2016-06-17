package org.kosta.finalproject.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.member.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate template;
	
	/*@Override
	public List<MemberVO> memberList(){
		return template.selectList("admin.memberList");
	}*/
	public int checkPass(MemberVO vo){
		return template.selectOne("admin.checkPass",vo);
	}
	public void deleteMember(String id){
		template.delete("admin.deleteMember",id);
	}
	public List<MemberVO> adminList(){
		return template.selectList("admin.adminList");
	}
	public List<MemberVO> memberById(String id){
		return template.selectList("admin.memberById",id);
	}
	public List<MemberVO> memberByNick(String nickname){
		return template.selectList("admin.memberByNick",nickname);
	}
	public MemberVO checkMemberId(String id){
		return template.selectOne("admin.checkMemberId", id);
	}
	public void appointAdmin(String id){
		template.update("admin.appointAdmin",id);
	}
	public void fireAdmin(String id){
		template.update("admin.fireAdmin",id);
	}
	@Override
	public List<MemberVO> memberList(Map<String, Integer> pagingConfig) {
		return template.selectList("admin.memberList", pagingConfig);
	}
	@Override
	public int totalMember() {
		return template.selectOne("admin.totalMember");
	}
}
