package com.dna.hiveworks.service;

import com.dna.hiveworks.model.dto.Reminder;

public interface ReminderService {
	
	int insertReminder(Reminder reminder, int calNo); 

}
