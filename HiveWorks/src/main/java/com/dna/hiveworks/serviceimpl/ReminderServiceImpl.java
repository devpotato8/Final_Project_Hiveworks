package com.dna.hiveworks.serviceimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.ReminderDao;
import com.dna.hiveworks.model.dto.Reminder;
import com.dna.hiveworks.service.ReminderService;

@Service
public class ReminderServiceImpl implements ReminderService {
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	@Qualifier("reminderdao")
	private ReminderDao dao;
	
	@Override
	public int insertReminder(Reminder reminder, int calNo) {
		int updateReminderYn = 0;
		int ReminderResult =  dao.insertReminder(session, reminder);
		if(ReminderResult > 0) {
			updateReminderYn = dao.updateReminderYn(session, calNo);
		}
		return updateReminderYn;
	};
}
