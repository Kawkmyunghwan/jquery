package com.yedam.myserver;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.junit.Test;

import com.yedam.myserver.emp.vo.Employee;

/* class MyComp implements Comparator<Employee>{

	@Override
	public int compare(Employee o1, Employee o2) {
		// TODO Auto-generated method stub
		return o1.getFirst_name().compareTo(o2.getFirst_name());
		//두 값의 비교 결과로 SORT 함
	}
	
} */

public class MyList{
	
	
	@Test
	public void test1() {
		//무명클래스를 간단하게 쓰기 위해서 람다식이 나옴.
		List<Employee> list = new ArrayList<>();
		list.add(new Employee("홍길동"));
		list.add(new Employee("김길동"));
		list.sort((Employee o1, Employee o2) -> 
			 o1.getFirst_name().compareTo(o2.getFirst_name())
			);
		//부모타입의 인터페이스 명을 적어줌, new ()로 객체생성,
		//오버라이딩 해야 할 메소드가 하나뿐이면, 람다식으로 가능
		//생성과 선언을 같이 할 때 람다식을 씀
		System.out.println(list);
	}
}
