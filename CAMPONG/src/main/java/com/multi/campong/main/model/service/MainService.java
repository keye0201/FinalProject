package com.multi.campong.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.campong.bagpacking.model.vo.Bagpacking;
import com.multi.campong.camping.model.vo.Camping;
import com.multi.campong.main.model.mapper.MainMapper;


@Service
public class MainService {

	@Autowired
	MainMapper mapper;
	
	public List<Camping> selectCamping(String donm) {
		List<Camping> camps = mapper.selectByDONM(donm);
		return camps;
	}
	public List<Camping> selectCamping2(String idCheck) {
		List<Camping> camps = mapper.selectByDONM2(idCheck);
		return camps;
	}
}
