package org.kosta.finalproject.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.AdminDAO;
import org.kosta.finalproject.model.vo.PagingBean;
import org.kosta.finalproject.model.vo.member.MemberListVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDAO adminDAO;
	@Resource(name="pagingConfigMember")
	private Map<String,Integer> pagingConfigMember;
	
	/*@Override
	public List<MemberVO> memberList(){
		return adminDAO.memberList();
	}*/
	@Override
	public MemberListVO memberList(String pageNo){			
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);		
		return memberList(pno);
	}
	@Override
	public MemberListVO memberList(int pageNo){		
		HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		paramMap.put("pageNo", pageNo);
		paramMap.put("numberOfContent", pagingConfigMember.get("numberOfContent"));
		List<MemberVO> list=adminDAO.memberList(paramMap);
		int total=adminDAO.totalMember();
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigMember);
		MemberListVO lvo=new MemberListVO(list,paging);
		return lvo;
	}
	
	@Override
	public int checkPass(MemberVO vo) {
		return adminDAO.checkPass(vo);
	}

	@Override
	public void deleteMember(String id) {
		adminDAO.deleteMember(id);
	}

	@Override
	public List<MemberVO> adminList() {
		return adminDAO.adminList();
	}

	@Override
	public List<MemberVO> memberById(String id) {
		return adminDAO.memberById(id);
	}

	@Override
	public List<MemberVO> memberByNick(String nickname) {
		return adminDAO.memberByNick(nickname);
	}

	@Override
	public MemberVO checkMemberId(String id) {
		return adminDAO.checkMemberId(id);
	}

	@Override
	public void appointAdmin(String id) {
		adminDAO.appointAdmin(id);		
	}

	@Override
	public void fireAdmin(String id) {
		adminDAO.fireAdmin(id);		
	}
}
