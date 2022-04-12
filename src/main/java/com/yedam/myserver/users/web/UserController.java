package com.yedam.myserver.users.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.users.mapper.UserMapper;
import com.yedam.myserver.users.vo.UserVO;

@CrossOrigin(origins = {"http://127.0.0.1:5500/", ""}, maxAge = 3600)
@RestController
//RestController가 있으면 모든 메소드에 ResponseBody가 있는것과 같다.
public class UserController {

	@Autowired UserMapper mapper;
	
	@GetMapping("/users")
	public List<UserVO> userSelect() {
		return mapper.find();
	}
	
	@GetMapping("/users/{id}")
	// path {id}를 짤라서, String id에 파라미터를 넣어줌.
	public UserVO userSelectList(@PathVariable String id, UserVO vo) {
		
		return mapper.findById(vo);
	}
		
	@PostMapping("/users") 
//	파라미터 받는걸, queryString, jsonString도 가능
//	json으로 받는다면 parse가 필요.(***requestBody는 json을 받음)
	public UserVO userInsert(@RequestBody UserVO vo) {
		 mapper.persist(vo);
		 return vo;
	}
	
	@PutMapping("/users")
	public UserVO userUpdate(@RequestBody UserVO vo) {
		 mapper.merge(vo);
		 return vo;
	}	
	@DeleteMapping("/users/{id}")
	public UserVO userDelete(@PathVariable String id, UserVO vo) {
		 vo.setId(id);
		 mapper.remove(vo);
		 return vo;
	}		
}
