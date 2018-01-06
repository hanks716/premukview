package premukview.bbs.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import premukview.bbs.dao.BbsDAO;
import premukview.common.util.FileUtils;

@Service("bbsService")
public class BbsServiceImpl implements BbsService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bbsDAO")
	private BbsDAO bbsDAO;
	 
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectBbsList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.selectBbsList(map);
	}
	
    @Override
    public void insertBbs(Map<String, Object> map, HttpServletRequest request) throws Exception {
    	bbsDAO.insertBoard(map);
    	
    	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
        MultipartFile multipartFile = null;
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                log.debug("------------- file start -------------");
                log.debug("name : "+multipartFile.getName());
                log.debug("filename : "+multipartFile.getOriginalFilename());
                log.debug("size : "+multipartFile.getSize());
                log.debug("-------------- file end --------------\n");
            }
        }
    	List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
            bbsDAO.insertFile(list.get(i));
        }
        
        
    } 
    
	@Override
	public Map<String, Object> selectBbsDetail(Map<String, Object> map) throws Exception {
		bbsDAO.updateHitCnt(map);
	    Map<String, Object> resultMap = new HashMap<String,Object>();

		Map<String, Object> tempMap = bbsDAO.selectBbsDetail(map);
		resultMap.put("map", tempMap);
		     
		List<Map<String,Object>> list = bbsDAO.selectFileList(map);
		resultMap.put("list", list);
		  
		return resultMap;
	}
}
