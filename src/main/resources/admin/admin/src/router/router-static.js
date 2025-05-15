import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
import adminexam from '@/views/modules/exampaperlist/exam'
    import news from '@/views/modules/news/list'
    import zuoyechengji from '@/views/modules/zuoyechengji/list'
    import aboutus from '@/views/modules/aboutus/list'
    import examfailrecord from '@/views/modules/examfailrecord/list'
    import xuesheng from '@/views/modules/xuesheng/list'
    import examquestion from '@/views/modules/examquestion/list'
    import kemuxinxi from '@/views/modules/kemuxinxi/list'
    import zhishidian from '@/views/modules/zhishidian/list'
    import xueshengzuoye from '@/views/modules/xueshengzuoye/list'
    import jiaoshi from '@/views/modules/jiaoshi/list'
    import xuexijieguo from '@/views/modules/xuexijieguo/list'
    import exampaper from '@/views/modules/exampaper/list'
    import menu from '@/views/modules/menu/list'
    import zuoyexinxi from '@/views/modules/zuoyexinxi/list'
    import zixunjiaoshi from '@/views/modules/zixunjiaoshi/list'
    import systemintro from '@/views/modules/systemintro/list'
    import xueshengdaka from '@/views/modules/xueshengdaka/list'
    import zaixianxuexi from '@/views/modules/zaixianxuexi/list'
    import config from '@/views/modules/config/list'
    import examrecord from '@/views/modules/examrecord/list'


//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: '系统首页',
    component: Index,
    children: [{
      // 这里不设置值，是把main作为默认页面
      path: '/',
      name: '系统首页',
      component: Home,
      meta: {icon:'', title:'center'}
    }, {
      path: '/updatePassword',
      name: '修改密码',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }, {
      path: '/pay',
      name: '支付',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: '个人信息',
      component: center,
      meta: {icon:'', title:'center'}
    }
      ,{
	path: '/news',
        name: '公告信息',
        component: news
      }
      ,{
	path: '/zuoyechengji',
        name: '作业成绩',
        component: zuoyechengji
      }
      ,{
	path: '/aboutus',
        name: '关于我们',
        component: aboutus
      }
      ,{
	path: '/examfailrecord',
        name: '错题本',
        component: examfailrecord
      }
      ,{
	path: '/xuesheng',
        name: '学生',
        component: xuesheng
      }
      ,{
	path: '/examquestion',
        name: '试题管理',
        component: examquestion
      }
      ,{
	path: '/kemuxinxi',
        name: '科目信息',
        component: kemuxinxi
      }
      ,{
	path: '/zhishidian',
        name: '知识点',
        component: zhishidian
      }
      ,{
	path: '/xueshengzuoye',
        name: '学生作业',
        component: xueshengzuoye
      }
      ,{
	path: '/jiaoshi',
        name: '教师',
        component: jiaoshi
      }
      ,{
	path: '/xuexijieguo',
        name: '学习结果',
        component: xuexijieguo
      }
      ,{
	path: '/exampaper',
        name: '在线测试管理',
        component: exampaper
      }
      ,{
	path: '/menu',
        name: '菜单列表',
        component: menu
      }
      ,{
	path: '/zuoyexinxi',
        name: '作业信息',
        component: zuoyexinxi
      }
      ,{
	path: '/zixunjiaoshi',
        name: '咨询教师',
        component: zixunjiaoshi
      }
      ,{
	path: '/systemintro',
        name: '系统简介',
        component: systemintro
      }
      ,{
	path: '/xueshengdaka',
        name: '学生打卡',
        component: xueshengdaka
      }
      ,{
	path: '/zaixianxuexi',
        name: '在线学习',
        component: zaixianxuexi
      }
      ,{
	path: '/config',
        name: '轮播图管理',
        component: config
      }
      ,{
	path: '/examrecord',
        name: '考试记录',
        component: examrecord
      }
    ]
  },
  {
    path: '/adminexam',
    name: 'adminexam',
    component: adminexam,
    meta: {icon:'', title:'adminexam'}
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '/',
    name: '系统首页',
    redirect: '/index'
  }, /*默认跳转路由*/
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}
export default router;
