package com.spring.mall.paging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.mall.paging.service.PagingService;

@Controller
public class CenterQnaController {
	@Autowired
	private PagingService pagingService;
}
