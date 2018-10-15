package com.zzj.course.dao;

import com.zzj.course.model.Comment;

import java.util.List;

public interface CommentMapper {

    public void addComment(Comment comment);

    public List<Comment> findCommendById(String reid);
}
