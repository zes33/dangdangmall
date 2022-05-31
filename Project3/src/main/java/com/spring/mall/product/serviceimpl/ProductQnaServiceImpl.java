package com.spring.mall.product.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.product.dao.ProductQnaDAO;
import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;

@Service
public class ProductQnaServiceImpl implements ProductQnaService {

	@Autowired
	private ProductQnaDAO productQnaDAO;
	
	// 상품 상세페이지에서 qna 목록 보이기(고객)
	@Override
	public List<ProductQnaNickVO> qnaNickList(int product_id) {
		System.out.println("ProductQnaServiceImpl.qnaNickList() 실행");
		return productQnaDAO.qnaListByProduct(product_id);
	}

	@Override
	public void insertProductQna(ProductQnaVO vo) {
		System.out.println("ProductQnaServiceImpl.insertProductQna() 실행");
		productQnaDAO.insertProductQna(vo);
	}

	
	
}
