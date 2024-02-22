package com.bitc.intranet;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.MemberMapper;
import com.bitc.intranet.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
 		locations= {"classpath:/spring/root-context.xml"}
)
public class MemberMapperTest {

	@Autowired
	MemberMapper mapper;
	
	@Test
	public void testMapper() throws Exception{
		MemberVO vo = new MemberVO();
		vo.setUid("test");
		vo.setUpw("test");
		vo.setUname("테스트");
		vo.setUdep("총무");
		vo.setUemail("null@cmail.com");
		vo.setUjob("사원");
		vo.setUphone("01012345678");
		vo.getUdate();
		
		mapper.create(vo);
	}
}
