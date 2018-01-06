package premukview.bbs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import premukview.common.dao.AbstractDAO;

@Repository("bbsDAO")
public class BbsDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>selectBbsList(Map<String,Object>map) throws Exception{
		return (List<Map<String, Object>>)selectList("bbs.selectBbsList",map);
	} 
	 
	public void insertBoard(Map<String, Object> map) throws Exception{
		    insert("bbs.insertBbs", map);
	}
	public void insertFile(Map<String, Object> map) throws Exception{
	    insert("bbs.insertFile", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
	    update("bbs.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object>selectBbsDetail(Map<String,Object>map) throws Exception{
		return (Map<String, Object>) selectOne("bbs.selectBbsDetail", map);

	} 
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>)selectList("bbs.selectFileList", map);
	}

}
