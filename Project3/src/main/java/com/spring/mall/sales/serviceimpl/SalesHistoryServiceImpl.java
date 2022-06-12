package com.spring.mall.sales.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.sales.dao.SalesHistoryDAO;
import com.spring.mall.sales.service.SalesHistoryService;
import com.spring.mall.user.vo.MyInfoVO;

@Service("salesHistoryService")
public class SalesHistoryServiceImpl implements SalesHistoryService{

	@Autowired
	private SalesHistoryDAO salesHistoryDAO;
	
	public SalesHistoryServiceImpl() {
		System.out.println("SalesHistoryServiceImpl() 객체 생성");
	}

	@Override
	public List<MyInfoVO> getHistoryAll(MyInfoVO vo) {
		return salesHistoryDAO.getHistoryAll(vo);
	}

	@Override
	public List<MyInfoVO> historyOne(String order_id) {
		return salesHistoryDAO.historyOne(order_id);
	}

	

}
