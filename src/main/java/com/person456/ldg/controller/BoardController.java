package com.person456.ldg.controller;

import com.person456.ldg.domain.BoardDto;
import com.person456.ldg.domain.PageHandler;
import com.person456.ldg.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;
    @GetMapping("/list")
    public String boardList(Integer page, Integer pageSize, Model m, HttpServletRequest request)throws Exception{
        if(!loginCheck(request)){
            return "redirect:/login/login?toURL="+request.getRequestURL();
        }
        if(page==null) page=1;
        if(pageSize==null) pageSize=10;
        int totalCnt = boardService.getCount();
        PageHandler ph = new PageHandler(totalCnt, page, pageSize);
        System.out.println("page = " + page);
        System.out.println("pageSize = " + pageSize);
        System.out.println("totalCnt = " + totalCnt);
        System.out.println("ph.getBeginPage() = " + ph.getBeginPage());
        System.out.println("ph.getEndPage() = " + ph.getEndPage());
        Map map = new HashMap();
        map.put("offset", (page-1)*pageSize);
        map.put("pageSize", pageSize);
        List<BoardDto> list = boardService.getAllBoard(map);
        m.addAttribute("List", list);
        m.addAttribute("ph", ph);
        return "boardList";
    }
    @GetMapping("/read")
    public String boardRead(Integer bno, Model m)throws Exception{
        BoardDto boardDto = boardService.getOneBoard(bno);
        m.addAttribute("boardDto", boardDto);
        m.addAttribute("mode", "");
        return "board";
    }

    @GetMapping("/write")
    public String boardWrite(Model m){
        String mode = "new";
        m.addAttribute("mode", mode);
        return "board";
    }
    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }

}
