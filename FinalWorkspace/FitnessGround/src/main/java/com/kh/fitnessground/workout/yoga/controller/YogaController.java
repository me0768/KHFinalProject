package com.kh.fitnessground.workout.yoga.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.workout.yoga.model.service.YogaService;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Controller
public class YogaController {

	private static final Logger logger = LoggerFactory.getLogger(YogaController.class);

	@Autowired
	private YogaService yogaService;

	public YogaController() {}
		

		// yoga 메인 list(조회수 top 5)
		@RequestMapping(value = "/yogaMain.do")
		public ModelAndView YogaListMethod(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/yogaMain");
			ArrayList<Yoga> list = yogaService.selectAllYList();
			for(Yoga y : list) {
				y.setTitle(y.getTitle().replaceAll("\\\"", "＇"));
				y.setContent(y.getContent().replaceAll("\\\"", "＇"));// 쌍따옴표jsp출력 문제로 미리 치환
				}
			System.out.println(list);
			mv.addObject("list", list);
			return mv;
		}
		//pilates main list(조회수 top 5)
		@RequestMapping(value = "/pilatesMain.do")
		public ModelAndView YogaPListMethod(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/pilatesMain");
			ArrayList<Yoga> list = yogaService.selectAllPList();
			System.out.println(list);
			mv.addObject("list", list);
			return mv;
		}

		// yoga 카테고리별 list
		@RequestMapping(value = "/yclist.do", method = RequestMethod.POST)
		public ModelAndView YogaCategoryListMethod(Yoga yoga, HttpServletRequest request){
			ModelAndView mv = new ModelAndView("/workout/yogaMain");
			//전송온 문자열을 json 객체로 변환 처리

			ArrayList<Yoga> clist = yogaService.selectCList(yoga);
			for(Yoga y : clist) {
				y.setTitle(y.getTitle().replaceAll("\\\"", "＇"));
				y.setContent(y.getContent().replaceAll("\\\"", "＇"));// 쌍따옴표jsp출력 문제로 미리 치환
			}
			
			mv.addObject("clist", clist);
			mv.setViewName("jsonView");
			return mv;
		}

		// 동영상 조회수 readCount++
		@RequestMapping(value = "/ycount.do")
		public ModelAndView YogaAddReadCountMethod(int v_no, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/yogaCategory");
			yogaService.addReadCount(v_no, request);
			ArrayList<Yoga> list = yogaService.selectAllYList();
			mv.addObject("list", list);
			return mv;
		}

		/*-----Authority=관리자-------*/

		// 동영상 insert (playlist단위로:: 관리자가 playlist입력->자바스크립트에서 api로 video리스트를 json객체로 담아
		// 컨트롤러에보냄)
		@RequestMapping(value = "/yinsert.do", method = RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<String> YogaInsertMethod(HttpServletRequest request, @RequestBody String param)
				throws Exception {
			logger.info("YogaInsert() run...");
			request.setCharacterEncoding("utf-8");

			JSONArray jarr = (JSONArray) new JSONParser().parse(param);

			System.out.println("jarr : " + jarr.size());

			List<Yoga> ylist = new ArrayList<Yoga>();
			for (int i = 0; i < jarr.size(); i++) {
				JSONObject job = (JSONObject) jarr.get(i);
				String title = (String) job.get("title");
				String content = (String) job.get("title");// 임시로 이렇게..;
				String url = (String) job.get("url");
				String category2 = (String) job.get("category2");
				Yoga yoga = new Yoga(title, content, "요가", category2, url);
				System.out.println("yoga" + yoga);

				ylist.add(yoga);

			}
			yogaService.insertYoga(ylist, request);

			return new ResponseEntity<String>("success", HttpStatus.OK);
		}

		// 동영상 수정하기 뷰 메소드
		@RequestMapping(value = "/yupdateview.do")
		public ModelAndView yogaUpdateViewMethod(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/videoUpdateView");
			Yoga y = yogaService.selectYoga(Integer.parseInt(request.getParameter("v_no")));
			mv.addObject("yoga", y);
			return mv;
		}

		// 동영상 수정 처리 메소드(하나씩)
		@RequestMapping(value = "/yupdate.do")
		public ModelAndView YogaUpdateMethod(Yoga yoga, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/yogaCategory");
			yogaService.updateYoga(yoga, request);
			ArrayList<Yoga> list = yogaService.selectAllYList();
			mv.addObject("list", list);
			return mv;
		}

		// 동영상 delete(하나씩)
		@RequestMapping(value = "/ydelete.do")
		public ModelAndView YogadeleteMethod(Yoga yoga, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/yogaCategory");
			yogaService.deleteYoga(yoga, request);
			ArrayList<Yoga> ylist = yogaService.selectAllYList();
			mv.addObject("yogalist", ylist);
			return mv;
		}

		// 동영상 delete(복수선택 체크박스로)
		@RequestMapping(value = "/yldelete.do")
		public ModelAndView YogaListDeleteMethod(List<Yoga> dellist, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/yogaCategory");
			yogaService.deleteYogaList(dellist, request);
			ArrayList<Yoga> ylist = yogaService.selectAllYList();
			mv.addObject("yogalist", ylist);
			return mv;
		}
		
		

}