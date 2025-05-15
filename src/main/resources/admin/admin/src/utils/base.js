const base = {
    get() {
        return {
            url : "http://localhost:8080/springboot70teu/",
            name: "springboot70teu",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/springboot70teu/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "基于Java的数据库课程在线教学"
        } 
    }
}
export default base
