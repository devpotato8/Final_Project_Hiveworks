package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleService {
	
	
	List<Schedule> selectScheduleAll();

	int insertSchedule(Schedule schedule);

	//resource
	int insertResource(Resource resource);
	
	List<Resource> selectResourceAll();
	
	//reservation 
	List<Schedule> selectReserveAll();
	
	List<Schedule> selectReserveByNo(int empNo);

	List<Schedule> selectReserveByCode(String calCode);
	
	int reserveResource(Schedule schedule, int resourceNo);
	
	//project
	List<Schedule> selectprojectAll();
	
	List<Schedule> selectprojectByEmpNo(int empNo);
	
	Schedule selectprojectByCalNo(int calNo);
	
	
	

}
