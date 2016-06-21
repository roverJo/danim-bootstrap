package org.kosta.finalproject.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.BestFoodDAO;
import org.kosta.finalproject.model.vo.PagingBean;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodAndParamMapVO;
import org.kosta.finalproject.model.vo.food.BestFoodListVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.kosta.finalproject.model.vo.lodge.LodgeAndParamMapVO;
import org.kosta.finalproject.model.vo.lodge.LodgeListVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.springframework.stereotype.Service;

@Service
public class BestFoodServiceImpl implements BestFoodService {
	@Resource
	private BestFoodDAO bestFoodDAO;
	
	@Resource(name="pagingConfigFood")
	private Map<String,Integer> pagingConfigFood; 
	
	@Override
	public List<AreaVO> searchArea() 
	{
		return bestFoodDAO.searchArea();
	}
	public List<DetailAreaVO> searchDetailArea(String area_name){
		return bestFoodDAO.searchDetailArea(area_name);
	}
	public BestFoodListVO searchBestFood(BestFoodVO bestFoodVO,String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);	
		return searchBestFood(bestFoodVO,pno);
	}
	
	public BestFoodListVO searchBestFood(BestFoodVO bestFoodVO, int pageNo) 
	{
		List<BestFoodVO> list = bestFoodDAO.searchBestFood(new BestFoodAndParamMapVO(bestFoodVO,pageNo,pagingConfigFood.get("numberOfContent")));
		int total=bestFoodDAO.totalFoodByFoodType(bestFoodVO);
		System.out.println(total);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigFood);
		BestFoodListVO lvo=new BestFoodListVO(list,paging);
		return lvo;
	}
	public BestFoodListVO searchAllBestFood(BestFoodVO bestFoodVO,String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);	
		return searchAllBestFood(bestFoodVO,pno);
	}
	
	public BestFoodListVO searchAllBestFood(BestFoodVO bestFoodVO, int pageNo) 
	{
		List<BestFoodVO> list = bestFoodDAO.searchAllBestFood(new BestFoodAndParamMapVO(bestFoodVO,pageNo,pagingConfigFood.get("numberOfContent")));
		int total=bestFoodDAO.totalFood(bestFoodVO);
		System.out.println(total);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigFood);
		BestFoodListVO lvo=new BestFoodListVO(list,paging);
		return lvo;
	}
	public List<MenuVO> detailFood(int foodshop_no){
		return bestFoodDAO.detailFood(foodshop_no);
	}
	public void updateHits(int foodshop_no){
		bestFoodDAO.updateHits(foodshop_no);
	}
	public List<BestFoodVO> foodtop5list(){
		return bestFoodDAO.foodtop5list();
	}
	public BestFoodVO getFoodInfo(int foodshop_no){
		return bestFoodDAO.getFoodInfo(foodshop_no);
	}
	public void resetHits(){
		bestFoodDAO.resetHits();
	}
	public void foodShopRegister(BestFoodVO bestFoodVO){
		bestFoodDAO.foodShopRegister(bestFoodVO);
	}
	public List<BestFoodVO> allFoodShop(){
		return bestFoodDAO.allFoodShop();
	}
	public BestFoodVO foodshopfind(BestFoodVO bestFoodVO){
		return bestFoodDAO.foodshopfind(bestFoodVO);
	}
	public BestFoodVO foodShopFindByNo(int foodshop_no){
		return bestFoodDAO.foodShopFindByNo(foodshop_no);
	}
	public void foodMenuRegister(MenuVO menuVO){
		bestFoodDAO.foodMenuRegister(menuVO);
	}
	public List<MenuVO> findMenu(int foodshop_no){
		return bestFoodDAO.findMenu(foodshop_no);
	}
}
