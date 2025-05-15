package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XueshengdakaEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XueshengdakaVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XueshengdakaView;


/**
 * 学生打卡
 *
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
public interface XueshengdakaService extends IService<XueshengdakaEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XueshengdakaVO> selectListVO(Wrapper<XueshengdakaEntity> wrapper);
   	
   	XueshengdakaVO selectVO(@Param("ew") Wrapper<XueshengdakaEntity> wrapper);
   	
   	List<XueshengdakaView> selectListView(Wrapper<XueshengdakaEntity> wrapper);
   	
   	XueshengdakaView selectView(@Param("ew") Wrapper<XueshengdakaEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XueshengdakaEntity> wrapper);
   	

    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<XueshengdakaEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<XueshengdakaEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<XueshengdakaEntity> wrapper);



}

