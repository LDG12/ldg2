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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        try {
            int rowCnt = commentService.insertComment(commentDto);
            if(rowCnt!=1){
                throw new Exception("COMMENT_ADD_ERROR");
            }
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

    @PostMapping("/remove")
    public String commentRemove(CommentDto commentDto, Integer cno, Integer bno, HttpServletRequest request, Model m){
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("id");
        Map map = new HashMap();
        map.put("cno", cno);
        map.put("commenter", userId);
        System.out.println("cno = " + cno);
        System.out.println("userId = " + userId);
        System.out.println("bno = " + bno);
        try {
            if(commentDto.getComment().equals(userId)){
                int rowCnt = commentService.delete(map);
                if(rowCnt != 1){
                    throw new Exception("COMMENT_REMOVE_ERROR");
                }
                return "redirect:/board/read?bno="+bno;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }
        return "redirect:/";
    }
}
