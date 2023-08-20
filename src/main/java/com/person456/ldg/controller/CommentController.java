package com.person456.ldg.controller;

import com.person456.ldg.domain.BoardDto;
import com.person456.ldg.domain.CommentDto;
import com.person456.ldg.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentService commentService;

    @PostMapping("/add")
    public String commentAdd(CommentDto commentDto, Integer bno, String page, String pageSize, HttpServletRequest request, Model m){
        String url = "/board/read?bno="+bno+"&page="+page+"&pageSize="+pageSize;
        HttpSession session = request.getSession();
        String writer = (String)session.getAttribute("id");
        commentDto.setCommenter(writer);
        commentDto.setBno(bno);
        boolean commentOpen = (boolean)session.getAttribute("commentOpen");
        System.out.println("commentOpen = " + commentOpen);
        try {
            int rowCnt = commentService.insertComment(commentDto);
            if(rowCnt!=1){
                throw new Exception("COMMENT_ADD_ERROR");
            }
            if(commentOpen) session.setAttribute("commentOpen", true);
            else session.setAttribute("commentOpen", false);
            m.addAttribute("msg", "COMMENT_ADD_OK");
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "COMMENT_ADD_ERROR");
        }
        return "redirect:"+url;
    }

    @GetMapping("/read")
    public String commentRead(Integer bno, String page, String pageSize, HttpServletRequest request, Model m){
        String url = "/board/read?bno="+bno+"&page="+page+"&pageSize="+pageSize;
        try {
            int count = commentService.getCount(bno);
            m.addAttribute("count", count);
            List<CommentDto> list = commentService.selectComment(bno);
            m.addAttribute("commentList", list);
            HttpSession session = request.getSession();
            session.setAttribute("commentOpen", true);
            return "forward:"+url;
        } catch (Exception e) {
            e.printStackTrace();
            return "forward:"+url;
        }
    }
}
