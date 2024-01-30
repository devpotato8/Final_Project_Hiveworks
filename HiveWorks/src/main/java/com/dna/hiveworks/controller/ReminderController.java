package com.dna.hiveworks.controller;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dna.hiveworks.model.dto.Reminder;
import com.dna.hiveworks.service.ReminderService;

import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class ReminderController {
	
	final DefaultMessageService messageService;
	
	private final ReminderService reminderservice;
	
	
	public ReminderController(ReminderService reminderservice) {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSD97KVDDEXYHUZ", "1MA5E47T1UMGIGRGUGUF7VNEFF7EB1BJ", "https://api.coolsms.co.kr");
		this.reminderservice = reminderservice;
    }
	

    /**
     * 단일 메시지 발송 예제
     */
    @PostMapping("/sendMessage")
    public SingleMessageSentResponse sendmessage(@RequestParam Map<String, Object> param) {
    	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm", Locale.KOREA);
    	
    	
    	
		 
    	int calNo = Integer.parseInt((String)param.get("calNo"));
		int empNo = Integer.parseInt((String)param.get("empNo"));
		String empPhone = (String) param.get("empPhone");
		String startDateString = (String) param.get("calStartDate");
		Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
		String resourceName = (String) param.get("resourceName");
		String reminderContent = resourceName+" / "+startDateString+" 예약되었습니다";

        Message message = new Message();
        message.setFrom("010-8795-4307");
        message.setTo(empPhone);
        message.setText(resourceName+" / "+startDateString+" 예약되었습니다");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        
        
        Reminder reminder = Reminder.builder().calNo(calNo).empNo(empNo).ReminderDate(calStartDate).recipientPhone(empPhone).reminderContent(reminderContent).build();
        int reminderResult = reminderservice.insertReminder(reminder, calNo);

        return response;
    }
    
    
	/*
	 * @PostMapping("/sendCancelMessage") public SingleMessageSentResponse
	 * sendCancelMessage(@RequestParam Map<String, Object> param) {
	 * DateTimeFormatter dateTimeFormatter =
	 * DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S", Locale.KOREA);
	 * 
	 * 
	 * 
	 * 
	 * int calNo = Integer.parseInt((String)param.get("calNo")); String empPhone =
	 * (String) param.get("empPhone"); String startDateString = (String)
	 * param.get("calStartDate"); Timestamp calStartDate =
	 * Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
	 * String resourceName = (String) param.get("resourceName");
	 * 
	 * Message message = new Message(); message.setFrom("010-8795-4307");
	 * message.setTo(empPhone);
	 * message.setText(resourceName+" / "+startDateString+" 예약취소되었습니다");
	 * 
	 * SingleMessageSentResponse response = this.messageService.sendOne(new
	 * SingleMessageSendingRequest(message));
	 * 
	 * 
	 * int cancelReminder = reminderservice.cancelReminder(calNo);
	 * 
	 * return response; }
	 */
    
    
    
    @PostMapping("/sendCancelMessage")
    public MultipleDetailMessageSentResponse sendCancelMessage(@RequestBody List<Map<String, Object>> selectedDataList) {
    	
    	
    	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm", Locale.KOREA);
    	
        ArrayList<Message> messageList = new ArrayList<>();

        if(selectedDataList!=null &&selectedDataList.size() >0) {
        	 for (Map<String, Object> selectedData : selectedDataList) {
                 String reserveNo =  (String) selectedData.get("reserveNo");
                 String resourceName =  (String) selectedData.get("resourceName");
                 String startDateString = (String) selectedData.get("calStartDate");
                 Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
                 String empPhone = (String) selectedData.get("empPhone");
                 int empNo = (int) selectedData.get("empNo");
                 
                 Message message = new Message();
                 // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
                 message.setFrom("010-8795-4307");
                 message.setTo(empPhone);
                 message.setText(resourceName+" / "+startDateString+" 예약취소되었습니다");
                 
                 // 메시지 건건 마다 사용자가 원하는 커스텀 값(특정 주문/결제 건의 ID를 넣는등)을 map 형태로 기입하여 전송 후 확인해볼 수 있습니다!
                 /*HashMap<String, String> map = new HashMap<>();

                 map.put("키 입력", "값 입력");
                 message.setCustomFields(map);*/

                 messageList.add(message);
                 
             }
        }
                // 메시지 건건 마다 사용자가 원하는 커스텀 값(특정 주문/결제 건의 ID를 넣는등)을 map 형태로 기입하여 전송 후 확인해볼 수 있습니다!
                /*HashMap<String, String> map = new HashMap<>();

                map.put("키 입력", "값 입력");
                message.setCustomFields(map);

                messageList.add(message);*/

            try {
                // send 메소드로 단일 Message 객체를 넣어도 동작합니다!
                // 세 번째 파라미터인 showMessageList 값을 true로 설정할 경우 MultipleDetailMessageSentResponse에서 MessageList를 리턴하게 됩니다!
                //MultipleDetailMessageSentResponse response = this.messageService.send(messageList, false, true);

                // 중복 수신번호를 허용하고 싶으실 경우 위 코드 대신 아래코드로 대체해 사용해보세요!
                MultipleDetailMessageSentResponse response = this.messageService.send(messageList, true);


                return response;
            } catch (NurigoMessageNotReceivedException exception) {
                System.out.println(exception.getFailedMessageList());
                System.out.println(exception.getMessage());
            } catch (Exception exception) {
                System.out.println(exception.getMessage());
            }
            
            return null;
        };
    
    
    
    
    



}
