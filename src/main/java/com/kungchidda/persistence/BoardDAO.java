package com.kungchidda.persistence;

import java.util.List;
import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
//import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SearchCriteria;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;
//	public void add(BoardVO vo) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(Integer bno) throws Exception;
//	public List<BoardVO> listAll() throws Exception;
//	public List<BoardVO> listPage(int page) throws Exception;
//	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
//	public int countPaging(Criteria cri) throws Exception;
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCnt(Integer bno, int amount) throws Exception;
	public void updateViewCnt(Integer bno) throws Exception;
	
	public void addAttach(String fullName) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	public void deleteAttach(Integer bno) throws Exception;
	public void replaceAttach(String fullName, Integer bno) throws Exception;
	
	public void deleteReplyAll(Integer bno) throws Exception;
	
	public void updateLikeCnt(Integer bno) throws Exception;
	
	// 페이징 처리를 하기 위해 Criteria cri 파라미터 추가
	public List<BoardVO> listPage(Integer tno, Criteria cri) throws Exception;
	// 페이징 처리를 하기 위해 count 추가
	public int count(Integer tno) throws Exception;
	
}
