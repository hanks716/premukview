package premukview.bbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BbsService {
	
	List<Map<String,Object>>selectBbsList(Map<String,Object>map)throws Exception;
	void insertBbs(Map<String, Object> map, HttpServletRequest request) throws Exception;
	Map<String,Object>selectBbsDetail(Map<String,Object>map)throws Exception;
}
