package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SubtitleVO;
import com.kungchidda.persistence.SubtitleDAO;

@Service
public class SubtitleServiceImpl implements SubtitleService {

	@Inject
	private SubtitleDAO subtitleDAO;
	
	@Override
	public List<SubtitleVO> listSubtitlePage(Integer bno, Criteria cri) throws Exception {
		return subtitleDAO.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return subtitleDAO.count(bno);
	}
}
