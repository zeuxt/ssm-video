
var app = new Vue({
    el: '#app',
    data: {
        id: 1,
        name: 'Web前端',
        chapters: [{
            "id": 1,
            "name": "HTML5概述",
            "abstract": "H5广泛而深入地吸收了移动互联网时代的技术精髓，再加上其自身跨平台、免安装、更新快的技术优势，自2014年底发布以来，已经逐渐成为现代互联网和移动互联网开发的核心技术，逐渐发展成为各行各业 进入互联网+的首选开发技术。",
            "sections": [
                {
                    "id": 1,
                    "image": "img/spslt.jpg",
                    "title": "HTML5开发环境",
                    "hits": 199,
                    "seconds": 34,
                    "teacher": "老刘",
                    "teacherAvatar": "https://www.xiaochaoyuan/video/HTML5/tearher/老刘.jpg",
                    "url": "https://www.xiaochaoyuan/video/HTML5/html5.mp4",
                    "abstract": "小禅院H5以JavaScript为重心，全面覆盖Web应用热门前端框架！小禅院H5为前端编程而生！保你高薪就业！小禅院H5整合Node.Js、PHP、Java、.NET等服务端技术，以全栈角度阐释前端编程的精髓！"
                }
            ]
        }]
    },
    created: function () {
        this.getData()
    },
    methods: {
        getData: function () {
            var _this = this
            var id = GetUrlParam('id');
            // 上线时需要修改请求地址
            axios.get('http://www.xiaochaoyuan.com/videos/api/chapters.php?id=' + id)
                .then(function (res) {
                    _this.id = res.data.id;
                    _this.name = res.data.name;
                    _this.chapters = res.data.chapters;
                })
        },
        getVideo: function (id) {
            var v_id = id;
            window.location.href = 'section.action?id=' + v_id;
        }


    },
    filters: {
        videoTime: function (value) {
            var hours = Math.floor(value / 3600)
            hours = hours > 10 ? hours : '0' + hours
            var minute = Math.floor(value / 60)
            minute = minute >= 60 ? minute % 60 > 10 ? minute % 60 : '0' + minute % 60 : minute < 10 ? '0' + minute : minute
            var seconds = value % 60
            seconds = seconds > 10 ? seconds : '0' + seconds
            return hours + '：' + minute + '：' + seconds
        },
        order: function (value) {
            if(value < 10){
                return '0' + value
            }else{
                return value
            }
        }
    }
})