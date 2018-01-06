package premukview.bbs.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import premukview.bbs.service.BbsService;

@Controller
public class BbsController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="bbsService")
	private BbsService bbsService;
	
	@RequestMapping(value="/bbs/openBbsList.do")			//글목록(list)
	public ModelAndView openBbsList(Map<String, Object>commandMap) throws Exception{
		ModelAndView mav= new ModelAndView("/bbs/bbsList");
		
		List<Map<String,Object>> list = bbsService.selectBbsList(commandMap);
		mav.addObject("list",list);
		
		return mav;
		
	}
	
	@RequestMapping(value="/bbs/openBbsDetail.do")
	public ModelAndView openBbsDetail(@RequestParam Map<String,Object> commandMap) throws Exception{
		
		ModelAndView mav = new ModelAndView("/bbs/bbsDetail");
	
		Map<String, Object> map =bbsService.selectBbsDetail(commandMap);
		    mav.addObject("map", map.get("map")) ;
		    mav.addObject("list", map.get("list"));

		return mav;
	
	}
	   
	@RequestMapping(value="/bbs/openBbsWrite.do")			//글쓰기 폼 열기
	public ModelAndView openBoardWrite(@RequestParam Map<String, Object> commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/bbs/bbsWriteForm");
	     
	    return mv;
	}
	
	@RequestMapping(value="/bbs/insertBbs.do")				//글쓰기 (insert)
	public ModelAndView insertBoard(@RequestParam Map<String, Object> commandMap, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/bbs/openBbsList.do");
	     
	    bbsService.insertBbs(commandMap, request);
	     
	    return mv;
	}
	
	
	
	
	
}
