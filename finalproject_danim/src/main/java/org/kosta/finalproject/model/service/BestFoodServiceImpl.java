package org.kosta.finalproject.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.BestFoodDAO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.springframework.stereotype.Service;

@Service
public class BestFoodServiceImpl implements BestFoodService {
	@Resource
	private BestFoodDAO bestFoodDAO;
	
	@Override
	public List<AreaVO> searchArea() 
	{
		return bestFoodDAO.searchArea();
	}
	public List<DetailAreaVO> searchDetailArea(String area_name){
		return bestFoodDAO.searchDetailArea(area_name);
	}
	public List<BestFoodVO> searchBestFood(BestFoodVO bestFoodVO){
		return bestFoodDAO.searchBestFood(bestFoodVO);
	}
	
	public List<BestFoodVO> searchAllBestFood(BestFoodVO bestFoodVO){
		return bestFoodDAO.searchAllBestFood(bestFoodVO);
	}
	
	public List<MenuVO> detailFood(int foodshop_no){
		return bestFoodDAO.detailFood(foodshop_no);
	}
	public void updateHits(int foodshop_no){
		bestFoodDAO.updateHits(foodshop_no);
	}
	@Override
	public BestFoodVO getBestFoodInfo(int foodshop_no) 
	{
		// TODO Auto-generated method stub
		return bestFoodDAO.getBestFoodInfo(foodshop_no);
	}
	@Override
	public List<BestFoodVO> foodtop5list(){
		return bestFoodDAO.foodtop5list();
	}
}
