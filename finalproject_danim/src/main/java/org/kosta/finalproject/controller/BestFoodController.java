package org.kosta.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.finalproject.model.service.BestFoodService;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodListVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BestFoodController {
	@Resource
	private BestFoodService bestFoodService;
	
	@RequestMapping("searchAreaFood.do")
	@ResponseBody
	public ArrayList<AreaVO> searchArea()
	{
		ArrayList<AreaVO> areaList = (ArrayList<AreaVO>) bestFoodService.searchArea();
		return areaList;
	}
	
	//세부지역 검색
	@RequestMapping("searchFoodDetailArea.do")
	@ResponseBody
	public List<DetailAreaVO> searchDetailArea(String area_name){
		
		ArrayList<DetailAreaVO> detailAreaList=(ArrayList<DetailAreaVO>) bestFoodService.searchDetailArea(area_name);
		return detailAreaList;
	}
	
	//음식점 검색(메인검색)
	@RequestMapping("searchBestFood.do")
	public ModelAndView searchBestFood(BestFoodVO bestFoodVO,String pageNo,HttpServletRequest request){
		BestFoodListVO bestFoodListVO = null;
		request.setAttribute("foodtype", bestFoodVO.getFoodtype());
		
		if(bestFoodVO.getFoodtype().equals("전체")){
			bestFoodListVO=bestFoodService.searchAllBestFood(bestFoodVO,pageNo);
		}else{
			bestFoodListVO= bestFoodService.searchBestFood(bestFoodVO,pageNo);
		}
		
		return new ModelAndView("bestfood_search_result","foodList",bestFoodListVO);
	}
	
	//음식점 메뉴 상세보기
	@RequestMapping("detailFood.do")
	public ModelAndView detailFood(int foodshop_no){
		List<MenuVO> detailFoodList=bestFoodService.detailFood(foodshop_no);
		System.out.println(detailFoodList);
		bestFoodService.updateHits(foodshop_no);
		return new ModelAndView("bestfood_detail_result","dList",detailFoodList);
	}
	
	

}	




