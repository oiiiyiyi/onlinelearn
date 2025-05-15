package com.entity.view;

import com.entity.ZixunjiaoshiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 咨询教师
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
@TableName("zixunjiaoshi")
public class ZixunjiaoshiView  extends ZixunjiaoshiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ZixunjiaoshiView(){
	}
 
 	public ZixunjiaoshiView(ZixunjiaoshiEntity zixunjiaoshiEntity){
 	try {
			BeanUtils.copyProperties(this, zixunjiaoshiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
