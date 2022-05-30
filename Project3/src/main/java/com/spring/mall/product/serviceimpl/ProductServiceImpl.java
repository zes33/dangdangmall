package com.spring.mall.product.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.product.dao.ProductDAO;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	public ProductServiceImpl() {
		System.out.println(">> ProductServiceImpl() 객체 생성~~");
	}


	@Override
	public List<ProductVO> getProductListCategory(int category) {
		return productDAO.getProductList_c(category);
	}
	
	@Override
	public ProductVO getProduct(ProductVO vo) {
		return productDAO.getProduct(vo);
	}


//	@Override
//	public void insertProduct(ProductVO vo) {
//		productDAO.insertProduct(vo);
//	}
//	
//	@Override
//	public void updateProduct(ProductVO vo) {
//		productDAO.updateProduct(vo);
//	}
//	
//	@Override
//	public void deleteProduct(ProductVO vo) {
//		productDAO.deleteProduct(vo);
//	}
//	
	
//	public List<ProductVO> getProductList(ProductVO vo) {
//		return productDAO.getProductList(vo);
//	}
}
