package com.zzj.course.service.impl;

import com.zzj.course.dao.CommentMapper;
import com.zzj.course.model.Comment;
import com.zzj.course.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;
    @Override
    public void addComment(Comment comment){
        commentMapper.addComment(comment);
    }
    @Override
    public List<Comment> findCommendById(String reid){
       return commentMapper.findCommendById(reid);
    }
}
