package com.dna.hiveworks.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2023. 01. 14.
 * Description : 쪽지함 DTO
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 01. 14., 설명 : 최초작성
**/

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Message {
	
	private int msg_no;
	private int msg_sender;
	private String msg_sender_name;
	private int msg_receiver;
	private String msg_receiver_name;
	private String msg_category_no;
	private String msg_category_name;
	private String msg_title;
	private String msg_content;
	private String msg_date;
	private String msg_read_yn;
	private String msg_delete;
	private String msg_file_oriname;
	private String msg_file_rename;
	private String msg_marked_yn;
	private String msg_file_size;
	private String emp_profile_re_name;
}
