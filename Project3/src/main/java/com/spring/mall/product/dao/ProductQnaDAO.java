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
	
	// 상품문의 qna_id로 찾기
	public ProductQnaNickVO viewPrdQnaOne(ProductQnaNickVO vo) {
		System.out.println("viewPrdQnaOne() 실행");
		return  mybatis.selectOne("productQnaDAO.viewPrdQnaOne", vo);
	}
	
	// 상품답변 수정
	public void updatePrdQna(ProductQnaNickVO vo) {
		System.out.println("ProductQnaDAO.updateAnswer() 실행");
		mybatis.update("productQnaDAO.updatePrdQna",vo);
	}
	
	// 상품답변 삭제
	public void delProductAns(ProductQnaNickVO vo) {
		System.out.println("ProductQnaDAO.delProductAns() 실행");
		mybatis.delete("productQnaDAO.delPrdAns",vo );
	}
	
	// 상품문의 삭제
	public void delProductQna(ProductQnaNickVO vo) {
		System.out.println("ProductQnaDAO.delPrdQna() 실행");
		mybatis.delete("productQnaDAO.delPrdQna", vo);
	}
	
	// 개인의 상품문의 목록 조회
	public List<Map<String, Object>> myPrdQnaList(String user_id, String start, String end){
		System.out.println("ProductQnaDAO.viewPrdQnaOne() 실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productQnaDAO.myPrdQnaList", map);
	}
	
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
	public void updateProductQnaState(String product_qna_state, String qna_id ) {
		System.out.println("ProductQnaDAO.updateProductQnaState() 실행~~~~~~~~~~~~~~");
		Map<String,String> map = new HashMap<String, String>();
		map.put("product_qna_state", product_qna_state);
		map.put("qna_id", qna_id);
		mybatis.update("productQnaDAO.updateQnaState",map);
	}
	
	// 상품문의 1개 조회(상품명, 닉네임)
	public ProductQnaNickVO getProductQnaNick(ProductQnaNickVO vo) {
		System.out.println("ProductQnaDAO.getProductQnaNick() 실행");
		return mybatis.selectOne("productQnaDAO.getProductQnaNick", vo);
	}
	
	// 상품문의 게시글 개수(관리자)
	public int adminTotPrdQnaCnt(String searchCondition, String searchKeyword, String qna_state,String prd_category) {
		System.out.println("ProductQnaDAO.adminTotPrdQnaCnt() 실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("qna_state", qna_state);
		map.put("prd_category", prd_category);
		return mybatis.selectOne("productQnaDAO.adminTotPrdQnaCnt",map);
	}
	
	// 상품문의 목록(운영자)
	public List<Map<String, Object>> getProductQnaListAdmin(String searchCondition, 
			String searchKeyword, String qna_state,String prd_category, String start, String end){
		System.out.println("ProductQnaDAO.getProductQnaListAdmin() 실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("qna_state", qna_state);
		map.put("prd_category", prd_category);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productQnaDAO.getProductQnaListAdmin",map);
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
	
	// 내 상품 문의 개수 
	public int totMyPrdQna(String user_id) {
		System.out.println("ProductQnaDAO.totMyPrdQna()실행");
		return mybatis.selectOne("productQnaDAO.totMyPrdQna",user_id);
	}
	
}
