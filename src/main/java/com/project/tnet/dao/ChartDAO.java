package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.ChartDTO;

@Mapper
public interface ChartDAO {
	//연령대 그룹 가져오기
	List<ChartDTO> getAgeGroup(ChartDTO chart);
	
	// 파이차트 그래프 데이터 가져오기
	List<ChartDTO> getChartdata(ChartDTO chartAge);
	
	//꺾은선 그래프 데이터 가져오기
	List<ChartDTO> getLinegrape(ChartDTO chart);

	//파이차트 성별별 데이터
	List<ChartDTO> getGenderGroup(ChartDTO chart);

	List<ChartDTO> getChartgenderdata(ChartDTO chartAge);

	int CompletedClass(ChartDTO chart);

	int InProgressClass(ChartDTO chart);

	int DonationKing(ChartDTO chart);

	List<ChartDTO> getClassCSV();

	List<ChartDTO> getMemberCSV();

	List<ChartDTO> getCSVclassAge();

	List<ChartDTO> getCSVcountGender();

}
