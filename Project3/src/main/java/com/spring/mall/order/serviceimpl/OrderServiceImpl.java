package com.spring.mall.order.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.cart.vo.CartVO;
import com.spring.mall.inven.vo.InvenVO;
import com.spring.mall.order.dao.OrderDAO;
import com.spring.mall.order.service.OrderService;
import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.pay.vo.PaymentVO;
import com.spring.mall.user.vo.UserOrderPointVO;
import com.spring.mall.user.vo.UserVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	public OrderServiceImpl() {
		System.out.println(">> OrderServiceImpl 생성 ");
	}

	// 1. 주문 정보 입력
	@Override
	public void insertOrder(UserOrderVO vo) {
		orderDAO.insertOrder(vo);

	}

	// 2. 주문 상세 정보 입력
	@Override
	public void insertOrderDetail(UserOrderDetailVO vo) {
		orderDAO.insertOrderDetail(vo);
	}

	// 3. 카트 비우기
	@Override
	public void cartAllDelete(String user_id) {
		orderDAO.cartAllDelete(user_id);
	}

	// 4. 결제창에서 쓰일 최근 주문 정보 가져오기
	@Override
	public UserOrderVO getOrder(String user_id, String order_id) {
		return orderDAO.getOrder(user_id, order_id);
	}

	// 5. 결제 완료 후, 결제 테이블로 넘기기
	@Override
	public void insertPayment(PaymentVO vo) {
		orderDAO.insertPayment(vo);
	}

	// 6. 포인트 적립
	@Override
	public void updatePoint(UserOrderPointVO vo) {
		orderDAO.updatePoint(vo);

	}

	// 7. 바로구매 상세 주문정보 입력
	@Override
	public void insertOrderDetailDirect(UserOrderDetailVO vo) {
		orderDAO.insertOrderDetailDirect(vo);

	}

	// 8. 구매이후 재고량 수정(-)
	@Override
	public void deleteInven(InvenVO vo) {
		orderDAO.deleteInven(vo);
		
	}

	// 9. 구매 이후 구매한 상품 아이디, 수량 가져오기
	@Override
	public List<UserOrderDetailVO> getIdQty(String order_id) {
		return orderDAO.getIdQty(order_id);
	}

}
