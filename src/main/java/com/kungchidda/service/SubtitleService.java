package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SubtitleVO;

public interface SubtitleService {
	//댓글 페이징 추가
		public List<SubtitleVO> listSubtitlePage(Integer bno, Criteria cri) throws Exception;
		public int count(Integer bno) throws Exception;

}
