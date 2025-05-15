<template>
<div>
	<div class="container" :style='{"minHeight":"100vh","alignItems":"center","background":"url(http://codegen.caihongy.cn/20221020/92b77e4678734ca09f90ba7fab2ea839.png)","display":"flex","width":"100%","backgroundSize":"100% 100%","backgroundPosition":"center center","backgroundRepeat":"no-repeat","justifyContent":"center"}'>
		<el-form ref="loginForm" :model="loginForm" :style='{"padding":"40px 20px 20px","margin":"0","borderRadius":"10px","width":"420px","position":"absolute","right":"22%","height":"auto"}' :rules="rules">
			<div v-if="false" :style='{"margin":"0 0 10px 0","color":"rgba(64, 158, 255, 1)","textAlign":"center","width":"100%","lineHeight":"44px","fontSize":"20px","textShadow":"4px 4px 2px rgba(64, 158, 255, .5)"}'>USER / LOGIN</div>
			<div v-if="true" :style='{"margin":"0 0 10px 0","color":"#5E39BA","textAlign":"center","width":"100%","lineHeight":"44px","fontSize":"20px","height":"auto"}'>基于Java的数据库课程在线教学登录</div>
			<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"80%","margin":"0 auto 10px"}' prop="username">
				<div v-if="false" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"rgba(64, 158, 255, 1)"}'>账号：</div>
				<input :style='{"border":"0px solid rgba(64, 158, 255, 1)","padding":"0 10px","borderColor":"#CDCDCD","color":"#828282","outlineOffset":"4px","borderWidth":"0 0 2px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}' v-model="loginForm.username" placeholder="请输入账户">
			</el-form-item>
			<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"80%","margin":"0 auto 10px"}' prop="password">
				<div v-if="false" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"rgba(64, 158, 255, 1)"}'>密码：</div>
				<input :style='{"border":"0px solid rgba(64, 158, 255, 1)","padding":"0 10px","borderColor":"#CDCDCD","color":"#828282","outlineOffset":"4px","borderWidth":"0 0 2px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}' v-model="loginForm.password" placeholder="请输入密码" type="password">
			</el-form-item>
			<el-form-item v-if="roles.length>1" class="list-type" :style='{"width":"100%","textAlign":"center","margin":"20px auto"}' prop="role">
				<el-radio v-model="loginForm.tableName" :label="item.tableName" v-for="(item, index) in roles" :key="index" @change.native="getCurrentRow(item)">{{item.roleName}}</el-radio>
			</el-form-item>
			<el-form-item :style='{"width":"80%","margin":"20px auto"}'>
				<el-button v-if="loginType==1" :style='{"border":"0","cursor":"pointer","padding":"0 24px","margin":"0 5px","outline":"none","color":"#fff","borderRadius":"0","background":"#5E39BA","width":"100%","fontSize":"14px","height":"44px"}' @click="submitForm('loginForm')">登录</el-button>
				<el-button v-if="loginType==1" :style='{"border":"0","cursor":"pointer","padding":"0 24px","margin":"0 5px","outline":"none","color":"#fff","borderRadius":"4px","background":"rgba(64, 158, 255, 1)","display":"none","width":"auto","fontSize":"14px","height":"44px"}' @click="resetForm('loginForm')">重置</el-button>
                <el-upload v-if="loginType==2" :action="baseUrl + 'file/upload'" :show-file-list="false" :on-success="faceLogin">
                    <el-button :style='{"border":"0","cursor":"pointer","padding":"0 24px","margin":"0 5px","outline":"none","color":"#fff","borderRadius":"0","background":"#5E39BA","width":"100%","fontSize":"14px","height":"44px"}'>人脸识别登录</el-button>
                </el-upload>
			</el-form-item>
			<div :style='{"width":"80%","margin":"20px auto","flexWrap":"wrap","justifyContent":"space-around","display":"flex"}'>
			<router-link :style='{"cursor":"pointer","padding":"2px 0","margin":"2px 5px","color":"#000000","textAlign":"center","background":"#DFCAFF","width":"30%","fontSize":"14px","textDecoration":"none","order":"1"}' :to="{path: '/register', query: {role: item.tableName,pageFlag:'register'}}" v-if="item.hasFrontRegister=='是'" v-for="(item, index) in roles" :key="index">注册{{item.roleName.replace('注册','')}}</router-link>
			</div>
		</el-form>
    </div>
</div>
</template>

<script>

