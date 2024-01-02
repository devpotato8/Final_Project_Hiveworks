package com.dna.hiveworks.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleDao {
	
	int insertSchedule(SqlSession session, Schedule schedule);

}
