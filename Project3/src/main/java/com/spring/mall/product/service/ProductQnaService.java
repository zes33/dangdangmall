package com.spring.mall.product.service;

import java.util.List;
import java.util.Map;

import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;

public interface ProductQnaService {
	
	public List<Map<String, Object>> myPrdQnaList(String user_id, String start, String end);
	public List<ProductQnaNickVO> viewPrdQnaSet(ProductQnaNickVO vo);
	public List<Map<String, Object>> getProductQnaListAdmin(String searchCondition, 
			String searchKeyword, String qna_state, String prd_category, String start, String end);
	public List<ProductQnaNickVO> qnaNickList(int product_id);
	public void insertProductQna(ProductQnaVO vo);
	public ProductQnaNickVO getProductQnaNick(ProductQnaNickVO vo);
	public void updateProductQnaState(String product_qna_state, String qna_id );
	public void insertAdminProductQna(String qna_content, String product_id,
										String user_id, String qna_group);
	public void deleteProductQna(ProductQnaNickVO vo);
	public void deleteProductAns(ProductQnaNickVO vo);
	public void updateQna(ProductQnaNickVO vo);
	public ProductQnaNickVO viewPrdQnaOne(ProductQnaNickVO vo);
	public int totMyPrdQna(String user_id);
	public int adminTotPrdQnaCnt(String searchCondition, String searchKeyword, String qna_state, String prd_category);
}
