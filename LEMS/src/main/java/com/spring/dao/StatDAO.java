package com.spring.dao;

import com.spring.dto.StatVO;

public interface StatDAO {
	StatVO selectStat(String statNum) throws Exception;
}
