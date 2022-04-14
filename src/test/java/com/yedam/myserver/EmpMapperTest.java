package com.yedam.myserver;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.myserver.emp.mapper.EmployeeMapper;
import com.yedam.myserver.todo.vo.TodoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/*-context.xml")

public class EmpMapperTest {
	
	@Autowired EmployeeMapper mapper;
	
	@Test
	public void todoSelectList() {
		System.out.println(mapper.findStat() );
	}
	
}
