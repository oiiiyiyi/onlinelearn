export function isAuth(tableName, key) {
  let role = localStorage.getItem("UserTableName");
  let menus = [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-list","buttons":["新增","查看","修改","删除"],"menu":"学生","menuJump":"列表","tableName":"xuesheng"}],"menu":"学生管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["新增","查看","修改","删除"],"menu":"教师","menuJump":"列表","tableName":"jiaoshi"}],"menu":"教师管理"},{"child":[{"appFrontIcon":"cuIcon-copy","buttons":["新增","查看","修改","删除"],"menu":"科目信息","menuJump":"列表","tableName":"kemuxinxi"}],"menu":"科目信息管理"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","删除"],"menu":"在线学习","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习管理"},{"child":[{"appFrontIcon":"cuIcon-rank","buttons":["查看","删除","学习进度"],"menu":"学生打卡","menuJump":"列表","tableName":"xueshengdaka"}],"menu":"学生打卡管理"},{"child":[{"appFrontIcon":"cuIcon-addressbook","buttons":["查看","删除"],"menu":"作业信息","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除"],"menu":"学生作业","menuJump":"列表","tableName":"xueshengzuoye"}],"menu":"学生作业管理"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看","删除","作业成绩"],"menu":"作业成绩","menuJump":"列表","tableName":"zuoyechengji"}],"menu":"作业成绩管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["删除","查看"],"menu":"知识点","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除","审核"],"menu":"咨询教师","menuJump":"列表","tableName":"zixunjiaoshi"}],"menu":"咨询教师管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看","删除","学习结果","学生成绩"],"menu":"学习结果","menuJump":"列表","tableName":"xuexijieguo"}],"menu":"学习结果管理"},{"child":[{"appFrontIcon":"cuIcon-copy","buttons":["新增","查看","修改","删除"],"menu":"在线测试管理","tableName":"exampaper"}],"menu":"在线测试管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["新增","查看","修改","删除"],"menu":"试题管理","tableName":"examquestion"}],"menu":"试题管理"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","编辑名称","编辑父级","删除"],"menu":"菜单列表","tableName":"menu"},{"appFrontIcon":"cuIcon-qrcode","buttons":["查看","修改"],"menu":"关于我们","tableName":"aboutus"},{"appFrontIcon":"cuIcon-similar","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"},{"appFrontIcon":"cuIcon-medal","buttons":["新增","查看","修改","删除"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"}],"menu":"系统管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["查看","删除"],"menu":"考试记录","tableName":"examrecord"},{"appFrontIcon":"cuIcon-link","buttons":["查看","删除"],"menu":"错题本","tableName":"examfailrecord"}],"menu":"考试管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","学生打卡","咨询教师"],"menu":"在线学习列表","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习模块"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","作业提交"],"menu":"作业信息列表","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息模块"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","咨询教师"],"menu":"知识点列表","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-rank","buttons":["查看","修改","删除"],"menu":"学生打卡","menuJump":"列表","tableName":"xueshengdaka"}],"menu":"学生打卡管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","修改","删除"],"menu":"学生作业","menuJump":"列表","tableName":"xueshengzuoye"}],"menu":"学生作业管理"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看"],"menu":"作业成绩","menuJump":"列表","tableName":"zuoyechengji"}],"menu":"作业成绩管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除"],"menu":"咨询教师","menuJump":"列表","tableName":"zixunjiaoshi"}],"menu":"咨询教师管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"menu":"学习结果","menuJump":"列表","tableName":"xuexijieguo"}],"menu":"学习结果管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","学生打卡","咨询教师"],"menu":"在线学习列表","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习模块"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","作业提交"],"menu":"作业信息列表","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息模块"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","咨询教师"],"menu":"知识点列表","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"学生","tableName":"xuesheng"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["新增","查看","修改","删除"],"menu":"在线学习","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习管理"},{"child":[{"appFrontIcon":"cuIcon-rank","buttons":["查看","删除","学习进度"],"menu":"学生打卡","menuJump":"列表","tableName":"xueshengdaka"}],"menu":"学生打卡管理"},{"child":[{"appFrontIcon":"cuIcon-addressbook","buttons":["新增","查看","修改","删除"],"menu":"作业信息","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除","批改作业"],"menu":"学生作业","menuJump":"列表","tableName":"xueshengzuoye"}],"menu":"学生作业管理"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看","修改","删除","作业成绩"],"menu":"作业成绩","menuJump":"列表","tableName":"zuoyechengji"}],"menu":"作业成绩管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["新增","查看","修改","删除"],"menu":"知识点","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除","审核"],"menu":"咨询教师","menuJump":"列表","tableName":"zixunjiaoshi"}],"menu":"咨询教师管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["新增","查看","修改","删除","学习结果","学生成绩"],"menu":"学习结果","menuJump":"列表","tableName":"xuexijieguo"}],"menu":"学习结果管理"},{"child":[{"appFrontIcon":"cuIcon-copy","buttons":["新增","查看","修改","删除"],"menu":"在线测试管理","tableName":"exampaper"}],"menu":"在线测试管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["新增","查看","修改","删除"],"menu":"试题管理","tableName":"examquestion"}],"menu":"试题管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["查看","删除"],"menu":"考试记录","tableName":"examrecord"},{"appFrontIcon":"cuIcon-link","buttons":["查看","删除"],"menu":"错题本","tableName":"examfailrecord"}],"menu":"考试管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","学生打卡","咨询教师"],"menu":"在线学习列表","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习模块"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","作业提交"],"menu":"作业信息列表","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息模块"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","咨询教师"],"menu":"知识点列表","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点模块"}],"hasBackLogin":"是","hasBackRegister":"是","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"教师","tableName":"jiaoshi"}];
  for(let i=0;i<menus.length;i++){
    if(menus[i].tableName==role){
      for(let j=0;j<menus[i].frontMenu.length;j++){
          for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
            if(tableName==menus[i].frontMenu[j].child[k].tableName){
              let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
              return buttons.indexOf(key) !== -1 || false
            }
          }
      }
    }
  }
  return false;
}

/**
 *  * 获取当前时间（yyyy-MM-dd hh:mm:ss）
 *   */
export function getCurDateTime() {
    let currentTime = new Date(),
    year = currentTime.getFullYear(),
    month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1,
    day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate(),
    hour = currentTime.getHours(),
    minute = currentTime.getMinutes(),
    second = currentTime.getSeconds();
    return year + "-" + month + "-" + day + " " +hour +":" +minute+":"+second;
}

/**
 *  * 获取当前日期（yyyy-MM-dd）
 *   */
export function getCurDate() {
    let currentTime = new Date(),
    year = currentTime.getFullYear(),
    month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1,
    day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate();
    return year + "-" + month + "-" + day;
}
