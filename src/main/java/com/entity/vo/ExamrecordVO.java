package com.entity.vo;

import com.entity.ExamrecordEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 考试记录表
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2023-03-03 21:38:17
 */
public class ExamrecordVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 用户名
	 */
	
	private String username;
		
	/**
	 * 在线测试id（外键）
	 */
	
	private Long paperid;
		
	/**
	 * 在线测试名称
	 */
	
	private String papername;
		
	/**
	 * 试题id（外键）
	 */
	
	private Long questionid;
		
	/**
	 * 试题名称
	 */
	
	private String questionname;
		
	/**
	 * 选项，json字符串
	 */
	
	private String options;
		
	/**
	 * 分值
	 */
	
	private Long score;
		
	/**
	 * 正确答案
	 */
	
	private String answer;
		
	/**
	 * 答案解析
	 */
	
	private String analysis;
		
	/**
	 * 试题得分
	 */
	
	private Long myscore;
		
	/**
	 * 考生答案
	 */
	
	private String myanswer;
				
	
	/**
	 * 设置：用户名
	 */
	 
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * 获取：用户名
	 */
	public String getUsername() {
		return username;
	}
				
	
	/**
	 * 设置：在线测试id（外键）
	 */
	 
	public void setPaperid(Long paperid) {
		this.paperid = paperid;
	}
	
	/**
	 * 获取：在线测试id（外键）
	 */
	public Long getPaperid() {
		return paperid;
	}
				
	
	/**
	 * 设置：在线测试名称
	 */
	 
	public void setPapername(String papername) {
		this.papername = papername;
	}
	
	/**
	 * 获取：在线测试名称
	 */
	public String getPapername() {
		return papername;
	}
				
	
	/**
	 * 设置：试题id（外键）
	 */
	 
	public void setQuestionid(Long questionid) {
		this.questionid = questionid;
	}
	
	/**
	 * 获取：试题id（外键）
	 */
	public Long getQuestionid() {
		return questionid;
	}
				
	
	/**
	 * 设置：试题名称
	 */
	 
	public void setQuestionname(String questionname) {
		this.questionname = questionname;
	}
	
	/**
	 * 获取：试题名称
	 */
	public String getQuestionname() {
		return questionname;
	}
				
	
	/**
	 * 设置：选项，json字符串
	 */
	 
	public void setOptions(String options) {
		this.options = options;
	}
	
	/**
	 * 获取：选项，json字符串
	 */
	public String getOptions() {
		return options;
	}
				
	
	/**
	 * 设置：分值
	 */
	 
	public void setScore(Long score) {
		this.score = score;
	}
	
	/**
	 * 获取：分值
	 */
	public Long getScore() {
		return score;
	}
				
	
	/**
	 * 设置：正确答案
	 */
	 
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	/**
	 * 获取：正确答案
	 */
	public String getAnswer() {
		return answer;
	}
				
	
	/**
	 * 设置：答案解析
	 */
	 
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	
	/**
	 * 获取：答案解析
	 */
	public String getAnalysis() {
		return analysis;
	}
				
	
	/**
	 * 设置：试题得分
	 */
	 
	public void setMyscore(Long myscore) {
		this.myscore = myscore;
	}
	
	/**
	 * 获取：试题得分
	 */
	public Long getMyscore() {
		return myscore;
	}
				
	
	/**
	 * 设置：考生答案
	 */
	 
	public void setMyanswer(String myanswer) {
		this.myanswer = myanswer;
	}
	
	/**
	 * 获取：考生答案
	 */
	public String getMyanswer() {
		return myanswer;
	}
			
}