export default {
	//数据集合
	data() {
		return {
            baseUrl: this.$config.baseUrl,
            loginType: 1,
			roleMenus: [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-list","buttons":["新增","查看","修改","删除"],"menu":"学生","menuJump":"列表","tableName":"xuesheng"}],"menu":"学生管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["新增","查看","修改","删除"],"menu":"教师","menuJump":"列表","tableName":"jiaoshi"}],"menu":"教师管理"},{"child":[{"appFrontIcon":"cuIcon-copy","buttons":["新增","查看","修改","删除"],"menu":"科目信息","menuJump":"列表","tableName":"kemuxinxi"}],"menu":"科目信息管理"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","删除"],"menu":"在线学习","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习管理"},{"child":[{"appFrontIcon":"cuIcon-rank","buttons":["查看","删除","学习进度"],"menu":"学生打卡","menuJump":"列表","tableName":"xueshengdaka"}],"menu":"学生打卡管理"},{"child":[{"appFrontIcon":"cuIcon-addressbook","buttons":["查看","删除"],"menu":"作业信息","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除"],"menu":"学生作业","menuJump":"列表","tableName":"xueshengzuoye"}],"menu":"学生作业管理"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看","删除","作业成绩"],"menu":"作业成绩","menuJump":"列表","tableName":"zuoyechengji"}],"menu":"作业成绩管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["删除","查看"],"menu":"知识点","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除","审核"],"menu":"咨询教师","menuJump":"列表","tableName":"zixunjiaoshi"}],"menu":"咨询教师管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看","删除","学习结果","学生成绩"],"menu":"学习结果","menuJump":"列表","tableName":"xuexijieguo"}],"menu":"学习结果管理"},{"child":[{"appFrontIcon":"cuIcon-copy","buttons":["新增","查看","修改","删除"],"menu":"在线测试管理","tableName":"exampaper"}],"menu":"在线测试管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["新增","查看","修改","删除"],"menu":"试题管理","tableName":"examquestion"}],"menu":"试题管理"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","编辑名称","编辑父级","删除"],"menu":"菜单列表","tableName":"menu"},{"appFrontIcon":"cuIcon-qrcode","buttons":["查看","修改"],"menu":"关于我们","tableName":"aboutus"},{"appFrontIcon":"cuIcon-similar","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"},{"appFrontIcon":"cuIcon-medal","buttons":["新增","查看","修改","删除"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"}],"menu":"系统管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["查看","删除"],"menu":"考试记录","tableName":"examrecord"},{"appFrontIcon":"cuIcon-link","buttons":["查看","删除"],"menu":"错题本","tableName":"examfailrecord"}],"menu":"考试管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","学生打卡","咨询教师"],"menu":"在线学习列表","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习模块"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","作业提交"],"menu":"作业信息列表","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息模块"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","咨询教师"],"menu":"知识点列表","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-rank","buttons":["查看","修改","删除"],"menu":"学生打卡","menuJump":"列表","tableName":"xueshengdaka"}],"menu":"学生打卡管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","修改","删除"],"menu":"学生作业","menuJump":"列表","tableName":"xueshengzuoye"}],"menu":"学生作业管理"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看"],"menu":"作业成绩","menuJump":"列表","tableName":"zuoyechengji"}],"menu":"作业成绩管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除"],"menu":"咨询教师","menuJump":"列表","tableName":"zixunjiaoshi"}],"menu":"咨询教师管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"menu":"学习结果","menuJump":"列表","tableName":"xuexijieguo"}],"menu":"学习结果管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","学生打卡","咨询教师"],"menu":"在线学习列表","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习模块"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","作业提交"],"menu":"作业信息列表","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息模块"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","咨询教师"],"menu":"知识点列表","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"学生","tableName":"xuesheng"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["新增","查看","修改","删除"],"menu":"在线学习","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习管理"},{"child":[{"appFrontIcon":"cuIcon-rank","buttons":["查看","删除","学习进度"],"menu":"学生打卡","menuJump":"列表","tableName":"xueshengdaka"}],"menu":"学生打卡管理"},{"child":[{"appFrontIcon":"cuIcon-addressbook","buttons":["新增","查看","修改","删除"],"menu":"作业信息","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除","批改作业"],"menu":"学生作业","menuJump":"列表","tableName":"xueshengzuoye"}],"menu":"学生作业管理"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看","修改","删除","作业成绩"],"menu":"作业成绩","menuJump":"列表","tableName":"zuoyechengji"}],"menu":"作业成绩管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["新增","查看","修改","删除"],"menu":"知识点","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","删除","审核"],"menu":"咨询教师","menuJump":"列表","tableName":"zixunjiaoshi"}],"menu":"咨询教师管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["新增","查看","修改","删除","学习结果","学生成绩"],"menu":"学习结果","menuJump":"列表","tableName":"xuexijieguo"}],"menu":"学习结果管理"},{"child":[{"appFrontIcon":"cuIcon-copy","buttons":["新增","查看","修改","删除"],"menu":"在线测试管理","tableName":"exampaper"}],"menu":"在线测试管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["新增","查看","修改","删除"],"menu":"试题管理","tableName":"examquestion"}],"menu":"试题管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["查看","删除"],"menu":"考试记录","tableName":"examrecord"},{"appFrontIcon":"cuIcon-link","buttons":["查看","删除"],"menu":"错题本","tableName":"examfailrecord"}],"menu":"考试管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","学生打卡","咨询教师"],"menu":"在线学习列表","menuJump":"列表","tableName":"zaixianxuexi"}],"menu":"在线学习模块"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","作业提交"],"menu":"作业信息列表","menuJump":"列表","tableName":"zuoyexinxi"}],"menu":"作业信息模块"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["查看","咨询教师"],"menu":"知识点列表","menuJump":"列表","tableName":"zhishidian"}],"menu":"知识点模块"}],"hasBackLogin":"是","hasBackRegister":"是","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"教师","tableName":"jiaoshi"}],
			loginForm: {
				username: '',
				password: '',
				tableName: '',
				code: '',
			},
			role: '',
            roles: [],
			rules: {
				username: [
					{ required: true, message: '请输入账户', trigger: 'blur' }
				],
				password: [
					{ required: true, message: '请输入密码', trigger: 'blur' }
				]
			},
			codes: [{
				num: 1,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 2,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 3,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 4,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}]
		}
	},
	created() {
        for(let item in this.roleMenus) {
            if(this.roleMenus[item].hasFrontLogin=='是') {
                this.roles.push(this.roleMenus[item]);
            }
        }
	},
	mounted() {
	},
    //方法集合
    methods: {
		randomString() {
			var len = 4;
			var chars = [
			  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
			  'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
			  'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
			  'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2',
			  '3', '4', '5', '6', '7', '8', '9'
			]
			var colors = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
			var sizes = ['14', '15', '16', '17', '18']
			
			var output = []
			for (var i = 0; i < len; i++) {
			  // 随机验证码
			  var key = Math.floor(Math.random() * chars.length)
			  this.codes[i].num = chars[key]
			  // 随机验证码颜色
			  var code = '#'
			  for (var j = 0; j < 6; j++) {
			    var key = Math.floor(Math.random() * colors.length)
			    code += colors[key]
			  }
			  this.codes[i].color = code
			  // 随机验证码方向
			  var rotate = Math.floor(Math.random() * 45)
			  var plus = Math.floor(Math.random() * 2)
			  if (plus == 1) rotate = '-' + rotate
			  this.codes[i].rotate = 'rotate(' + rotate + 'deg)'
			  // 随机验证码字体大小
			  var size = Math.floor(Math.random() * sizes.length)
			  this.codes[i].size = sizes[size] + 'px'
			}
		},
      getCurrentRow(row) {
        this.role = row.roleName;
      },
      submitForm(formName) {
        if (this.roles.length!=1) {
            if (!this.role) {
                this.$message.error("请选择登录用户类型");
                return false;
            }
        } else {
            this.role = this.roles[0].roleName;
            this.loginForm.tableName = this.roles[0].tableName;
        }
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.get(`${this.loginForm.tableName}/login`, {params: this.loginForm}).then(res => {
              if (res.data.code === 0) {
                localStorage.setItem('Token', res.data.token);
                localStorage.setItem('UserTableName', this.loginForm.tableName);
                localStorage.setItem('username', this.loginForm.username);
                localStorage.setItem('adminName', this.loginForm.username);
                localStorage.setItem('sessionTable', this.loginForm.tableName);
                localStorage.setItem('role', this.role);
                localStorage.setItem('keyPath', this.$config.indexNav.length+2);
                this.$router.push('/index/center');
                this.$message({
                  message: '登录成功',
                  type: 'success',
                  duration: 1500,
                });
              } else {
                this.$message.error(res.data.msg);
              }
            });
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.container {
		position: relative;
		background: url(http://codegen.caihongy.cn/20221020/92b77e4678734ca09f90ba7fab2ea839.png);
		
		.el-form-item {
		  & /deep/ .el-form-item__content {
		    width: 100%;
		  }
		}
		
		.list-item /deep/ .el-input .el-input__inner {
			border: 0px solid rgba(64, 158, 255, 1);
			padding: 0 10px;
			color: #828282;
			width: 100%;
			font-size: 14px;
			border-color: #CDCDCD;
			outline-offset: 4px;
			border-width: 0 0 2px;
			border-style: solid;
			height: 44px;
		}
		
		.list-code /deep/ .el-input .el-input__inner {
			border: 1px solid #CDCDCD;
			padding: 0 10px;
			outline: none;
			color: #828282;
			display: inline-block;
			vertical-align: middle;
			width: calc(100% - 80px);
			font-size: 14px;
			height: 44px;
		}
		
		.list-type /deep/ .el-radio__input .el-radio__inner {
			background: rgba(53, 53, 53, 0);
			border-color: #666666;
		}
		.list-type /deep/ .el-radio__input.is-checked .el-radio__inner {
			background: #5E39BA;
			border-color: #5E39BA;
		}
		.list-type /deep/ .el-radio__label {
			color: #666666;
			font-size: 14px;
		}
		.list-type /deep/ .el-radio__input.is-checked+.el-radio__label {
			color: #5E39BA;
			font-size: 14px;
		}
	}
</style>
