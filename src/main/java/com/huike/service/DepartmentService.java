package com.huike.service;

import com.huike.bean.Department;
import com.huike.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
        List<Department> list=departmentMapper.selectByExample(null);
        return list;
    }

}
