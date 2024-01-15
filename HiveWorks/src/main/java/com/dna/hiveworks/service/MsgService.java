package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Message;

/**
 * @author : 김태윤
 * @since : 2023. 01. 14.
 * Description : 쪽지함 Service
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 01. 14., 설명 : 최초작성
**/

public interface MsgService {
	List<Message> msgList(int empNo);
	int starMark(int msgNo);
	int starUnmark(int msgNo);
}
