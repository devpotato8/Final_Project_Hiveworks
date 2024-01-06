package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleDao {
	
	int insertSchedule(SqlSession session, Schedule schedule);
	
	List<Schedule> selectScheduleAll(SqlSession session);
	
	int reserveResource(SqlSession session, Schedule schedule);
	
	int insertResource(SqlSession session, Resource resource);
	

}
