package com.dna.hiveworks.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NaverApiController {

@GetMapping("/naverApi")
 public ResponseEntity<?> newsApi(Model model) {
     String clientId = "3JzNFqagqO7DFZM3zzbT"; //애플리케이션 클라이언트 아이디
     String clientSecret = "3oCi092xNo"; //애플리케이션 클라이언트 시크릿


     String text = null;
     try {
    	 // 키워드가 들어가는자리 , 인코딩
         text = URLEncoder.encode("하이브", "UTF-8");
     } catch (UnsupportedEncodingException e) {
         throw new RuntimeException("검색어 인코딩 실패",e);
     }

     // API URL이 제공되고 필수인 query가 param으로 되어있음.
     // String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&display=100";    // JSON 결과 기본값으 display=10
     String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text;    // JSON 결과 기본값으 display=10
     //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과

     // Map 형태의 requestHeaders를 변수로 만들고 애플리케이션에서 만든 clientId와 clientSecret키가 여기서 사용됨 
     Map<String, String> requestHeaders = new HashMap<>();
     requestHeaders.put("X-Naver-Client-Id", clientId);
     requestHeaders.put("X-Naver-Client-Secret", clientSecret);
     // URL을 연결해줌
     String responseBody = get(apiURL,requestHeaders);
     
     log.debug("{}",responseBody);
	 //주어진 코드에 jsoup를 통합하려면 get 메소드 내에서 responseBody를 반환하기 전에 
	 //removeHtmlTags 메소드를 호출하여 HTML 태그를 제거
     
     model.addAttribute(responseBody);
     return ResponseEntity.ok(responseBody);
 }

// 메인메소드에서 get이라는 URL을 연결해주는 메소드
 private static String get(String apiUrl, Map<String, String> requestHeaders){
     HttpURLConnection con = connect(apiUrl);
     try {
         con.setRequestMethod("GET");
         for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
             con.setRequestProperty(header.getKey(), header.getValue());
         }

         int responseCode = con.getResponseCode();
         if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
             return readBody(con.getInputStream());
         } else { // 오류 발생
             return readBody(con.getErrorStream());
         }
     } catch (IOException e) {
         throw new RuntimeException("API 요청과 응답 실패", e);
     } finally {
         con.disconnect();
     }
 }

// URI연결
 private static HttpURLConnection connect(String apiUrl){
     try {
         URL url = new URL(apiUrl);
         return (HttpURLConnection)url.openConnection();
     } catch (MalformedURLException e) {
         throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
     } catch (IOException e) {
         throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
     }
 }

// 
 private static String readBody(InputStream body){
     InputStreamReader streamReader = new InputStreamReader(body);

     try (BufferedReader lineReader = new BufferedReader(streamReader)) {
         StringBuilder responseBody = new StringBuilder();

         String line;
         while ((line = lineReader.readLine()) != null) {
             responseBody.append(line);
         }

         return responseBody.toString();
     } catch (IOException e) {
         throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
     }
 }
}
