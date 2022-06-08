package com.spring.mall.sales.serviceimpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.sales.dao.SalesDAO;
import com.spring.mall.sales.service.SalesService;

@Service("salesService")
public class SalesServiceImpl implements SalesService{

	@Autowired
	private SalesDAO salesDAO;
	
	public SalesServiceImpl() {
		System.out.println("SalesServiceImpl() 객체 생성");
	}

	@Override
	public HashMap<Integer, Integer> byDaySales() {
		
		return null;
	}

	@Override
	public HashMap<Integer, Integer> byDayRefund() {
		// TODO Auto-generated method stub
		return null;
	}
}
