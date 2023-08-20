package com.person456.ldg.controller;

import com.person456.ldg.domain.BoardDto;
import com.person456.ldg.domain.PageHandler;
import com.person456.ldg.domain.SearchPage;
import com.person456.ldg.service.BoardService;
import com.sun.mail.imap.Rights;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;
    @GetMapping("/list")
    public String boardList(SearchPage sp, Model m, HttpServletRequest request)throws Exception{
        if(!loginCheck(request)){
            return "redirect:/login/login?toURL="+request.getRequestURL();
        }
        //sp page=1 pageSize=10 option=a keyword=m 으로 생성
        if(sp.getPage()==null) sp.setPage(1);
        if(sp.getPageSize()==null) sp.setPageSize(10);
        int totalCnt = boardService.searchPageCnt(sp);
        PageHandler ph = new PageHandler(totalCnt, sp);
        Map map = new HashMap();
        map.put("offset", (sp.getPage()-1)*sp.getPageSize());
        map.put("pageSize", sp.getPageSize());
        List<BoardDto> list = boardService.searchPage(sp);
        m.addAttribute("List", list);
        m.addAttribute("ph", ph);
        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        m.addAttribute("startOfToday", startOfToday);
        return "boardList";
    }
    @GetMapping("/read")
    public String boardRead(Integer bno, HttpServletRequest request, Model m)throws Exception{
        HttpSession session = request.getSession();
        boolean commentOpen;
        if(session.getAttribute("commentOpen") == null){
            commentOpen = false;
        }
        else{
            commentOpen = (boolean)session.getAttribute("commentOpen");
        }
        if(commentOpen) session.setAttribute("commentOpen", true);
        else session.setAttribute("commentOpen", false);
        System.out.println("session.getAttribute(\"commentOpen\") = " + session.getAttribute("commentOpen"));
        BoardDto boardDto = boardService.getOneBoard(bno);
        boardService.increaseViewCnt(boardDto);
        m.addAttribute("boardDto", boardDto);
        m.addAttribute("mode", "");
        return "board";
    }
    @PostMapping("/remove")
    public String boardRemove(Integer bno, HttpSession session, Model m, RedirectAttributes rttr){
        String writer = (String)session.getAttribute("id");
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        try {
            int rowCnt = boardService.remove(map);
            if(rowCnt!=1){
                throw new Exception("Remove Fail");
            }
            rttr.addFlashAttribute("msg", "REMOVE OK");
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "REMOVE ERROR");
        }
        return "redirect:/board/list";
    }
    @PostMapping("/modify")
    public String boardModify(Integer bno, BoardDto boardDto, Model m, HttpSession session, RedirectAttributes rttr){
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);
        System.out.println("boardDto.getTitle() = " + boardDto.getTitle());
        System.out.println("boardDto.getContent() = " + boardDto.getContent());
        try {
            int rowCnt = boardService.update(boardDto);
            if(rowCnt!=1){
                throw new Exception("MODIFY ERROR");
            }
            rttr.addFlashAttribute("msg", "MODIFY OK");
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "MODIFY ERROR");
        }
        return "redirect:/board/read?bno="+bno;
    }
    @GetMapping("/write")
    public String boardWrite(Model m){
        String mode = "new";
        m.addAttribute("mode", mode);
        return "board";
    }
    @PostMapping("/write")
    public String boardWritePost(BoardDto boardDto, HttpSession session, Model m, RedirectAttributes rttr){
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);
        System.out.println("boardDto.getTitle() = " + boardDto.getTitle());
        System.out.println("boardDto.getContent() = " + boardDto.getContent());
        try {
            int rowCnt = boardService.write(boardDto);
            if(rowCnt!=1){
                throw new Exception("Write Fail");
            }
            rttr.addFlashAttribute("msg", "WRITE OK");
            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "WRITE ERROR");
            return "board";
        }
    }
    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }

}
