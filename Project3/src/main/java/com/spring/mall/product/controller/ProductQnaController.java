package com.spring.mall.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mall.paging.service.PagingService;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;
import com.spring.mall.product.vo.ProductVO;
import com.spring.mall.user.vo.UserVO;

@Controller
public class ProductQnaController {
	
	@Autowired
	private ProductQnaService productQnaService;
	@Autowired
	private ProductService productService;
	@Autowired
	private PagingService pagingService;
	
	public ProductQnaController() {
		System.out.println("ProductQnaController() 객체 생성");
	}
	
	//수정된 상품문의답변 제출
	@RequestMapping("/editProductAns.do")
	public String editProductAns(ProductQnaNickVO vo) {
		System.out.println("editProductAns() 실행");
		System.out.println("수정답변 제출 --qna_id, qna_group 확인 :" + vo);
		productQnaService.updateQna(vo);

		//reatt.addAttribute("qna_group",vo.getQna_group());
		return "forward:/adminProductQnaList.do";
		//return "redirect:/adminViewPrdQnaOne.do";
	}
	
	//상품문의 수정페이지 이동
	@RequestMapping("/updatePrdQue.do")
	public String updatePrdAns(ProductQnaNickVO vo, Model model) {
		System.out.println("updatePrdAns() 실행");
		ProductQnaNickVO qnaOne = productQnaService.viewPrdQnaOne(vo);
		System.out.println("qnaOne : " + qnaOne);
		model.addAttribute("qnaOne",qnaOne);
		return "user/updatePrdQue";
	}
	
	// 수정 문의 처리
	@RequestMapping("/editProductQue.do")
	public String editProductQue(ProductQnaNickVO vo) {
		System.out.println(("editProductQue() 실행"));
		productQnaService.updateQna(vo);
		return "forward:/goMyPrdQna.do";
	}
	
	//상품답변 수정페이지 이동
	@RequestMapping("/updatePrdAns.do")
	public String updatePrdQue(ProductQnaNickVO vo, Model model) {
		System.out.println("updatePrdQue() 실행");
		System.out.println("vo.qna_group : " + vo.getQna_group());
		
		List<ProductQnaNickVO> productQnaSet = productQnaService.viewPrdQnaSet(vo);
		System.out.println("productQnaSet : " + productQnaSet.toString());
		
		model.addAttribute("productQnaSet",productQnaSet);
		return "admin/updatePrdAns";
	}
	
	//상품답변 삭제
	@RequestMapping("/delProductAns.do")
	public String delProductA(ProductQnaNickVO vo) {
		System.out.println("delProductA() 실행");
		System.out.println("vo.getQna_id() : "+ vo.getQna_id());
		System.out.println("vo.getQna_group() : " + vo.getQna_group());
		
		productQnaService.deleteProductAns(vo);
		
		// 문의 상태 1->0으로 변경
		String state = "0";
		String qna_id = Integer.toString(vo.getQna_id());
		productQnaService.updateProductQnaState(state, qna_id);
		System.out.println("state : " + state);
		System.out.println("qna_id : " + qna_id);
		return "forward:/adminProductQnaList.do";
	}
	
	//상품문의 삭제
	@RequestMapping("/delProductQue.do")
	public String delProductQ(ProductQnaNickVO vo, HttpServletRequest request) {
		System.out.println("delAdminProductQ() 실행");
		productQnaService.deleteProductQna(vo);
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		
		String result = "";
		if(user.getUser_state() == 2) {
			result = "forward:/adminProductQnaList.do";
		} else {
			result = "forward:/goMyPrdQna.do";
		}
		
		return result;
	}
	
