package org.kosta.finalproject.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.kosta.finalproject.model.service.TrafficService;
import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.TerminalVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExcelController 
{
	@Resource
	private TrafficService trafficService;
	
	@RequestMapping("admin_setBusInfoByExcel.do")
	public ModelAndView setBusInfoByExcel()
	{
		java.io.FileInputStream fi = null;
		try
		{
		   // FileInputStream클래스의 인스턴스화 하여 파일객체를 얻어온다.
		   fi = new java.io.FileInputStream(new java.io.File("C:\\Users\\kosta\\git\\danim\\finalproject_danim\\src\\main\\webapp\\resources\\excel\\bus.xls"));
		   Workbook workbook = Workbook.getWorkbook(fi);
		   Sheet sheet = workbook.getSheet(0);                  // 첫번째 시트를 얻어옴

		   int rows = sheet.getRows();
		   System.out.println(rows);
		   for(int i=5 ; i < rows; i++)
		   {
			   Cell b = null;  
			   Cell c = null;  
			   Cell d = null;  
			   Cell e = null;
			   Cell f = null;
			   Cell h = null;

			   String busType = "";
			   String terminal_name = "";
			   String end_area = "";
			   String price = "";
			   String leadTime = "";
			   String operation_time = "";

			   b = sheet.getCell(1,i);
			   busType = b.getContents();

			   c = sheet.getCell(2,i);
			   terminal_name = c.getContents();

			   d = sheet.getCell(3,i);
			   end_area = d.getContents();
			   
			   e = sheet.getCell(4,i);
			   price = e.getContents();
			   
			   f = sheet.getCell(5,i);
			   leadTime = f.getContents();
			   
			   h = sheet.getCell(7,i);
			   operation_time = h.getContents();
			  
			   BusVO busVO = new BusVO();
			   TerminalVO terminalVO = trafficService.getTerminalNo(terminal_name);
			  
			   busVO.setbusType(busType.toString());
			   busVO.setTerminalVO(terminalVO);
			   busVO.setEnd_area(end_area);
			   busVO.setPrice(Integer.parseInt(price));
			   busVO.setleadTime(leadTime);
			   busVO.setoperation_time(operation_time);
			   
			   BusVO busCheck = trafficService.checkDB(busVO);  
			   System.out.println(busCheck);
			   if(busCheck == null)
			   {
				   System.out.println("정보삽입");
				   //디비에 정보가 없다면 insert
				   trafficService.insertBusByExcel(busVO);
			   }
			  
		    }
		     
		 }
		catch(Exception e)
		{
	         System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{
				fi.close();
			} 
			catch (IOException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		return new ModelAndView("redirect:home.do");
	}
	 

}
