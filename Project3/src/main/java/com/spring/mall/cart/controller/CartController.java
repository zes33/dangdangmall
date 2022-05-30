package com.spring.mall.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mall.cart.service.CartService;
import com.spring.mall.cart.vo.CartVO;
import com.spring.mall.user.service.UserLoginService;
import com.spring.mall.user.vo.UserVO;

@Controller
@RequestMapping("/cart/**")
public class CartController {

	@Autowired
	private CartService cartService;

	// 임시
	@Autowired
	private UserLoginService userLoginService;

	public CartController() {
		System.out.println(">> CartController() 객체 생성 ");
	}

//	// 헤더 장바구니 버튼을 누르면 장바구니 페이지로 연결
//	@GetMapping("cartView.do")
//	public String cartView() {
//		System.out.println("장바구니 페이지(cart.jsp)이동 - cartView()");
//		return "list.do";
//	}

	@GetMapping("/list.do")
	public String list(CartVO vo, Model model, HttpSession session) {
		System.out.println(">> list.do() 생성 ");
		String user_id = (String) session.getAttribute("user_id");
		List<CartVO> list = cartService.listCart(user_id);
		model.addAttribute("list", list);
		return "user/cart";

	}

	// 1. 장바구니 추가
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute CartVO vo, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");

		// 장바구니에 기존 상품이 있는지 검사
		int count = cartService.countCart(vo.getProduct_id(), user_id);

//        count == 0 ? cartService.updateCart(vo) : cartService.insert(vo);
		if (count == 0) {
			// 없으면 insert
			cartService.insert(vo);
		} else {
			// 있으면 update
			cartService.updateCart(vo);
		}
		return "cart.do";
	}

//	// 2. 장바구니 목록
//	@ModelAttribute("list")
//	@RequestMapping("cart.do")
//	public List<CartVO> list(HttpSession session, Model model) {
//		System.out.println("list - cart");
//		String user_id = (String) session.getAttribute("user_id"); // session에 저장된 user_id
//		System.out.println(user_id + " : user_id");
//				
////		Map<String, Object> map = new HashMap<String, Object>();
//		List<CartVO> list = cartService.listCart(user_id); // 장바구니 정보
//		//int sumMoney = cartService.sumMoney(user_id); // 장바구니 전체 금액 호출
//
////		map.put("list", list); // 장바구니 정보를 map에 저장
////		map.put("count", list.size()); // 장바구니 상품의 유무
////		map.put("allSum", sumMoney ); // 주문 상품 전체 금액
//
////		model.addAttribute("map", map);
//		model.addAttribute("list", list);
//		return list;
//	}

	// 3. 장바구니 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cart_id) {
		cartService.delete(cart_id);
		return "redirect:/user/cart/list.do";
	}

	// 4. 장바구니 수정
	@RequestMapping("update.do")
	public String update(@RequestParam int[] cart_product_qty, @RequestParam int[] product_id, HttpSession session) {
		// session의 id
		String user_id = (String) session.getAttribute("user_id");
		// 레코드의 갯수 만큼 반복문 실행
		for (int i = 0; i < product_id.length; i++) {
			CartVO vo = new CartVO();
			vo.setUser_id(user_id);
			vo.setCart_product_qty(cart_product_qty[i]);
			vo.setProduct_id(product_id[i]);
			cartService.modifyCart(vo);
		}

		return "redirect:/user/cart/list.do";
	}

}
