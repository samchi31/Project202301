package kr.or.ddit.radiology.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.AbstractTestCase;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RadiologyDAOTest extends AbstractTestCase{
	
	@Inject
	RadiologyDAO dao;

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSelectTotalRecord() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectPatientList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectPatient() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectXrayPatient() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectMriPatient() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectChartList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectXrayList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectMRIList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectCTList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectUltraList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectRadiAllList() {
		fail("Not yet implemented");
	}

	@Test
	public void testModifyWaitListInsert() {
		Map<String, String> map = new HashMap<>();
		
		log.info("{}", dao.modifyWaitListInsert(map));
	}

	@Test
	public void testChangeWaitListFilmOrderInsert() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectTrmChart() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectFilmChart() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectWaitStatus() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectFilmCate() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectSymptomList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectDiagList() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertAttach() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertAttaches() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateFilmDate() {
		fail("Not yet implemented");
	}

}
