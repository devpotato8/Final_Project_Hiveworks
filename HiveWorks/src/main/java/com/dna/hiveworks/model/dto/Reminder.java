package com.dna.hiveworks.model.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reminder {
	private int reminderNo;
	private int calNo;
	private int empNo;
	private String recipientPhone;
	private String reminderContent;
	private Timestamp ReminderDate;
	private String useYn;


}
