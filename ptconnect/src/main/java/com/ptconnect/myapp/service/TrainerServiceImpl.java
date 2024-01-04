package com.ptconnect.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptconnect.myapp.domain.TrainerDTO;
import com.ptconnect.myapp.persistance.TrainerServiceMapper;

@Service
public class TrainerServiceImpl implements TrainerService{

	private TrainerServiceMapper tsm;
	
	@Autowired
	public TrainerServiceImpl(SqlSession sqlSession) {
		this.tsm = sqlSession.getMapper(TrainerServiceMapper.class);
	}

	@Override
	public ArrayList<TrainerDTO> findTrainer() {
		
		return null;
	}
	
	
}