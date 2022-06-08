package com.spring.mall.sales.service;

import java.util.HashMap;

public interface SalesService {
	HashMap<Integer, Integer> byDaySales();
	HashMap<Integer, Integer> byDayRefund();
	
}
