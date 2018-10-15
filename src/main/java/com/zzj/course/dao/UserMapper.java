package com.zzj.course.dao;
import com.zzj.course.model.User;


public interface UserMapper {
    //通过username查询
    public User userLogin(User user);
    //注册
    public void register(User user);
    //查重
    public User  findUserByName(String username);
   //查找个人信息
    public User userSelectById(String userId);
//修改信息
   public void changeInformation(User user);

   public void resetpassword(User user);
}
