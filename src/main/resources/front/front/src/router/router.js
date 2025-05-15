import VueRouter from 'vue-router'

//引入组件
import Index from '../pages'
import Home from '../pages/home/home'
import Login from '../pages/login/login'
import Register from '../pages/register/register'
import Center from '../pages/center/center'
import ExamPaper from '../pages/exam/examPaper'
import Exam from '../pages/exam/exam'
import ExamList from '../pages/exam/examList'
import ExamRecord from '../pages/exam/examRecord'
import Storeup from '../pages/storeup/list'
import News from '../pages/news/news-list'
import NewsDetail from '../pages/news/news-detail'
import xueshengList from '../pages/xuesheng/list'
import xueshengDetail from '../pages/xuesheng/detail'
import xueshengAdd from '../pages/xuesheng/add'
import jiaoshiList from '../pages/jiaoshi/list'
import jiaoshiDetail from '../pages/jiaoshi/detail'
import jiaoshiAdd from '../pages/jiaoshi/add'
import kemuxinxiList from '../pages/kemuxinxi/list'
import kemuxinxiDetail from '../pages/kemuxinxi/detail'
import kemuxinxiAdd from '../pages/kemuxinxi/add'
import zaixianxuexiList from '../pages/zaixianxuexi/list'
import zaixianxuexiDetail from '../pages/zaixianxuexi/detail'
import zaixianxuexiAdd from '../pages/zaixianxuexi/add'
import xueshengdakaList from '../pages/xueshengdaka/list'
import xueshengdakaDetail from '../pages/xueshengdaka/detail'
import xueshengdakaAdd from '../pages/xueshengdaka/add'
import zuoyexinxiList from '../pages/zuoyexinxi/list'
import zuoyexinxiDetail from '../pages/zuoyexinxi/detail'
import zuoyexinxiAdd from '../pages/zuoyexinxi/add'
import xueshengzuoyeList from '../pages/xueshengzuoye/list'
import xueshengzuoyeDetail from '../pages/xueshengzuoye/detail'
import xueshengzuoyeAdd from '../pages/xueshengzuoye/add'
import zuoyechengjiList from '../pages/zuoyechengji/list'
import zuoyechengjiDetail from '../pages/zuoyechengji/detail'
import zuoyechengjiAdd from '../pages/zuoyechengji/add'
import zhishidianList from '../pages/zhishidian/list'
import zhishidianDetail from '../pages/zhishidian/detail'
import zhishidianAdd from '../pages/zhishidian/add'
import zixunjiaoshiList from '../pages/zixunjiaoshi/list'
import zixunjiaoshiDetail from '../pages/zixunjiaoshi/detail'
import zixunjiaoshiAdd from '../pages/zixunjiaoshi/add'
import xuexijieguoList from '../pages/xuexijieguo/list'
import xuexijieguoDetail from '../pages/xuexijieguo/detail'
import xuexijieguoAdd from '../pages/xuexijieguo/add'
import menuList from '../pages/menu/list'
import menuDetail from '../pages/menu/detail'
import menuAdd from '../pages/menu/add'

const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}

//配置路由
export default new VueRouter({
	routes:[
		{
      path: '/',
      redirect: '/index/home'
    },
		{
			path: '/index',
			component: Index,
			children:[
				{
					path: 'home',
					component: Home
				},
				{
					path: 'center',
					component: Center,
				},
				{
					path: 'examPaper',
					component: ExamPaper
				},
				{
					path: 'examList',
					component:ExamList
				},
				{
					path: 'examRecord/:type',
					component:ExamRecord
				},
				{
					path: 'storeup',
					component: Storeup
				},
				{
					path: 'news',
					component: News
				},
				{
					path: 'newsDetail',
					component: NewsDetail
				},
				{
					path: 'xuesheng',
					component: xueshengList
				},
				{
					path: 'xueshengDetail',
					component: xueshengDetail
				},
				{
					path: 'xueshengAdd',
					component: xueshengAdd
				},
				{
					path: 'jiaoshi',
					component: jiaoshiList
				},
				{
					path: 'jiaoshiDetail',
					component: jiaoshiDetail
				},
				{
					path: 'jiaoshiAdd',
					component: jiaoshiAdd
				},
				{
					path: 'kemuxinxi',
					component: kemuxinxiList
				},
				{
					path: 'kemuxinxiDetail',
					component: kemuxinxiDetail
				},
				{
					path: 'kemuxinxiAdd',
					component: kemuxinxiAdd
				},
				{
					path: 'zaixianxuexi',
					component: zaixianxuexiList
				},
				{
					path: 'zaixianxuexiDetail',
					component: zaixianxuexiDetail
				},
				{
					path: 'zaixianxuexiAdd',
					component: zaixianxuexiAdd
				},
				{
					path: 'xueshengdaka',
					component: xueshengdakaList
				},
				{
					path: 'xueshengdakaDetail',
					component: xueshengdakaDetail
				},
				{
					path: 'xueshengdakaAdd',
					component: xueshengdakaAdd
				},
				{
					path: 'zuoyexinxi',
					component: zuoyexinxiList
				},
				{
					path: 'zuoyexinxiDetail',
					component: zuoyexinxiDetail
				},
				{
					path: 'zuoyexinxiAdd',
					component: zuoyexinxiAdd
				},
				{
					path: 'xueshengzuoye',
					component: xueshengzuoyeList
				},
				{
					path: 'xueshengzuoyeDetail',
					component: xueshengzuoyeDetail
				},
				{
					path: 'xueshengzuoyeAdd',
					component: xueshengzuoyeAdd
				},
				{
					path: 'zuoyechengji',
					component: zuoyechengjiList
				},
				{
					path: 'zuoyechengjiDetail',
					component: zuoyechengjiDetail
				},
				{
					path: 'zuoyechengjiAdd',
					component: zuoyechengjiAdd
				},
				{
					path: 'zhishidian',
					component: zhishidianList
				},
				{
					path: 'zhishidianDetail',
					component: zhishidianDetail
				},
				{
					path: 'zhishidianAdd',
					component: zhishidianAdd
				},
				{
					path: 'zixunjiaoshi',
					component: zixunjiaoshiList
				},
				{
					path: 'zixunjiaoshiDetail',
					component: zixunjiaoshiDetail
				},
				{
					path: 'zixunjiaoshiAdd',
					component: zixunjiaoshiAdd
				},
				{
					path: 'xuexijieguo',
					component: xuexijieguoList
				},
				{
					path: 'xuexijieguoDetail',
					component: xuexijieguoDetail
				},
				{
					path: 'xuexijieguoAdd',
					component: xuexijieguoAdd
				},
				{
					path: 'menu',
					component: menuList
				},
				{
					path: 'menuDetail',
					component: menuDetail
				},
				{
					path: 'menuAdd',
					component: menuAdd
				},
			]
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/register',
			component: Register
		},
		{
			path: '/exam',
			component: Exam
		}
	]
})
