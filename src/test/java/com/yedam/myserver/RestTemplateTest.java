package com.yedam.myserver;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.yedam.myserver.emp.vo.Employee;

public class RestTemplateTest {

	@Test
	public void exchangeTest() {
		String url = "http://localhost/myserver/empInsertjson";
		Map<String, String> params = new HashMap<>();
		params.put("employee_id", "4500");
		params.put("first_name", "테스트");
		params.put("last_name", "홍");
		params.put("email", "a@a.z");
		params.put("hire_date", "2000-12-01");
		params.put("job_id", "IT_PROG");
		
		//header 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<Map<String, String>> request = new HttpEntity<Map<String, String>>(params, headers);
		ResponseEntity<Employee> emp = new RestTemplate().exchange(url, HttpMethod.POST, request, Employee.class);
		System.out.println(emp.getBody());
	}
	
	//@Test
	public void getForObjectTest() {
		RestTemplate rest = new RestTemplate();
		String uri = "http://localhost/myserver/empSelect";
		Employee[] emp = rest.getForObject(uri, Employee[].class);
		System.out.println(emp[0].getFirst_name());
		//결과값만 받는것.
	}
	
	//@Test
	public void getForEntityTest() {
		RestTemplate rest = new RestTemplate();
		String uri = "http://localhost/myserver/empSelect";
		ResponseEntity<Employee[]> res = rest.getForEntity(uri, Employee[].class);
		System.out.println(res.getBody()[0].getFirst_name());
		System.out.println(res.getStatusCodeValue());
		//ResponseEntity로 받는것.
	}
}
