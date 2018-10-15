package com.zzj.course.service.impl;

import com.zzj.course.dao.InformMapper;
import com.zzj.course.model.Inform;
import com.zzj.course.service.InformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class InformServiceImpl implements InformService {
    @Autowired
    InformMapper informMapper;
    @Override
    public List<Inform> selectAllInform(){
        return informMapper.selectAllInform();
    }
    @Override
    public List<Inform> findAllInformPh(int infid){
        return informMapper.findAllInformPh(infid);
    }
    @Override
    public List<Inform> selectInformByosition(){
        return informMapper.selectInformByosition();
    }
    @Override
    public List<Inform> selectInformByStates(){
        return  informMapper.selectInformByStates();
    }
}
