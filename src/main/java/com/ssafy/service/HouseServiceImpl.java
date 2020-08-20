package com.ssafy.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.HouseDao;
import com.ssafy.dao.HouseDaoImpl;
import com.ssafy.dao.HouseInfoDao;
import com.ssafy.dao.HouseInfoDaoImpl;
import com.ssafy.dto.HouseDeal;
import com.ssafy.dto.HouseInfo;
import com.ssafy.dto.HousePageBean;
import com.ssafy.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseDao dao;
	@Autowired
	private HouseInfoDao infoDao;
	static int cnt;
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	
	public List<HouseDeal> searchValue(HousePageBean bean, String search, String value, int num) {
		try {
			System.out.println(search+" "+value);
			List<HouseDeal> list = dao.searchAll(bean, num);
			List<HouseDeal> result = new ArrayList<HouseDeal>();
			for(HouseDeal deal : list) {
				if(search.equals("dong")) {
					if(deal.getDong().contains(value)) {
						System.out.println(search+" "+deal);
						result.add(deal);
					}
				}
				else {
					if(deal.getAptName().contains(value)) {
						result.add(deal);
					}
				}
			}
			result = sort(result);
			cnt = result.size();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public List<HouseInfo> searchInfoValue(String search, String value) {
		List<HouseInfo> list = new ArrayList();
		List<HouseInfo> result = new ArrayList();
		for(HouseInfo info : list) {
			if(search.equals("dong")) {
				if(info.getDong().contains(value)) {
					result.add(info);
				}
			}
			else {
				if(info.getAptName().contains(value)) {
					result.add(info);
				}
			}
			Collections.sort(result);
			return result;
		}
		return null;
	}
	public List<HouseDeal> searchAll(HousePageBean bean, int num){
		try {
			boolean[] type = bean.getSearchType();
			int cnt = 0;
			for (boolean t : type) {
				if (t) {
					cnt++;
				}
			}
			List<HouseDeal> list = dao.searchAll(bean, num);
			//퀵정렬이나 병합정렬으로 정렬하기
//			cnt = list.size();
//			list = sort(list);
			return list;
		} catch (SQLException e) {
			//	         throw new HappyHouseException("주택정보 조회중 오류 발생");
		}
		return null;
	}
    public static List<HouseDeal> sort(List<HouseDeal> targetList) {
        if (targetList.size() > 1) {
            return merge(
                    sort(targetList.subList(0, targetList.size() / 2)),
                    sort(targetList.subList(targetList.size() / 2, targetList.size()))
            );
        } else {
            return targetList;
        }
    }

    public static List<HouseDeal> merge (List<HouseDeal> left, List<HouseDeal> right) {
        List<HouseDeal> result = new ArrayList<>();
        int rightIdx = 0;

        for (HouseDeal l : left) {
            while (right.size() > rightIdx && l.getDong().compareTo(right.get(rightIdx).getDong()) >= 0) {
                result.add(right.get(rightIdx));
                rightIdx++;
            }
            result.add(l);
        }
        for (int i = rightIdx; i < right.size(); i ++) {
            result.add(right.get(i));
        }
        return result;
    }
    
	public List<HouseDeal> viewList(List<HouseDeal> list, int cur, int size) {
		List<HouseDeal> result = new ArrayList();
		System.out.println(list.size());
		int listSize= list.size();
		int end = cur*10 + 11 > listSize ? listSize : cur*10 + 11;
		for(int i = cur*10 + 1; i < end; i++) {
			result.add(list.get(i));
		}
		return result;
	}
	
	public List<HouseInfo> viewInfoList(List<HouseInfo> list, int cur, int size) {
		List<HouseInfo> result = new ArrayList();
		System.out.println(result.size());
		for(int i = cur; i < cur+size; i++) {
			result.add(list.get(i));
		}
		return result;
	}
	public HouseDeal search(int no) {
		try {
			HouseDeal deal = dao.search(no);
			//			if(deal == null) {
			//				throw new HappyHouseException(String.format("거래번호 %d번에 해당하는 주택거래 정보가 존재하지 않습니다.",no));
			//			}
			return deal;
		} catch (SQLException e) {
			//			throw new HappyHouseException("주택 정보 조회중 오류 발생");
		}
		return null;
	}
	public PageNavigation makePageNavigation(int total, int currentPage, int sizePerPage) throws Exception {
		System.out.println("total: "+total+" currentPage: "+currentPage+" sizePerPage: "+sizePerPage);
		int naviSize = 10;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = total;
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;//
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
	@Override
	public List<HouseInfo> searchInfo(int num) {
		try {
			return infoDao.searchAllHouseInfo(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int cnt() {
		return dao.cnt();
	}
	
}




