package com.spring.mall.product.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.product.dao.ProductQnaDAO;
import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.vo.ProductQnaVO;

@Service
public class ProductQnaServiceImpl implements ProductQnaService {

	@Autowired
	private ProductQnaDAO productQnaDAO;
	
	public ProductQnaServiceImpl() {
		System.out.println("ProductQnaServiceImpl() 객체 생성");
	}

	@Override
	public void insertProductQna(ProductQnaVO vo) {
		productQnaDAO.insertProductQna(vo);
		
	}

	@Override
	public void updateProductQna(ProductQnaVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductQna(ProductQnaVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductQnaVO getProductQna(ProductQnaVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductQnaVO> getListProductQna(ProductQnaVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
