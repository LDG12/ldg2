package com.person456.ldg.controller;

import com.person456.ldg.dao.CalculatorDao;
import com.person456.ldg.dao.UserDao;
import com.person456.ldg.domain.CalculatorDto;
import com.person456.ldg.domain.Schedule_InfoDto;
import com.person456.ldg.domain.UserDto;
import com.person456.ldg.service.CalculatorService;
import com.person456.ldg.service.MailSendService;
import com.person456.ldg.service.Schedule_InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserDao userDao;
    @Autowired
    MailSendService mailSendService;
    @Autowired
    Schedule_InfoService schedule_infoService;
    @Autowired
    CalculatorService calculatorService;

    @GetMapping("/add")
    public String registerForm(){
        return "registerForm";
    }

    @PostMapping("/add")
    public String registerAdd(String id, String pwd, String email, String birth, String name, String status,
                              HttpServletRequest request, Model m)throws Exception{

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date realbirth = dateFormat.parse(birth);
        UserDto user = new UserDto(id, pwd, email, realbirth, name, status, realbirth);
        if(checkRegister(user)){
            String regMsg = URLEncoder.encode("회원가입이 완료되었습니다.", "utf-8");
            Schedule_InfoDto schedule_infoDto = new Schedule_InfoDto(1, "시간표 1", id);
            int rowCnt= schedule_infoService.addNewSchedule(schedule_infoDto);
            int Cnt = calculatorService.insertNewRegister(id);
            return "redirect:/?regMsg="+regMsg;
        }
        else{
            String regMsg = URLEncoder.encode("다시 확인해주세요.", "utf-8");
            return "redirect:/register/add?regMsg="+regMsg;
        }
    }
    @PostMapping("/check")
    public ResponseEntity<String> registerCheck(String id)throws Exception{
        UserDto user = userDao.selectUser(id);
        if(user==null){
            return ResponseEntity.ok("possible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
    @GetMapping("/emailCheck")
    @ResponseBody
    public String mailCheck(String email, Model m, HttpSession session) {
        String number = mailSendService.joinEmail(email);
        session.setAttribute("number", number);
        System.out.println("number = " + number);
        return number; // 생성된 인증번호를 반환
    }

    @GetMapping("/checkCultiNum")
    public ResponseEntity<String> checkCultiNum(String inputCultiNum, HttpSession session, Model model) {
        String coll = (String)session.getAttribute("number");
        System.out.println("inputCultiNum = " + inputCultiNum);
        System.out.println("coll = " + coll);
        boolean check;
        if(coll.equals(inputCultiNum)){
            check = true;
            System.out.println("check = " + check);
        }
        else{
            check=false;
            System.out.println("check = " + check);
        }
        if (check==true) {
            return ResponseEntity.ok("possible");
        } else {
            return ResponseEntity.ok("impossible");
        }
    }


    private boolean checkRegister(UserDto user)throws Exception{
        int rowCnt = userDao.insertUser(user);
        if(rowCnt == 1) return true;
        else return false;
    }
}
