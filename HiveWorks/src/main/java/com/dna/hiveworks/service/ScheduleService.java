package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleService {
	
	
	List<Schedule> selectScheduleAll();

	int insertSchedule(Schedule schedule);


	int reserveResource(Schedule schedule);
	
	int insertResource(Resource resource);

	
	

}