	// 마이페이지 상품문의 내역 페이지 이동
	@RequestMapping("/goMyPrdQna.do")
	public String goMyPrdQna(PagingVO paging ,Model model, HttpServletRequest request
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value = "cntPerPage", required = false)String cntPerPage) {
		System.out.println("goMyPrdQna() 실행");
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		int total = productQnaService.totMyPrdQna(user_id);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("start, end :"+ paging.getStart()+ ", " + paging.getEnd() );
		System.out.println("total : " + total);
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		
		List<Map<String, Object>> list = productQnaService.myPrdQnaList(user_id,start, end);
		model.addAttribute("myPrdQnaList", list);
		model.addAttribute("paging",paging);
		return "user/myPrdQna";
	}
	
	// 상품문의 제목 클릭 시 문의+답변 조회
	@RequestMapping("/adminViewPrdQnaOne.do")
	public String adminViewPrdQnaOne(ProductQnaNickVO vo, Model model,PagingVO paging,
			String prd_category, String searchCondition, String qna_state,String searchKeyword) {
		System.out.println("adminViewPrdQnaOne() 실행");
		List<ProductQnaNickVO> list = productQnaService.viewPrdQnaSet(vo);
		
		model.addAttribute("productQnaSet", list);
		model.addAttribute("paging", paging);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("qna_state", qna_state);
		model.addAttribute("prd_category",  prd_category);
		
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

		
	//상품문의목록 불러오기(관리자)
	@RequestMapping("/adminProductQnaList.do")
	public String adminGetProductQnaList(String searchCondition, String qna_state,
			String searchKeyword, PagingVO paging, Model model, String prd_category,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println("adminProductQnaList() 실행");
		int total = productQnaService.adminTotPrdQnaCnt(searchCondition, searchKeyword, qna_state,prd_category);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		paging = new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		
		List<Map<String, Object>> list = productQnaService.getProductQnaListAdmin(searchCondition,
													searchKeyword,qna_state,prd_category, start, end);
		model.addAttribute("productQnaList",list);
		model.addAttribute("paging", paging);
		model.addAttribute("searchCondition",searchCondition);
		model.addAttribute("searchKeyword",searchKeyword);
		model.addAttribute("qna_state",qna_state);
		model.addAttribute("prd_category",prd_category);
		
		return "admin/getProductQnaList";
	}
	
	// (관리자) 상품문의 목록 페이지 검색 조건
	@ModelAttribute("prdQnaSearchMap")
	public Map<String, String> prdQnaSearchMap(){
		System.out.println("===>Map prdQnaSearchMap() 실행");
		Map<String, String> prdQnaSearchMap = new HashMap<String, String>();
		prdQnaSearchMap.put("내용", "QNA_CONTENT");
		prdQnaSearchMap.put("상품명", "PRODUCT_NAME");
		prdQnaSearchMap.put("상품번호", "PRODUCT_ID");
		return prdQnaSearchMap;
	}
	
	// (관리자) 상품문의 답변 제출
	@RequestMapping("/submitAdminProductQna.do")
	public String submitAdminProductQna(ProductQnaNickVO vo, HttpServletRequest request) {
		System.out.println("submitAdminProductQna() 실행");
		
		//qna_id로 nickVo 조회
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
		
		// 문의 상태 변경 0->1
		String state = "1";
		String qna_id = Integer.toString(vo.getQna_id());
		productQnaService.updateProductQnaState(state,qna_id );
		
		return "forward:/adminProductQnaList.do";
	}
	
	// 상품문의 댓글입력 
	@ResponseBody
	@RequestMapping("/writePrdQna.do")
	public void wirteProductQna(ProductQnaVO vo ,ProductVO pv,HttpSession session) {
		System.out.println("댓글입력 메소드 실행");
		String user_id = (String) session.getAttribute("user_id");
		
		System.out.println("댓글등록 qnaVO : " + vo);
		System.out.println("댓글등록 productVO : " + pv);
		
		vo.setUser_id(user_id);
		productQnaService.insertProductQna(vo);
	}
	
	
	// 상품문의 댓글 페이징
	@ResponseBody
	@RequestMapping("/qnaWithPaging.do")
	public Map<String,Object> qnsListPaging(ProductQnaNickVO nv,ProductVO pv ,PagingVO paging,
			@RequestParam(value="nowPage", required = false) String nowPage,
			@RequestParam(value="cntPerPage", required = false) String cntPerPage){
		System.out.println("::::::::qnsListPaging() 실행");
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		int product_id = nv.getProduct_id();
		int total = pagingService.totalPrdQna_prd(product_id);
		System.out.println("total : " + total);
		
		int setLastPage = 0;
		if (nowPage == null && cntPerPage == null) {
			cntPerPage = "4";
			int cntPerPageNum = Integer.parseInt(cntPerPage);
			setLastPage = (int) Math.ceil((double)total / (double)cntPerPageNum);
			System.out.println("last : " + setLastPage);
			nowPage = Integer.toString(setLastPage);
		} else if (nowPage == null) {
			cntPerPage = "4";
			int cntPerPageNum = Integer.parseInt(cntPerPage);
			setLastPage = (int) Math.ceil((double)total / (double)cntPerPageNum);
			System.out.println("last : " + setLastPage);
			nowPage = Integer.toString(setLastPage);
		} else if (cntPerPage == null) { 
			cntPerPage = "4";
		}
		
		
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		ProductVO product = productService.getProduct(pv);
		List<ProductQnaNickVO> qnaList = pagingService.prdQnaList_prd(product_id, paging.getStart(), paging.getEnd());	
		
		
		map.put("paging", paging);
		map.put("qnaList",qnaList);
		map.put("product",product);
		
		return map;
	}
	

	
	
}
