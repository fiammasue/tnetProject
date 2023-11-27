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
		
		//처음 한번에 다가져오기
		public Map<String, Object> getCounts(ChartDTO chart) {
			System.out.println("기간조회로 카운트 가져오기 서비스");
			System.out.println("시작 시간 : "+ chart.getStart_date() + " 끝나는 시간: "+ chart.getEnd_date());
			
			int completed = chartdao.CompletedClass(chart);
			int inprogress = chartdao.InProgressClass(chart);
			int donationking = chartdao.DonationKing(chart);
			
			System.out.println(completed);
		
			
			Map<String, Object> map = new HashMap<>();
			map.put("completed", completed);
			map.put("inprogress", inprogress);
			map.put("donationking", donationking);
			
			return map;
		}
		
		
		//kind값을 받아서 count로 한개값만 넘겨주기
		public Map<String, Object> getCounts_byKind(ChartDTO chart) {
			System.out.println("기간조회로 개별 카운트 가져오기 서비스");
			System.out.println("차트를 못받아오나?"+ chart.getCount_kind());
			System.out.println("날짜를 못받아온다"+  chart.getStart_date());

			
			Map<String, Object> map = new HashMap<>();			
			if("inprogress".equals(chart.getCount_kind())) {
				int inprogress = chartdao.InProgressClass(chart);
				System.out.println("inprogress : "+inprogress);
				map.put("count", inprogress);
			}else if("completed".equals(chart.getCount_kind())){
				int completed = chartdao.CompletedClass(chart);
				map.put("count", completed);
				System.out.println("completed : "+completed);
			}else {
				int donationking = chartdao.DonationKing(chart);
				map.put("count", donationking);
				System.out.println("donationking : "+donationking);
			}
			
			return map;
		}

		
		//CSV 파일 데이터 가져오기
		public Map<String, Object> getCSVlist(String kind_of_download) {
			System.out.println("CSV데이터 가져오기 서비스");
			System.out.println("kind_of_download : "+kind_of_download);
			
			Map<String, Object> map = new HashMap<>();			
			List<String[]> listStrings = new ArrayList<>();
			
			if(kind_of_download.equals("0")) {
				System.out.println("완료된 수업 추이");
				List<ChartDTO> csv = chartdao.getClassCSV();				
				listStrings.add(new String[]{"년도", "완료된 수업 수"});
				
				   for (ChartDTO chart : csv) {
			            String[] rowData = new String[2];
			            rowData[0] = chart.getLine_year();
			            rowData[1] = String.valueOf(chart.getCompleted_class());
			            listStrings.add(rowData);
			        }
				
				map.put("csv", listStrings);
				map.put("name", "com_class.csv");
				
			}else if(kind_of_download.equals("1")) {
				System.out.println("회원 추이");
				List<ChartDTO> csv = chartdao.getMemberCSV();				
				listStrings.add(new String[]{"년도", "회원 수"});
				
				   for (ChartDTO chart : csv) {
			            String[] rowData = new String[2];
			            rowData[0] = chart.getLine_year();
			            rowData[1] = String.valueOf(chart.getTotal_user());
			            listStrings.add(rowData);
			        }
				
				map.put("csv", listStrings);
				map.put("name", "total_users.csv");
				
			}else if(kind_of_download.equals("age")) {
				System.out.println("파이차트 연령대");
				List<ChartDTO> csv = chartdao.getCSVclassAge();				
				listStrings.add(new String[]{"그룹", "과목", "선호수"});
				
				   for (ChartDTO chart : csv) {
			            String[] rowData = new String[3];
			            rowData[0] = chart.getAge_group();
			            rowData[1] = chart.getLow_name();
			            rowData[2] = String.valueOf(chart.getCount());
			            listStrings.add(rowData);
			        }
				
				map.put("csv", listStrings);
				map.put("name", "age_of_count.csv");
				
			}else {
				System.out.println("파이차트 성별");
				List<ChartDTO> csv = chartdao.getCSVcountGender();	
				listStrings.add(new String[]{"그룹", "과목", "선호수"});
				
				   for (ChartDTO chart : csv) {
			            String[] rowData = new String[3];
			            rowData[0] = chart.getGender_group();
			            rowData[1] = chart.getLow_name();
			            rowData[2] = String.valueOf(chart.getCount());
			            listStrings.add(rowData);
			        }
				
				map.put("csv", listStrings);
				map.put("name", "gender_of_count.csv");
			}
			return map;
		}
		
		
		
		
}
