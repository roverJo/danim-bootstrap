package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgeListVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LodgeController {
	@Resource
	private LodgeService lodgeService;
	//지역 검색
	@RequestMapping("searchAreaLodge.do")
	@ResponseBody
	public List<AreaVO> searchArea()	{
		List<AreaVO> areaList = (List<AreaVO>) lodgeService.searchArea();
		return areaList;
	}
	//세부지역 검색
		@RequestMapping("searchLodgeDetailArea.do")
		@ResponseBody
		public List<DetailAreaVO> searchDetailArea(String area_name){			
			List<DetailAreaVO> detailAreaList=(List<DetailAreaVO>) lodgeService.searchDetailArea(area_name);
			return detailAreaList;
		}
	
	@RequestMapping("showlodge.do")
	public ModelAndView showlodge(HttpServletRequest request,int no){
		List<LodgeVO> list=lodgeService.showlodge(no);
		List<String> rlist=lodgeService.lodgeNo();
		request.setAttribute("rlist", rlist);
		return new ModelAndView("lodge_lodge_result","list",list);
	}
	
	@RequestMapping("searchLodgeByNameAndKind.do")
	public ModelAndView searchLodgeByNameAndKind(LodgeVO vo,String pageNo){	
		System.out.println("vvvvv"+vo);
		LodgeListVO lodgeListVO = lodgeService.searchLodgeByNameAndKind(vo,pageNo);
		System.out.println(lodgeListVO);
		return new ModelAndView("lodge_searchLodge","list",lodgeListVO);
	}
}
