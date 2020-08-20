package com.ssafy.service;

import java.io.BufferedReader;


import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.RegionDao;
import com.ssafy.dao.RegionDaoImpl;
import com.ssafy.dto.Region;
import com.ssafy.dto.SelectedRegion;

@Service
public class SelectedRegionServiceImpl implements SelectedRegionService {
	@Autowired
	private RegionDao dao;
	private Scanner sc = new Scanner(System.in);
	
	
	public void selectRegion() {
		System.out.print("Id: ");
		String userId = sc.next();
		List<SelectedRegion> list = dao.selectedRegion(userId);
		List<Region> region = dao.selectRegion();
		if(list == null) {
			System.out.println("선택한 지역이 없습니다.");
			return;
		}
		System.out.println(userId+"가 선택한 지역은 ");
		for(SelectedRegion r : list) {
			for(Region reg : region) {
				if(reg.getNo() == r.getRegionNo()) {
					System.out.print(reg.getRegion()+"\t");
				}
			}
		}
		System.out.println("입니다.");
	}

	
	public void getSelectedRegion(String userId) {
		System.out.println("선택할 지역을 고르시오. ");
		List<Region> region = dao.selectRegion();
		for(Region r : region) {
			System.out.println(r.getNo()+". "+r.getRegion());
		}
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			StringTokenizer token;
			token = new StringTokenizer(br.readLine());
			List<Integer> list = new ArrayList();
			while(token.hasMoreTokens()) {
				String t = token.nextToken();
				System.out.println(t);
				list.add(Integer.parseInt(t));
			}
			dao.insertSelectedRegion(userId, list);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		SelectedRegionService region = new SelectedRegionServiceImpl();
		while(true) {
			System.out.println("1.선택한 지역 확인하기 2.선택하기");
			int num = scan.nextInt();
			switch(num) {
				case 1:
					region.selectRegion();
					break;
				case 2:
					System.out.print("userId: ");
					region.getSelectedRegion(scan.next());
					break;
			}
		}
	}
}
