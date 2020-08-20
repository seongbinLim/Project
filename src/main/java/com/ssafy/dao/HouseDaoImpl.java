package com.ssafy.dao;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.HouseDeal;
import com.ssafy.dto.HouseInfo;
import com.ssafy.dto.HousePageBean;

@Repository
public class HouseDaoImpl implements HouseDao {
	
	private static final String MAPPER = "house.";
	
	@Autowired
	SqlSession session;
	
	private Map<String, HouseInfo> houseInfo;
	private Map<String, List<HouseDeal>> deals;
	private List<HouseDeal> search;
	private String[] searchType = { HouseDeal.APT_DEAL, HouseDeal.APT_RENT, HouseDeal.HOUSE_DEAL,
			HouseDeal.HOUSE_RENT };

	public HouseDaoImpl() {
		loadData();
	}

	/**
	 * 아파트 정보와 아파트 거래 정보를 xml 파일에서 읽어온다.
	 */
	public void loadData() {
	}

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를 검색해서 반환.
	 * 
	 * @param bean 검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(HousePageBean bean, int num) {
		System.out.println("start at "+num+" and end at "+(num+10));
		HashMap<String, Integer> map = new HashMap();
		map.put("startNum", num);
		map.put("endNum", num+10);
		return session.selectList(MAPPER+"selectAllHouseDeal", map);
	}

	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환한다.<br/>
	 * 법정동+아파트명을 이용하여 HouseInfo에서 건축연도, 법정코드, 지번, 이미지 정보를 찾아서 HouseDeal에 setting한
	 * 정보를 반환한다.
	 * 
	 * @param no 검색할 아파트 식별 번호
	 * @return 아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) throws SQLException {
		return session.selectOne(MAPPER+"selectHouseDealByNo", no);
	}

	public static void main(String[] args) {
		// 테스트
		HouseDao dao = new HouseDaoImpl();

		try {
			HouseDeal deal = dao.search(3);
			System.out.println(deal);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int cnt() {
		return session.selectOne(MAPPER+"selectCnt");
	}
}
