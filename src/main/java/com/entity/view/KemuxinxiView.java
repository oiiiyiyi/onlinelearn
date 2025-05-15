package com.entity.view;

import com.entity.KemuxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 科目信息
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
@TableName("kemuxinxi")
public class KemuxinxiView  extends KemuxinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public KemuxinxiView(){
	}
 
 	public KemuxinxiView(KemuxinxiEntity kemuxinxiEntity){
 	try {
			BeanUtils.copyProperties(this, kemuxinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
