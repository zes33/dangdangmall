package com.spring.mall.paging.controller;

import java.util.List;

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

@Controller
//@RequestMapping("/paging/**")
public class PagingController {
	
	@Autowired
	private PagingService pagingService;
	@Autowired
	private ProductQnaService productQnaService;
	@Autowired
	private ProductService productService;
	
	// 카테고리별 목록
	@RequestMapping("paging.do")
	public String boardList(String prd_c, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int category_code = Integer.parseInt(prd_c);
		int total = pagingService.totalProductCnt_c(category_code);

		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "12";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewProduct", pagingService.productList_category(category_code,vo.getStart(),vo.getEnd()));
		model.addAttribute("prd_c", prd_c);
		return "store/productListCategory";
	}
	
	// test-----------
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
		
		//페이징객체, 상품정보, 상품별 문의목록
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		ProductVO product = productService.getProduct(pv);
		List<ProductQnaNickVO> qnaList = pagingService.prdQnaList_prd(product_id, paging.getStart(), paging.getEnd());	
		
		model.addAttribute("product",product);
		model.addAttribute("paging",paging);
		model.addAttribute("qnaList",qnaList);
		
		return "store/testProduct";
	}

}
