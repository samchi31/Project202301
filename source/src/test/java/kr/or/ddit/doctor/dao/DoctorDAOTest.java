package kr.or.ddit.doctor.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.AbstractTestCase;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DoctorDAOTest extends AbstractTestCase{
	@Inject
	DoctorDAO dao;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSelectDisList() {
		log.info("{}",dao.selectDisList());
	}

	@Test
	public void testSelectSymList() {
		log.info("{}",dao.selectSymList());
	}

	@Test
	public void testSelectGOList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectTrmChart() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectTrmChartList() {
		fail("Not yet implemented");
	}

}
