package com.spring.mall.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;

@Repository
public class ProductQnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 상품문의 + 답변 한 세트 조회
	public List<ProductQnaNickVO> viewPrdQnaSet(ProductQnaNickVO vo) {
		System.out.println("ProductQnaDAO.viewPrdQnaOne() 실행");
		return mybatis.selectList("productQnaDAO.viewPrdQnaSet",vo);
	}
	
	// 상품문의 답변 입력
	public void insertAdminProductQna(String qna_content, String product_id,
										String user_id, String qna_group) {
		System.out.println("ProductQnaDAO.insertAdminProductQna() 실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("qna_content", qna_content);
		map.put("product_id", product_id);
		map.put("user_id", user_id);
		map.put("qna_group", qna_group);
		mybatis.insert("productQnaDAO.insertAdminProductQna",map);
	}
	
	// 상품문의 답변상태 업데이트
	public void updateProductQnaState(ProductQnaNickVO vo) {
		System.out.println("ProductQnaDAO.updateProductQnaState() 실행");
		mybatis.update("productQnaDAO.updateQnaState",vo);
	}
	
	// 상품문의 1개 조회(상품명, 닉네임)
	public ProductQnaNickVO getProductQnaNick(ProductQnaNickVO vo) {
		System.out.println("ProductQnaDAO.getProductQnaNick() 실행");
		return mybatis.selectOne("productQnaDAO.getProductQnaNick", vo);
	}
	
	// 상품문의 목록(운영자)
	public List<ProductQnaVO> getProductQnaListAdmin(){
		System.out.println("ProductQnaDAO.getProductQnaListAdmin() 실행");
		return mybatis.selectList("productQnaDAO.getProductQnaListAdmin");
	}
	
	// 상품별 문의 목록(고객)
	public List<ProductQnaNickVO> qnaListByProduct(int product_id) {
		System.out.println("ProductQnaDAO.qnaListByProduct() 실행");
		return mybatis.selectList("productQnaDAO.qnaNickByProduct",product_id);
	}
	
	// 상품문의 등록(고객)
	public void insertProductQna(ProductQnaVO vo) {
		System.out.println("ProductQnaDAO.insertProductQna() 실행");
		mybatis.insert("productQnaDAO.insertProductQna", vo);
	}
	
}
