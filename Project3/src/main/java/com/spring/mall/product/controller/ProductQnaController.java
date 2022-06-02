package com.spring.mall.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;
import com.spring.mall.product.vo.ProductVO;

@Controller
//@RequestMapping("/productQna/**")
public class ProductQnaController {
	
	@Autowired
	private ProductQnaService productQnaService;
	@Autowired
	private ProductService productService;
	
	public ProductQnaController() {
		System.out.println("ProductQnaController() 객체 생성");
	}
	
	// 상품문의 제목 클릭 시 문의+답변 조회
	@RequestMapping("/adminViewPrdQnaOne.do")
	public String adminViewPrdQnaOne(ProductQnaNickVO vo, Model model) {
		System.out.println("adminViewPrdQnaOne() 실행");
		List<ProductQnaNickVO> list = productQnaService.viewPrdQnaSet(vo);
		model.addAttribute("productQnaSet", list);
		return "admin/veiwProductQnaSet";
	}
	
	// 상품문의 답변 작성 페이지 이동
	@RequestMapping("/adminInsertProductQna.do")
	public String adminInsertProductQna(ProductQnaNickVO vo, Model model) {
		System.out.println("adminInsertProductQna() 실행");
		
		ProductQnaNickVO productQna = productQnaService.getProductQnaNick(vo);
		model.addAttribute("productQna",productQna);
		return "admin/insertProductQna";
	}

		
	//----상품문의목록 불러오기
	@RequestMapping("/adminProductQnaList.do")
	public String adminGetProductQnaList(Model model) {
		System.out.println("adminProductQnaList() 실행");
		
		List<ProductQnaVO> list = productQnaService.productQnaListAdmin();
		model.addAttribute("productQnaList",list);
		return "admin/getProductQnaList";
	}
	
	
	// 상품문의 답변 제출
	@RequestMapping("/submitAdminProductQna.do")
	public String submitAdminProductQna(ProductQnaNickVO vo, HttpServletRequest request) {
		System.out.println("submitAdminProductQna() 실행");
		ProductQnaNickVO productQna = productQnaService.getProductQnaNick(vo);
		System.out.println("vo : " + vo);
		System.out.println("productQna : " + productQna);
		
		// 답변 입력
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String qna_content = vo.getQna_content();
		String product_id = Integer.toString(productQna.getProduct_id());
		String qna_group = Integer.toString(productQna.getQna_group());
		productQnaService.insertAdminProductQna(qna_content, product_id, user_id, qna_group);
		
		// 문의 상태 변경
		productQnaService.updateProductQnaState(vo);
		
		return "forward:/adminProductQnaList.do";
	}
	
	// 상품문의 입력
	@RequestMapping("/insertPrdQna.do")
	public String insertProductQna(ProductQnaVO vo ,ProductVO pvo,HttpSession session,
									RedirectAttributes rdatt) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		System.out.println("vo : " + vo);
		
		productQnaService.insertProductQna(vo);
		rdatt.addAttribute("product_id",pvo.getProduct_id());
		
		return "forward:/productDetail.do";
	}
	
	
	// 페이지 테스트-- 삭제 예정-------------------------------
	@RequestMapping("/viewMypage.do")
	public String viewMyPage() {
		
		return "user/myPageTemplate";
	}
	

	
	
}
