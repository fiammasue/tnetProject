package com.project.tnet.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.tnet.dto.ChartDTO;
import com.project.tnet.service.ChartService;

@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;
	
//	@ResponseBody
//	@RequestMapping("/piechart/gender_group.do")
//	public  Map<String, Object> piechart_gender(ChartDTO chart) throws Exception {
//    	System.out.println("main-chart-controller");
//
//    	Map<String, Object> map = chartService.piechart(chart);
//    	System.out.println(map.size()>0);
//    	if(map.size()>0) {
//    		map.put("status", true);
//    	}
//    		map.put("status", false);
//    	
//		return map ;		
//	} 		
	
//	@ResponseBody
//	@RequestMapping("/piechart/age_group.do")
//	public  Map<String, Object> piechart_age(ChartDTO chart) throws Exception {
//    	System.out.println("main-chart-controller");
//
//    	Map<String, Object> map = chartService.getChartData(chart);
//    	System.out.println(map.size()>0);
//    	if(map.size()>0) {
//    		map.put("status", true);
//    	}
//    		map.put("status", false);
//    	
//		return map ;		
//	} 		
	
	@ResponseBody
	@RequestMapping("/admin/counts.do")
	public  Map<String, Object> counts(@RequestBody ChartDTO chart) throws Exception {
    	System.out.println("chart 컨트롤러 기간조회");

    	Map<String, Object> map = chartService.getCounts_byKind(chart);
    	System.out.println(map.size()>0);
    	if(map.size()>0) {
    		map.put("count_status", true);
    	}
    		map.put("count_status", false);
    	
		return map ;		
	} 		


}
