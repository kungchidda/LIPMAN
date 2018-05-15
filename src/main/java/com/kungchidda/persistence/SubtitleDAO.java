package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SubtitleVO;

public interface SubtitleDAO {

	// 페이징 처리를 하기 위해 Criteria cri 파라미터 추가
		public List<SubtitleVO> listPage(Integer bno, Criteria cri) throws Exception;
		// 페이징 처리를 하기 위해 count 추가
		public int count(Integer bno) throws Exception;
		
		public int getBno(Integer rno) throws Exception;
}
