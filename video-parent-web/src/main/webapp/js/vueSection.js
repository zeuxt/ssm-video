


var app = new Vue({
    el: '#detail',
    template: '#t',
    data: {
        "id": 1,
        "name": "Web前端",
        "chapter": [{
            "id": 1,
            "name": "HTML概述",
            "abstract": "H5广泛而深入地吸收了移动互联网时代的技术精髓，再加上其自身跨平台、免安装、更新快的技术优势，自2014年底发布以来，已经逐渐成为现代互联网和移动互联网开发的核心技术，逐渐发展成为各行各业 进入互联网+的首选开发技术。",
            "sections": [
                {
                    "id": 1,
                    "image": "html1-1",
                    "title": "Web前端",
                    "hits": 199,
                    "seconds": 3600,
                    "teacher": "李老师",
                    "teacherAvatar": "wjh",
                    "url": "html1-1",
                    "abstract": "入门学习"
                }
            ]
        }]
    },
    created: function () {
        this.getData()
    },
    methods: {
        getData: function (id, done) {
            var v_id
            if (id) {
                v_id = id
            } else {
                v_id = GetUrlParam('id')
            }
            var _this = this
            // 上线时修改请求地址
            axios.get('http://www.xiaochaoyuan.com/videos/api/details.php?id=3')
                .then((res) => {
                    _this.name = res.data.name
                    _this.chapter = res.data.chapter 
                    _this.id = res.data.id

                    if (done) {
                        done()
                    }
                })
                .catch((res) => {
                    alert('请求出现错误' + res)
                })
        },
        load: function (id) {
            this.getData(id, function () {
                $('html,body').animate({ scrollTop: 0 }, 'slow', function () {
                    videojs("videoPlayer").play()
                });
            })
            return false;
        }
    },
    computed: {
        section: function () {
            var e_id = this.id
            
            for (var i = 0; i < this.chapter[0].sections.length; i++) {
                if (this.chapter[0].sections[i].id == e_id) {
                    return this.chapter[0].sections[i]
                }
            }
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
            if (value < 10) {
                return '0' + value
            } else {
                return value
            }
        }
    }
})