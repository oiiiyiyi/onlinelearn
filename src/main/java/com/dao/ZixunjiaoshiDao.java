package com.dao;

import com.entity.ZixunjiaoshiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ZixunjiaoshiVO;
import com.entity.view.ZixunjiaoshiView;


/**
 * 咨询教师
 * 
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
public interface ZixunjiaoshiDao extends BaseMapper<ZixunjiaoshiEntity> {
	
	List<ZixunjiaoshiVO> selectListVO(@Param("ew") Wrapper<ZixunjiaoshiEntity> wrapper);
	
	ZixunjiaoshiVO selectVO(@Param("ew") Wrapper<ZixunjiaoshiEntity> wrapper);
	
	List<ZixunjiaoshiView> selectListView(@Param("ew") Wrapper<ZixunjiaoshiEntity> wrapper);

	List<ZixunjiaoshiView> selectListView(Pagination page,@Param("ew") Wrapper<ZixunjiaoshiEntity> wrapper);
	
	ZixunjiaoshiView selectView(@Param("ew") Wrapper<ZixunjiaoshiEntity> wrapper);
	

}
