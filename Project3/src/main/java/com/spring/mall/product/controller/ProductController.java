package com.spring.mall.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.mall.paging.service.PagingService;
import com.spring.mall.paging.vo.PagingVO;
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
	
	// 관리자 상품목록 페이지
	@RequestMapping("/adminProductList.do")
	public String productInfo(String searchCondition, String searchKeyword, 
			String prd_category, String prd_state, PagingVO paging, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println("product컨트롤러.productInfo() 실행");
		int total = productService.adminProductTotCnt(searchCondition, searchKeyword, prd_category, prd_state);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		paging = new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		List<Map<String, Object>> prdList = productService.adminProductList(searchCondition, searchKeyword, prd_category, prd_state, start, end);
		
		model.addAttribute("prdList",prdList);
		model.addAttribute("paging",paging);
		model.addAttribute("searchCondition",searchCondition);
		model.addAttribute("searchKeyword",searchKeyword);
		model.addAttribute("prd_category",prd_category);
		model.addAttribute("prd_state",prd_state);
		
		System.out.println("prdList : " + prdList);
		System.out.println("paging : " + paging);
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		System.out.println("prd_category : " + prd_category);
		System.out.println("prd_state : " + prd_state);
		System.out.println("total : " + total);
		
		return "admin/productList";
	}
	
	// 관리자 상품 상세페이지 이동
	@RequestMapping("/productInfo.do")
	public String productInfo() {
		System.out.println("product컨트롤러.productInfo() 실행");
		
		
		return "admin/productInfomation";
	}
	
	// 상품등록 페이지 이동
	@RequestMapping("/goInsertProduct.do")
	public String goInsertProduct() {
		System.out.println("product컨트롤러.goInsertProduct() 실행");
		
		
		
		
		return "admin/productInsert";
	}
	
	// 상품등록 처리-----
	@RequestMapping("/insertProduct.do")
	public String insertProduct(ProductVO product) throws IllegalStateException, IOException {
		System.out.println("product컨트롤러.insertProduct()");
		
		MultipartFile pic_file = product.getPic_file();
		MultipartFile info_file = product.getInfo_file();
		System.out.println(">pic_file : " + pic_file);
		System.out.println(">info_file : " + info_file);
		
		// 파일명 중복처리 제외
		if(pic_file == null) {
			System.out.println(":::pic_file 파라미터값이 존재하지 않습니다.");
		} else if(!pic_file.isEmpty()) {
			String pic_name = pic_file.getOriginalFilename();
			System.out.println(">>info_name 원본명 : " + pic_name);
			product.setProduct_pic(pic_name);
			pic_file.transferTo(new File("C:/MyStudy/project3/"+pic_name));
		} if(info_file ==  null) {
			System.out.println(":::info_file 파라미터값이 존재하지 않습니다.");
		} else if(!info_file.isEmpty()) {
			String info_name = info_file.getOriginalFilename();
			System.out.println(">>info_name 원본명 : " + info_name);
			product.setProduct_info(info_name);
			info_file.transferTo(new File("C:/MyStudy/project3/"+info_name));
		}
		
		System.out.println("product : " + product);
		productService.insertProduct(product);
		return "admin/productList";
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
