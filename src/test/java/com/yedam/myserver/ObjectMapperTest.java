package com.yedam.myserver;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.junit.Test;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.myserver.emp.vo.Departments;
import com.yedam.myserver.emp.vo.Employee;

public class ObjectMapperTest {
	ObjectMapper objectMapper = new ObjectMapper();

	//@Test
	public void toJson() throws Exception {
		Departments dept = new Departments();
		dept.setDepartment_id("500");
		dept.setDepartment_name("인사");
		//new ObjectMapper().writeValue(new File("dept.json"), dept);
		String str = objectMapper.writeValueAsString(dept);
		System.out.println(str);
	}
	
	//@Test
	public void toObject() throws Exception {
		//Json 객체를 Java객체로 바꾸는 것. **readValue**
		String str = "{\"location_id\":null,\"city\":null,\"manager_id\":null,\"manager_name\":null,\"department_name\":\"인사\",\"department_id\":\"500\"}";
		Departments dept = objectMapper.readValue(str, Departments.class);
		System.out.println(dept.getDepartment_name());
		
		//Json File을 Java객체로 바꿈.
		Departments dept2 = objectMapper.readValue(new File("dept.json"), Departments.class);
		System.out.println(dept2.getDepartment_name());
	}
	
	@Test
	public void URLtoObject() throws JsonParseException, JsonMappingException, MalformedURLException, IOException {
		//Json URL을 Java객체로 바꿈.
		String url = "http://localhost/myserver/empSelect";
		List<Employee> employee = objectMapper.readValue(new URL(url), new TypeReference<List<Employee>>(){}); // 클래스 생성과 선언을 동시에,
		System.out.println(employee.get(0).getFirst_name());
		// 익명, 무명 클래스
	}
}
