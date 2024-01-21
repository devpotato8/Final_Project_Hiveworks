package com.dna.hiveworks.model.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.ReminderDao;
import com.dna.hiveworks.model.dto.Reminder;

@Repository("reminderdao")
public class ReminderDaoImpl implements ReminderDao {
	
	@Override
	public int insertReminder(SqlSession session, Reminder reminder) {
		return session.insert("schedule.insertReminder",reminder);
	}
	
	@Override
	public int updateReminderYn(SqlSession session, int calNo) {
		return session.update("schedule.updateReminderYn",calNo);
	}

}
