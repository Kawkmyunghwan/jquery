package com.yedam.myserver.emp.web;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.emp.mapper.EmployeeMapper;
import com.yedam.myserver.emp.vo.Employee;
import com.yedam.myserver.emp.vo.ModifyData;

@RestController
public class EmployeeGridController {
	@Autowired EmployeeMapper mapper;
	
	@PostMapping("/modifyEmp")
	public Map<String, Object> modifyEmp(
			@RequestBody ModifyData<Employee> data){
		if( data.getCreatedRows() != null) {
			for(Employee emp : data.getCreatedRows()) {
				mapper.persist(emp);
			}
		}
		if( data.getDeletedRows() != null) {
			for(Employee emp : data.getDeletedRows()) {
				mapper.remove(emp);
			}
		}
		if( data.getUpdatedRows() != null) {
			for(Employee emp : data.getUpdatedRows()) {
				mapper.merge(emp);
			}
		}
		return Collections.singletonMap("result", true);
	}
	

	
	
	//조회
	@GetMapping("/readEmp")
	public Map<String, Object> readEmp(){
		Map<String, Object> pagination = new HashMap<>();
		pagination.put("page", 1);
		pagination.put("totalCount", 100);	//전체건수 쿼리
		
		Map<String, Object> data = new HashMap<>();
		data.put("contents", mapper.findEmployees());
		data.put("pagination", pagination);
		
		Map<String, Object> map = new HashMap<>();		
		map.put("result", true);
		map.put("data", data);
		
		return map;
	}
}
