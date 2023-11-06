package com.project.tnet.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.ChartDAO;
import com.project.tnet.dto.ChartDTO;

@Service
public class ChartService {
	@Autowired
	private ChartDAO chartdao;

	
	//파이차트 그리기
		public Map<String, Object> getChartData(ChartDTO chart) {
			System.out.println("chart Service");
			// 연령대 리스트 가져오기
			List<ChartDTO> age_chart = chartdao.getAgeGroup(chart);
			
			List<String> strList = new ArrayList<>();
			//List<String> ageGroupList = new ArrayList<>();
			// 연령대 별로 str 뽑아서 리스트에 넣어주기?
			for(ChartDTO chartAge :age_chart) {
				System.out.println("chartAge : "+chartAge);
				List<ChartDTO> chartlist = chartdao.getChartdata(chartAge);
				
				String str ="[";
				str +="['Take_talent' , 'count'] ,";
				int num =0;
				for(ChartDTO  dto : chartlist){
					
					str +="['";
					str  += dto.getLow_name().trim();
					str +="' , ";
					str += dto.getCount();
					str +=" ]";
					
					num ++;
					if(num<chartlist.size()){
						str +=",";
					}		
				}
				str += "]";
								
				strList.add(str);
			}
			
			Map<String, Object> map = new HashMap<>();
			//받고싶은재능과 갯수
			map.put("str", strList);
			//연령대
			map.put("title", age_chart.stream().map(chartAge -> "\"" +  chartAge.getAge_group() + "\"").toList());
			
			return map;
		}
		
		
		//파이차트 성별별 그리기
		public Map<String, Object> piechart(ChartDTO chart) {
			System.out.println("piechart Service");
			//젠더 리스트 가져오깅
			List<ChartDTO> age_chart = chartdao.getGenderGroup(chart);
			System.out.println("성별 리스트 : " + age_chart);
			List<String> strList = new ArrayList<>();
			//List<String> ageGroupList = new ArrayList<>();
			// 성별별로 str 뽑아서 리스트에 넣어주기?
			for(ChartDTO chartAge :age_chart) {
				System.out.println("chartAge : "+chartAge);
				List<ChartDTO> chartlist = chartdao.getChartgenderdata(chartAge);
				
				
				String str ="[";
				str +="['Take_talent' , 'count'] ,";
				int num =0;
				for(ChartDTO  dto : chartlist){
					
					str +="['";
					str  += dto.getLow_name().trim();
					str +="' , ";
					str += dto.getCount();
					str +=" ]";
					
					num ++;
					if(num<chartlist.size()){
						str +=",";
					}		
				}
				str += "]";
				
				System.out.println("str: "+str);
								
				strList.add(str);
			}
			
			Map<String, Object> map = new HashMap<>();
			//받고싶은재능과 갯수
			map.put("genderstr", strList);
			//연령대
			map.put("gendertitle", age_chart.stream().map(chartAge -> "\"" +  chartAge.getGender_group() + "\"").toList());
			
			return map;
		}


		
		//꺾은선 그래프 그리기
		public Map<String, Object> getLineChart(ChartDTO chart) {
			System.out.println("꺾은선 그래프 Service");
			List<ChartDTO> total_data = chartdao.getLinegrape(chart);
			
			List<String> Line_chart = new ArrayList<>();
			String classdata ="[";
//			classdata +="['Year' , 'count'] ,";
			int num =0;
			for(ChartDTO  dto : total_data){
				
				classdata +="['";
				classdata  += dto.getLine_year();
				classdata +="' , ";
				classdata += dto.getCompleted_class();
				classdata +=" ]";
				
				num ++;
				if(num<total_data.size()){
					classdata +=",";
				}		
			}
			classdata += "]";

				
			String userdata ="[";
//			userdata +="['Year' , 'count'] ,";
			int num2 =0;
			for(ChartDTO  dto : total_data){
				
				userdata +="['";
				userdata  += dto.getLine_year();
				userdata +="' , ";
				userdata += dto.getTotal_user();
				userdata +=" ]";
				
				num2 ++;
				if(num2<total_data.size()){
					userdata +=",";
				}		
			}
			userdata += "]";
			
			Line_chart.add(userdata);
			Line_chart.add(classdata);
			
			Map<String, Object> map = new HashMap<>();
			//라인데이터들
//			map.put("line_data_class", classdata);
//			map.put("line_data_user", userdata);
			
			map.put("line_datas", Line_chart);
										
			return map;
		}


		/*
		 * public Map<String, Object> drawChart(ChartDTO chart) {
		 * System.out.println("차트 그리기 service");
		 * 
		 * if(chart.getChart_kind() == "pie") {
		 * 
		 * }else{
		 * 
		 * }
		 * 
		 * return map; }
		 */
}
