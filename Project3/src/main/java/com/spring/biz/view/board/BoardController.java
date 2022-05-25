package com.spring.biz.view.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.user.UserService;

@Controller
@SessionAttributes("board") //board라는 이름의 Model(데이터 객체)가 있으면 session에 저장 
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	public BoardController() {
		System.out.println("::::::::BoardController() 객체 생성");
	}
	
	//메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	//@ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	//뷰에 전달 될 때 설정된 명칭을 사용 ( ex - conditionMap)
	//즉,Map<String, String>가 conditionMap라는 이름으로 포워딩 처리 될 때마다 View 쪽에서 동적으로 사용할 수 있다
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		System.out.println("==> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
		
	}

	//리턴 타입 : ModelAndView -> String
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println(">> 게시글 상세 보여주기");

		BoardVO board = boardService.getBoard(vo);	
		
		model.addAttribute("board", board); //Model 객체 사용 View로 데이터 전달(포워딩 처리)
		return "getBoard.jsp";
	}
	
	//전달받은 파라미터 명과 내가 사용할 변수명이 다를 때 or 디폴트값 지정할 때 @RequestParam 사용
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) { 
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);
		
		//List<BoardVO> boardList = boardDAO.getBoardList();
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		model.addAttribute("boardList", boardList);
		
		return "getBoardList.jsp";
	}
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : " + vo);
		
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println(">uploadFile : " + uploadFile);
		
		/* 파일 업로드 관련
		  MultipartFile 인터페이스 주요 메소드
		  -String getOriginalFilename() : 업로드 할 파일명 찾기
		  -void transferTo(File dest) : 업로드 할 파일을 업로드(복사) 처리
		  -boolean isEmpty() : 업로드 할 파일 존재 여부(없으면 true 리턴)
		 */
		if(uploadFile == null) {
			System.out.println(":::uploadFile 파라미터 값이 전달되지 않았습니다.");
		}else if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			System.out.println(">>원본 파일명 : " + fileName);
			System.out.println(">> 저장 파일명 : " + UUID.randomUUID().toString());
//			uploadFile.transferTo(new File("C:/MyStudy/temp/" + fileName)); //실질적으로 파일 복사하는 역할 , \\ = /
			uploadFile.transferTo(new File("C:/MyStudy/temp/" + UUID.randomUUID().toString())); //실질적으로 파일 복사하는 역할 , \\ = /
		}
		
		boardService.insertBoard(vo);
		
		return "getBoardList.do";
	}
	
	//@ModelAttribute("board") BoardVO vo => session/scope에 board라는 이름의 BoardVO타입의 객체가 있으면
	// 그 vo를 가져오고, 없으면 새로운 vo객체 생성
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println(">>> 게시글 수정");
		System.out.println("vo : " + vo);
		boardService.updateBoard(vo);
		
		return "getBoardList.do";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println(">>> 게시글 삭제");
		
		boardService.deleteBoard(vo);
		
		return "getBoardList.do";
	}
}
