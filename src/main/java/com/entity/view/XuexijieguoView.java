package com.entity.view;

import com.entity.XuexijieguoEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 学习结果
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
@TableName("xuexijieguo")
public class XuexijieguoView  extends XuexijieguoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XuexijieguoView(){
	}
 
 	public XuexijieguoView(XuexijieguoEntity xuexijieguoEntity){
 	try {
			BeanUtils.copyProperties(this, xuexijieguoEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
