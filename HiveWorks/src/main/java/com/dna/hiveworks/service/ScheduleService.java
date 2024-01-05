package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleService {
	
	
	List<Schedule> selectScheduleAll();

	int insertSchedule(Schedule schedule);


	int reserveResource(Schedule schedule);

	
	

}
