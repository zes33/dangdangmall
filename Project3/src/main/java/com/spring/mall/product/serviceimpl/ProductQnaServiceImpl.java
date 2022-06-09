package com.spring.mall.product.serviceimpl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> getProductQnaListAdmin(String searchCondition, 
			String searchKeyword, String qna_state, String prd_category,String start, String end) {
		return productQnaDAO.getProductQnaListAdmin(searchCondition,searchKeyword,qna_state,prd_category,start, end);
	}

	@Override
	public ProductQnaNickVO getProductQnaNick(ProductQnaNickVO vo) {
		return productQnaDAO.getProductQnaNick(vo);
	}

	@Override
	public void updateProductQnaState(String product_qna_state, String qna_id ) {
		productQnaDAO.updateProductQnaState(product_qna_state,qna_id);
		
	}

	@Override
	public void insertAdminProductQna(String qna_content, String product_id, String user_id, String qna_group) {
		productQnaDAO.insertAdminProductQna(qna_content, product_id, user_id, qna_group);
	}

	@Override
	public List<ProductQnaNickVO> viewPrdQnaSet(ProductQnaNickVO vo) {
		return productQnaDAO.viewPrdQnaSet(vo);
	}

	@Override
	public List<Map<String, Object>> myPrdQnaList(String user_id, String start, String end) {
		return productQnaDAO.myPrdQnaList(user_id, start, end);
	}

	@Override
	public void deleteProductQna(ProductQnaNickVO vo) {
		productQnaDAO.delProductQna(vo);
		
	}

	@Override
	public void deleteProductAns(ProductQnaNickVO vo) {
		productQnaDAO.delProductAns(vo);
	}

	@Override
	public void updateQna(ProductQnaNickVO vo) {
		productQnaDAO.updatePrdQna(vo);
	}

	@Override
	public ProductQnaNickVO viewPrdQnaOne(ProductQnaNickVO vo) {
		return productQnaDAO.viewPrdQnaOne(vo);
	}

	@Override
	public int totMyPrdQna(String user_id) {
		return productQnaDAO.totMyPrdQna(user_id);
	}

	@Override
	public int adminTotPrdQnaCnt(String searchCondition, String searchKeyword, String qna_state,String prd_category) {
		return productQnaDAO.adminTotPrdQnaCnt(searchCondition, searchKeyword, qna_state,prd_category);
	}


	
	
}
