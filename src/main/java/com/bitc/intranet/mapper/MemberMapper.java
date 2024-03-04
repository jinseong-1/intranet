package com.bitc.intranet.mapper;

import java.lang.reflect.Member;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.vo.MemberVO;

public interface MemberMapper {

	/**
	 * memeber 등록 (회원가입시 회원 정보 등록) -- 완
	 * @param vo - 등록할 회원 정보
	 */

	@Insert("INSERT INTO member(uid, upw, uname, uemail, uphone, udep, ujob, udate, uaddr) " 
			+ " VALUES(#{uid}, #{upw}, #{uname}, #{uemail}, #{uphone}, #{udep}, #{ujob}, #{udate}, #{uaddr})")

	void create(MemberVO vo)throws Exception;

		
	/**
	 * 회원 가입한 회원 정보 등록 -- 완 
	 * @param i - id로 회원 정보 검색  (중복아이디)
	 * @return - uid가 일치하는 회원 정보 
	 */
	@Select("SELECT * FROM Member WHERE uid = #{uid}")
	MemberVO readMember(String uid) throws Exception;
	
	/**
	 * 회원 목록 리스트 -- 완
	 * @return - 테이블에 등록된 전체 회원 목록
	 */
	@Select("SELECT * FROM member ORDER BY uno DESC")
	List<MemberVO> list() throws Exception;
	
	/**
	 * 
	 * @param uid와 upw 가 일치하는 로그인정보
	 */
	@Select("SELECT * FROM Member WHERE uid = #{uid} and upw = #{upw}")
	MemberVO loginMember(MemberVO vo) throws Exception;
	
	@Update("UPDATE * FROM member SET upw = #{upw}, uname = #{uname}, uemail = #{uemail}, uphone = #{uphone} WHERE uid = #{uid}")
	MemberVO updateMember(MemberVO vo) throws Exception;
	 
	/**
	 * 비밀번호 찾기
	 * @param uid, uname이 일치하는 회원정보 검색
	 */
	@Select("SELECT * FROM Member WHERE uid = #{uid} and uname = #{uname} and uemail = #{uemail}")
	MemberVO findPass(MemberVO vo) throws Exception;
	
	/**
	 * repw로 비밀번호 변경하기
	 */
	@Update("UPDATE member SET upw=#{repw} WHERE uid= #{uid}")
	void changePass(String repw) throws Exception;
}
