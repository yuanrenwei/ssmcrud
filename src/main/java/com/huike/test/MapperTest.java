package com.huike.test;

import com.huike.bean.Department;
import com.huike.bean.Employee;
import com.huike.dao.DepartmentMapper;
import com.huike.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/*
 * 测试dao层的工作
 * 举荐Spinrg的项目就可以使用Spring的单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
/**
 * ContextConfiguration自动为我们创建Spring容器
 */
public class MapperTest {
//    @Autowired
//    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void testCrud(){
       /* 1.创建springIOC
            ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
          2.从容器中获取mapper
            DepartmentMapper bean =ioc.getBean(DepartmentMapper.class);
       */
       /*   System.out.println(departmentMapper);

          //有选择的插入
            departmentMapper.insertSelective(new Department(null,"研发部"));
            departmentMapper.insertSelective(new Department(null,"采集部"));
       */

        //3.有选择性的插入
       // employeeMapper.insertSelective(new Employee(null,"Jerry","M","1172016748@qq.com",1));
        //4.批量插入多名员工，使用可以批量操作的SqlSession
      /*  for (){
            employeeMapper.insertSelective(new Employee(null,"Jerry","M","1172016748@qq.com",1));
        }
       */
      EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
      for(int i=0;i<10;i++){
          String uid=UUID.randomUUID().toString().substring(0,5)+i;
          if(i%2==1){
              System.out.println("执行");
              employeeMapper.insertSelective(new Employee(null,uid,"W",uid+"@qq.com",1));
          }
          else{
              employeeMapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",2));
          }

      }
    }
}
