package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XuexijieguoEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XuexijieguoVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XuexijieguoView;


/**
 * 学习结果
 *
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
public interface XuexijieguoService extends IService<XuexijieguoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XuexijieguoVO> selectListVO(Wrapper<XuexijieguoEntity> wrapper);
   	
   	XuexijieguoVO selectVO(@Param("ew") Wrapper<XuexijieguoEntity> wrapper);
   	
   	List<XuexijieguoView> selectListView(Wrapper<XuexijieguoEntity> wrapper);
   	
   	XuexijieguoView selectView(@Param("ew") Wrapper<XuexijieguoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XuexijieguoEntity> wrapper);
   	

    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<XuexijieguoEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<XuexijieguoEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<XuexijieguoEntity> wrapper);



}

