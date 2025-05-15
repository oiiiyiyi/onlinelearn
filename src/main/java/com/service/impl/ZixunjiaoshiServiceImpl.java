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


import com.dao.ZixunjiaoshiDao;
import com.entity.ZixunjiaoshiEntity;
import com.service.ZixunjiaoshiService;
import com.entity.vo.ZixunjiaoshiVO;
import com.entity.view.ZixunjiaoshiView;

@Service("zixunjiaoshiService")
public class ZixunjiaoshiServiceImpl extends ServiceImpl<ZixunjiaoshiDao, ZixunjiaoshiEntity> implements ZixunjiaoshiService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ZixunjiaoshiEntity> page = this.selectPage(
                new Query<ZixunjiaoshiEntity>(params).getPage(),
                new EntityWrapper<ZixunjiaoshiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ZixunjiaoshiEntity> wrapper) {
		  Page<ZixunjiaoshiView> page =new Query<ZixunjiaoshiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ZixunjiaoshiVO> selectListVO(Wrapper<ZixunjiaoshiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ZixunjiaoshiVO selectVO(Wrapper<ZixunjiaoshiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ZixunjiaoshiView> selectListView(Wrapper<ZixunjiaoshiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ZixunjiaoshiView selectView(Wrapper<ZixunjiaoshiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
