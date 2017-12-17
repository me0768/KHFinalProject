package com.kh.fitnessground.workout.yoga.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.admin.model.service.AdminService;
import com.kh.fitnessground.admin.model.vo.BusinessRequest;
import com.kh.fitnessground.gym.model.vo.GymQnABoard;
import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.workout.yoga.model.service.YogaService;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Controller
public class YogaController {

	private static final Logger logger = LoggerFactory.getLogger(YogaController.class);

	@Autowired
	private YogaService yogaService;
	
	@Autowired
	private AdminService adminService;

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

		// 동영상 조회수 readCount++ (undone);; 
		@RequestMapping(value = "/ycount.do")
		public ModelAndView YogaAddReadCountMethod(int v_no, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/workout/yogaCategory");
			yogaService.addReadCount(v_no, request);
			ArrayList<Yoga> list = yogaService.selectAllYList();
			mv.addObject("list", list);
			return mv;
		}

		/*------- 관리자화면------*/
		
		// listing All (처음 동영상관리 페이지) 
	      @RequestMapping(value = "adminylist.do")
	      public ModelAndView AdminListAllMethod(Yoga yoga, HttpServletRequest request, User user, BusinessRequest businessRequest, @RequestParam(value = "level", required = false, defaultValue = "0") int level,
	            GymQnABoard gymqnaboard, @RequestParam(value="receiver", required = false, defaultValue = "1") int receiver) {
	         
	         ModelAndView mv = new ModelAndView("admin/videolist");
	         
	         int requestc = adminService.RequestCount(level);
	         int message = adminService.Message(receiver);
	         
	         ArrayList<User> gymRlist = adminService.GymRequest(level);
	         ArrayList<GymQnABoard> qnalist = adminService.GymQnABoard(receiver);
	         ArrayList<Yoga> list = yogaService.selectAllList();
	         
	         mv.addObject("request", requestc);
	         mv.addObject("message", message);
	         mv.addObject("gymRlist", gymRlist);
	         mv.addObject("qnalist", qnalist);
	         mv.addObject("list", list);
	         
	         return mv;
	      }
		
		//선택된 운동종류만 listing
		@RequestMapping(value = "/adminwlist.do", method = RequestMethod.POST)
		public ModelAndView AdminWorkoutListMethod(Yoga yoga, HttpServletRequest request){
			ModelAndView mv = new ModelAndView("admin/videolist");
			//전송온 문자열을 json 객체로 변환 처리

			ArrayList<Yoga> clist = yogaService.selectWList(yoga);
			for(Yoga y : clist) {
				y.setTitle(y.getTitle().replaceAll("\\\"", "＇"));
				y.setContent(y.getContent().replaceAll("\\\"", "＇"));// 쌍따옴표jsp출력 문제로 미리 치환
			}
			mv.addObject("clist", clist);
			mv.setViewName("jsonView");
			return mv;
		}
		
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

			List<Yoga> ylist = new ArrayList<Yoga>(); //여러개의 동영상 객체들 담기
			for (int i = 0; i < jarr.size(); i++) {
				JSONObject job = (JSONObject) jarr.get(i);
				String title = (String) job.get("title");
				String content = (String) job.get("title");// 임시로 이렇게..;
				String url = (String) job.get("url");
				String category1 = (String) job.get("category1");
				String category2 = (String) job.get("category2");
				Yoga yoga = new Yoga(title, content, category1, category2, url);
				System.out.println("yoga" + yoga);

				ylist.add(yoga);
			}
			yogaService.insertYoga(ylist, request);

			return new ResponseEntity<String>("success", HttpStatus.OK);
		}

		// 동영상 수정하기 뷰 메소드
		@RequestMapping(value = "/editview.do", method= RequestMethod.POST)
		public ModelAndView yogaUpdateViewMethod(Yoga yoga, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("admin/videolist");
			System.out.println(yoga+"v_no came here");
			Yoga y = yogaService.updateViewYoga(yoga, request);
			System.out.println("from db:"+y);
			mv.addObject("yoga", y);
			mv.setViewName("jsonView");
			return mv;
		}

		// 동영상 수정 처리 메소드
		@RequestMapping(value = "/yupdate.do", method=RequestMethod.POST)
		public ModelAndView YogaUpdateMethod(Yoga yoga, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("admin/videolist");
			/*request.setCharacterEncoding("utf-8");*/
			yogaService.updateYoga(yoga, request);
			ArrayList<Yoga> list = yogaService.selectWList(yoga);
			mv.addObject("list", list);
			mv.setViewName("jsonView");
			return mv;
		}

		// 동영상 delete(하나씩)
		@RequestMapping(value = "/deleteone.do", method = RequestMethod.POST)
		public ModelAndView YogadeleteMethod(Yoga yoga, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("admin/videolist");
			System.out.println(yoga+":v_no got ");
			yogaService.deleteYoga(yoga, request);
			ArrayList<Yoga> list = yogaService.selectAllList();
			System.out.println(list+":list received");
			mv.addObject("list", list);
			mv.setViewName("jsonView");
			return mv;
		}

		// 동영상 delete(복수선택 체크박스로)
		@RequestMapping(value = "/deletel.do", method = RequestMethod.POST)
		public ModelAndView YogaListDeleteMethod(List<Yoga> dellist, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("admin/videolist");
			yogaService.deleteYogaList(dellist, request);
			ArrayList<Yoga> ylist = yogaService.selectAllYList();
			mv.addObject("yogalist", ylist);
			return mv;
		}
		
		

}