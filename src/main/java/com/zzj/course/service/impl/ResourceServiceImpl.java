package com.zzj.course.service.impl;

import com.zzj.course.dao.ResourceMapper;
import com.zzj.course.model.Resources;
import com.zzj.course.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    ResourceMapper resourceMapper;

    @Override
    public List<Resources> findAllResource() {
        return resourceMapper.findAllResource();
    }

    @Override
    public Resources findResourceById(String reid) {
        return resourceMapper.findResourceById(reid);
    }

    @Override
    public List<Resources> selectTonById(String typeofnameid) {

        return resourceMapper.selectTonById(typeofnameid);
    }

    @Override
    public List<Resources> selectTypeId(String typeid) {
        return resourceMapper.selectTypeId(typeid);
    }

    @Override
    public void addResource(Resources resources) {
        resourceMapper.addResource(resources);
    }
    @Override
    public  List<Resources> findAllResourceBySeacher(String seacher){
        return resourceMapper.findAllResourceBySeacher(seacher);
    }
    @Override
    public List<Resources> findResourcesByUseridPh(String userid){
        return resourceMapper.findResourcesByUseridPh(userid);
    }
}