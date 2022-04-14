package com.yedam.myserver.emp.vo;

import java.util.List;

import lombok.Data;

@Data
public class ModifyData<T> {
	List<T> createdRows;
	List<T> updatedRows;
	List<T> deletedRows;
}
