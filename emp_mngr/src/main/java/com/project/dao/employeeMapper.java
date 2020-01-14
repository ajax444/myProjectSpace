package com.project.dao;

import com.project.bean.employee;
import com.project.bean.employeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface employeeMapper {
    long countByExample(employeeExample example);

    int deleteByExample(employeeExample example);

    int deleteByPrimaryKey(Integer empId);
    
    List<employee> selectAll();

    int insert(employee record);

    int insertSelective(employee record);

    List<employee> selectByExample(employeeExample example);

    employee selectByPrimaryKey(Integer empId);

    int updateByExampleSelective(@Param("record") employee record, @Param("example") employeeExample example);

    int updateByExample(@Param("record") employee record, @Param("example") employeeExample example);

    int updateByPrimaryKeySelective(employee record);

    int updateByPrimaryKey(employee record);
    
}