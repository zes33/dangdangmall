package com.spring.mall.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.paging.service.PagingService;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductVO;
import com.spring.mall.review.service.ReviewService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private PagingService pagingService;
	@Autowired
	private ReviewService reviewService;
	
	public ProductController() {
		System.out.println("ProductController() 객체 생성~~");
	}
	
	// 카테코리별 목록 페이지 이동
	@RequestMapping("/foodList.do")
	public String getFoodList(Model model) {
		System.out.println("ProductController.getFoodList() 실행");
		List<ProductVO> foodList = productService.getProductListCategory(1);
		model.addAttribute("foodList",foodList );
		return "store/foodProduct";
	}
	
	
	// 상품 상세페이지
	@RequestMapping("/viewPrdDetail.do")
	public String viewPrdRepl(PagingVO paging, Model model, ProductQnaNickVO nv, ProductVO pv,
					@RequestParam(value="nowPage", required = false) String nowPage,
					@RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		System.out.println("viewPrdRepl() 실행");
		int product_id = nv.getProduct_id();
		int total = pagingService.totalPrdQna_prd(product_id);
		
		int setLastPage = 0;
		if (nowPage == null && cntPerPage == null) {
			cntPerPage = "4";
			int cntPerPageNum = Integer.parseInt(cntPerPage);
			setLastPage = (int) Math.ceil((double)total / (double)cntPerPageNum);
			nowPage = Integer.toString(setLastPage);
		} else if (nowPage == null) {
			cntPerPage = "4";
			int cntPerPageNum = Integer.parseInt(cntPerPage);
			setLastPage = (int) Math.ceil((double)total / (double)cntPerPageNum);
			nowPage = Integer.toString(setLastPage);
		} else if (cntPerPage == null) { 
			cntPerPage = "4";
		}
		
		
		//페이징객체, 상품정보, 상품별 문의목록, 상품후기 목록
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		ProductVO product = productService.getProduct(pv);
		List<ProductQnaNickVO> qnaList = pagingService.prdQnaList_prd(product_id, paging.getStart(), paging.getEnd());	
		List<Map<String, Object>> reviewList = reviewService.reviewPerPrd(product_id);
		
		model.addAttribute("product",product);
		model.addAttribute("paging",paging);
		model.addAttribute("qnaList",qnaList);
		model.addAttribute("reviewList",reviewList);
		
		System.out.println("reviewList " + reviewList);
		
		return "store/productDetail";
	}
	
	
	
	

	
}
