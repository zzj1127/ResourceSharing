package com.zzj.course.service;

import com.zzj.course.model.Comment;

import java.util.List;

public interface CommentService {
  public void addComment(Comment comment);


    public List<Comment>  findCommendById(String reid);
}
