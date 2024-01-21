package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

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
	List<String> sharedEmp(Map<String,String> msgSharedEmps);
	int starMark(int msgNo);
	int starUnmark(int msgNo);
	List<String> receiverNames(List<Integer> empNos);
	String categoryName(String cateNo);
	int sendMsg(Map<String,Object> params);
	int readMsg(Map<String,Integer> params);
	int starChekedBtn(Map<String,Integer> params);
	int trashChekedBtn(Map<String,Integer> params);
	int starUncheckedBtn(Map<String,Integer> params);
	
}
