package com.spring.mall.product.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.product.dao.SearchProductDAO;
import com.spring.mall.product.service.SearchProductService;
import com.spring.mall.product.vo.ProductVO;

@Service("SearchProductService")
public class SearchProductServiceImpl implements SearchProductService{

	@Autowired
	private SearchProductDAO searchProductDAO;
	
	public SearchProductServiceImpl() {
		System.out.println("SearchProductServiceImpl() 객체 생성");
	}
	
	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		return searchProductDAO.getProductList(vo);
	}

	@Override
	public List<ProductVO> searchProductList(ProductVO vo) {
		return searchProductDAO.searchProductList(vo);
	}

}
