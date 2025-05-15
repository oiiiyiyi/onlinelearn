package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ZixunjiaoshiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ZixunjiaoshiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ZixunjiaoshiView;


/**
 * 咨询教师
 *
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
public interface ZixunjiaoshiService extends IService<ZixunjiaoshiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ZixunjiaoshiVO> selectListVO(Wrapper<ZixunjiaoshiEntity> wrapper);
   	
   	ZixunjiaoshiVO selectVO(@Param("ew") Wrapper<ZixunjiaoshiEntity> wrapper);
   	
   	List<ZixunjiaoshiView> selectListView(Wrapper<ZixunjiaoshiEntity> wrapper);
   	
   	ZixunjiaoshiView selectView(@Param("ew") Wrapper<ZixunjiaoshiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ZixunjiaoshiEntity> wrapper);
   	

}

