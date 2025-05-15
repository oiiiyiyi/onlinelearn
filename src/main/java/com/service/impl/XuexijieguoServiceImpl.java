package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.XuexijieguoDao;
import com.entity.XuexijieguoEntity;
import com.service.XuexijieguoService;
import com.entity.vo.XuexijieguoVO;
import com.entity.view.XuexijieguoView;

@Service("xuexijieguoService")
public class XuexijieguoServiceImpl extends ServiceImpl<XuexijieguoDao, XuexijieguoEntity> implements XuexijieguoService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<XuexijieguoEntity> page = this.selectPage(
                new Query<XuexijieguoEntity>(params).getPage(),
                new EntityWrapper<XuexijieguoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<XuexijieguoEntity> wrapper) {
		  Page<XuexijieguoView> page =new Query<XuexijieguoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<XuexijieguoVO> selectListVO(Wrapper<XuexijieguoEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public XuexijieguoVO selectVO(Wrapper<XuexijieguoEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<XuexijieguoView> selectListView(Wrapper<XuexijieguoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public XuexijieguoView selectView(Wrapper<XuexijieguoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<XuexijieguoEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<XuexijieguoEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<XuexijieguoEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }




}
