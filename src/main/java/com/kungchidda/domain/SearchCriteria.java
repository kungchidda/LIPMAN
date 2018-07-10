package com.kungchidda.domain;


public class SearchCriteria extends Criteria{
	
	private String searchType;
	private String keyword;
	private String genre;
	private String[] genreArr;
	private String uid;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public void setGenreArr(String[] genreArr) {
		this.genreArr = genreArr;
	}
	
	public String[] getGenreArr() {
		return genreArr;
	}
	
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getUid() {
		return uid;
	}
	
	
	@Override
	public String toString() {
		return super.toString() + "SearchCriteria" + "[searchType=" + searchType + ", keyword=" + keyword +", genre=" + genre +"], uid=" + uid +"]";
	}

}
