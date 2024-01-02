package com.dna.hiveworks.service;

import java.util.ArrayList;

import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleService {
	
	
	public ArrayList<Schedule> scheduleList();

	int insertSchedule(Schedule schedule);

	
	

}
