package com.dao;

import com.entity.XuexijieguoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XuexijieguoVO;
import com.entity.view.XuexijieguoView;


/**
 * 学习结果
 * 
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
public interface XuexijieguoDao extends BaseMapper<XuexijieguoEntity> {
	
	List<XuexijieguoVO> selectListVO(@Param("ew") Wrapper<XuexijieguoEntity> wrapper);
	
	XuexijieguoVO selectVO(@Param("ew") Wrapper<XuexijieguoEntity> wrapper);
	
	List<XuexijieguoView> selectListView(@Param("ew") Wrapper<XuexijieguoEntity> wrapper);

	List<XuexijieguoView> selectListView(Pagination page,@Param("ew") Wrapper<XuexijieguoEntity> wrapper);
	
	XuexijieguoView selectView(@Param("ew") Wrapper<XuexijieguoEntity> wrapper);
	

    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<XuexijieguoEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<XuexijieguoEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<XuexijieguoEntity> wrapper);



}
