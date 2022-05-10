package com.yedam.myserver.excel.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.myserver.emp.mapper.EmployeeMapper;

@Controller
public class ExcelController {
	@Autowired 
	EmployeeMapper mapper;

	@RequestMapping("/excel")
	public String excel(Model model) {
		String[] header = {"departmentId","departmentName","cnt"};
		model.addAttribute("headers", header);
		model.addAttribute("filename", "empList");
		model.addAttribute("datas", mapper.findStat());
		//List<VO> => list<map>
		return "commonExcelView";
	}
}
