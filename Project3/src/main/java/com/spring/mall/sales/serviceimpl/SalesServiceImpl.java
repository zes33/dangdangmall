package com.spring.mall.sales.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.sales.dao.SalesDAO;
import com.spring.mall.sales.service.SalesService;
import com.spring.mall.sales.vo.SalesVO;

@Service("salesService")
public class SalesServiceImpl implements SalesService{

	@Autowired
	private SalesDAO salesDAO;
	
	public SalesServiceImpl() {
		System.out.println("SalesServiceImpl() 객체 생성");
	}

	@Override
	public List<SalesVO> getMonthList(String year) {
		return salesDAO.getMonthList(year);
	}

}
