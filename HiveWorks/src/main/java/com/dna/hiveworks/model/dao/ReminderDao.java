package com.dna.hiveworks.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Reminder;

public interface ReminderDao {
	
	int insertReminder(SqlSession session, Reminder reminder);
	
	int updateReminderYn(SqlSession session, int calNo);

}
