package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.AdminService;
import org.kosta.finalproject.model.vo.member.MemberListVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	
	@RequestMapping("admin_login.do")
	public String adminLogin(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		if(vo.getAdmin()==0){
			return "home";
		}
		return "admin_admin_login";
	}
	@RequestMapping("admin_member.do")
	public ModelAndView adminMember(String pageNo){
		MemberListVO lvo=adminService.memberList(pageNo);
		return new ModelAndView("admin_admin_member","lvo",lvo);
	}
	@RequestMapping("admin_popup.do")
	public ModelAndView memberPup(String id){
		return new ModelAndView("admin/admin_member_popup","id",id);
	}
	@RequestMapping("admin_checkPass.do")
	public ModelAndView checkPass(HttpServletRequest request, String id,String password){
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		vo.setPassword(password);
		int check=adminService.checkPass(vo);
		mv.setViewName("admin/admin_member_popup_result");
		mv.addObject("check", check);
		mv.addObject("id", id);
		return mv;
	}
	@RequestMapping("admin_delete.do")
	public String deleteMember(String id){
			adminService.deleteMember(id);
		return "redirect:admin_member.do";
	}
	@RequestMapping("admin_appoint.do")
	public ModelAndView appointMember(){
		List<MemberVO> list=adminService.adminList();
		return new ModelAndView("admin_admin_appoint","list",list);
	}
	@RequestMapping("findJSONAdmin.do")
	@ResponseBody
	public List<MemberVO> findNickCheck(String administer,String inputVal){
		List<MemberVO> list=null;
		if(administer.equals("id")){
			list=adminService.memberById(inputVal);
		}else if(administer.equals("nickname")){
			list=adminService.memberByNick(inputVal);
		}
		return list;
	}
	@RequestMapping("admin_appointMember.do")
	public ModelAndView adminAppoint(String appoint){
		MemberVO vo = adminService.checkMemberId(appoint);
		if(vo.getAdmin()==0){
			adminService.appointAdmin(appoint);
		}else{
			vo=null;
		}
		return new ModelAndView("admin_admin_appoint_result","vo",vo);
	}
	@RequestMapping("admin_fireAdmin.do")
	public String fireAdmin(String id){
		adminService.fireAdmin(id);
		return "redirect:admin_appoint.do";
	}
}
