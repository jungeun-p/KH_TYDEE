package com.tydee.utils;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tydee.dao.MyTydeeDao;
import com.tydee.dto.MyTydeeDistinctDto;
import com.tydee.dto.MyTydeeDto;
import com.tydee.dto.UserInfoDto;

public class MyTydeeConvertToJson {
	static MyTydeeDao mtdao = new MyTydeeDao();
    public static String convertJson(UserInfoDto loginuser) {
        int user_no = loginuser.getUser_no();
        String user_nickname = loginuser.getUser_nickname();
        Date user_regdate = loginuser.getUser_regdate();
        List<MyTydeeDistinctDto> levels = mtdao.selectListDistinct(user_no);
        // System.out.println("DistinctDto의 갯수: "+levels.size());
        Map<String, Object> treeMap = new HashMap<String, Object>();
        List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();

        for (MyTydeeDistinctDto level : levels) {
            List<MyTydeeDto> levelList = mtdao.selectListLevDepth(level);
            List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();
            for (MyTydeeDto tiny : levelList) {
                // System.out.println(tiny.getTiny_title());
                Map<String, Object> item = makeItem(tiny);
                itemList.add(item);
            }
            if (level.getLev() == 1) {
                treeMap.put("user_no", user_no);
                treeMap.put("name", user_nickname);
                treeMap.put("regdate", user_regdate);
                treeMap.put("children", itemList);
            } else {
                Map<String, Object> tempMap = new HashMap<String, Object>();
                tempMap.putAll(treeMap);
                tempList = (List<Map<String, Object>>) tempMap.get("children");
                findDeeper(level.getLev(), tempList, tempMap, level.getTiny_depth(), itemList);
            }
        }
        Gson gson = new GsonBuilder().create();
        String json = gson.toJson(treeMap);
        return json;
    };

    public static Map<String, Object> makeItem(MyTydeeDto dto) {
        Map<String, Object> item = new HashMap<String, Object>();
        item.put("tiny_no", dto.getTiny_no());
        item.put("name", dto.getTiny_title());
        item.put("tiny_type", dto.getTiny_type());
        item.put("tiy_depth", dto.getTiny_depth());
        item.put("tiny_content", dto.getTiny_content());
        item.put("tiny_image", dto.getTiny_image());
        item.put("regdate", dto.getTiny_regdate());
        item.put("value", 1);
        return item;
    }

    public static void findDeeper(int lev, List<Map<String, Object>> list, Map<String, Object> map, int tiny_depth,
            List<Map<String, Object>> itemList) {
        for (int i = 0; i < list.size(); i++) {
            map = list.get(i);
            if (tiny_depth == (int) map.get("tiny_no")) {
                map.put("children", itemList);
                return;
            }
        }
        for (int i = 0; i < list.size(); i++) {
            map = list.get(i);
            if (map.containsKey("children")) {
                list = (List<Map<String, Object>>) map.get("children");
                if (lev > 1) {
                    findDeeper(lev - 1, list, map, tiny_depth, itemList);
                }
            }

        }
    }
    
    public static String makeOptions(UserInfoDto loginuser) {
        int user_no = loginuser.getUser_no();
    	List<MyTydeeDto> options = mtdao.selectListTypeD(user_no);
    	List<Map<String, Object>> optionList = new ArrayList<Map<String,Object>>();
    	for (MyTydeeDto dto : options) {
    		Map<String,Object> option = new HashMap<String, Object>();
    		option.put("lev", dto.getLev());
    		option.put("tiny_title", dto.getTiny_title());
    		option.put("tiny_no",dto.getTiny_no());
    		optionList.add(option);
    	}
        Gson gson = new GsonBuilder().create();
        String json = gson.toJson(optionList);
    	return json;
    }
}
