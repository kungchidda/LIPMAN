package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.ReplyVO;

public interface ReplyDAO {
	// ReplyDAO는 우선적으로 필요한 댓글의 리스트와 댓글 등록, 수정, 삭제 기능을 정의
	public List<ReplyVO> list(Integer bno) throws Exception;
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	

	// 페이징 처리를 하기 위해 Criteria cri 파라미터 추가
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;
	// 페이징 처리를 하기 위해 count 추가
	public int count(Integer bno) throws Exception;
	
	public int getBno(Integer rno) throws Exception;
	
	public void updateReplyLikeCnt(Integer bno) throws Exception;
}
