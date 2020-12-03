package com.tydee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tydee.dao.TinyDao;
import com.tydee.dto.DistinctDto;
import com.tydee.dto.TinyDto;

public class TydeeGson {
	public String callJson() {
		TinyDao dao = new TinyDao();

		List<DistinctDto> levels = dao.selectDistinct();
		Map<String,Object> treeMap = new HashMap<String,Object>();
		List<Map<String,Object>> tempList = new ArrayList<Map<String,Object>>();

		for (DistinctDto level : levels) {
			int lev = level.getLev();
			int parent_seq = level.getParent_seq();
			List<TinyDto> levelList = dao.selectListLev(level);
			List<Map<String,Object>> itemList = new ArrayList<Map<String,Object>>();
			for(TinyDto tiny : levelList) {
				Map<String,Object> item = makeItem(tiny);
				itemList.add(item);
			}

			if(lev==1) {
				treeMap.put("member_no", 1);
				treeMap.put("name", "rabbit");
				treeMap.put("children",itemList);
			} else {
				Map<String,Object> tempMap = new HashMap<String,Object>();
				tempMap.putAll(treeMap);
				tempList = (List<Map<String, Object>>) tempMap.get("children");
				findDeeper(lev, tempList, tempMap, parent_seq, itemList);
			}
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(treeMap);
		return json;
	}
	public static Map<String,Object> makeItem(TinyDto dto) {
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("seq", dto.getSeq());
		item.put("name", dto.getName());
		item.put("parent_seq", dto.getParent_seq());
		item.put("regdate", dto.getRegdate());
		item.put("value", 1);
		return item;
	}
	public static void findDeeper(int lev, List<Map<String,Object>> list, Map<String,Object> map, int parent_seq, List<Map<String,Object>> itemList) {
		for (int i=0; i<list.size(); i++) {
			map = list.get(i);
			if(parent_seq == (int) map.get("seq")) {
				map.put("children", itemList);
				return;
			}
		}
		for(int i=0; i<list.size(); i++) {
			map = list.get(i);
			if(map.containsKey("children")) {
				list = (List<Map<String, Object>>) map.get("children");
				if (lev > 1) {
					findDeeper(lev-1, list,map,parent_seq,itemList);
				}
			}
			
		}
	}
}