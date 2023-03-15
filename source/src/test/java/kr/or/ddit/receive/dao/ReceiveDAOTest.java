package kr.or.ddit.receive.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.AbstractTestCase;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ReceiveDAOTest extends AbstractTestCase{

	@Inject
	ReceiveDAO dao;
	
	@Before
	public void setUp() throws Exception {
		log.info("inject {}", dao);
	}

	@Test
	public void testSelectCompletePatientList() {
		log.info("dao test 1 {}", dao.selectCompletePatientList());
	}

	@Test
	public void testInsertReceive() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectReceive() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectReceiveList() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateReceive() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteReceive() {
		fail("Not yet implemented");
	}

}
