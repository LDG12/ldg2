package com.person456.ldg.controller;

import com.person456.ldg.domain.BoardDto;
import com.person456.ldg.domain.PageHandler;
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
        System.out.println("(page-1)*pageSize = " + (page - 1) * pageSize);
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
