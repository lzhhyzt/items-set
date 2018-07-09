<template>
  <div class="newsDetail" :style="newsDetailNewStyle"> <!---->
    <div class="newsDetail__head">
      您当前所在的位置：
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/news' }">新闻管理</el-breadcrumb-item>
        <el-breadcrumb-item >{{ operation }}</el-breadcrumb-item>
      </el-breadcrumb>

    </div>
    <div class="newsDetail__body">
      <div class="newsDetail__body-explain">
        {{ operation }}
      </div>
      <div class="newsDetail__body-header">

        <el-form :model="news" :rules="rules" ref="news" label-width="80px" status-icon>
          <el-form-item label="标题" prop="title">
            <el-input v-model="news.title" size="small" placeholder="请输入标题"></el-input>
          </el-form-item>
          <el-form-item label="副标题">
            <el-input v-model="news.subtitle" size="small" placeholder="请输入副标题,没有可以为空"></el-input>
          </el-form-item>
          <el-form-item label="作者">
            {{ news.author }}
          </el-form-item>
          <el-form-item label="时间" prop="time">
            <el-date-picker
              v-model="news.date"
              type="datetime"
              placeholder="选择日期时间"
              value-format="yyyy-MM-dd hh:mm:ss">
            </el-date-picker>
          </el-form-item>
          <el-form-item  class="newsDetail__body-imageNews" label="轮播新闻">
            <div>
              <el-tooltip :content="carousel == 1?'开':'关'" placement="top" >
                <el-switch v-model="carousel" active-color="#13ce66" active-value="1"
                inactive-value="0"></el-switch>
              </el-tooltip>
            </div>
            <div class="carousel__url">
              <el-input class="carousel__url-input" size="small" placeholder="请输入图片地址"
              v-show="carousel == 1" v-model="imageUrl"></el-input>
            </div>
            <div class="imageNews__carousel">
              <el-input class="carousel__url-input" size="small" placeholder="请输入文字描述"
              v-show="carousel == 1" v-model="imageDescription"></el-input>
            </div>
          </el-form-item>
        </el-form>

      </div>
      <div class="newsDetail__body-editor">
        <div class="editor_left">
          <!-- wangEditor编辑器 -->
          <div id="editorElem" style="text-align:left">
          </div>
        </div>
        <!-- 操作按钮 -->
        <div class="editor_right">
          <div class="editor_right-same1">
            <div>
              <el-tooltip class="item" effect="dark" content="前台显示效果以预览结果为标准" placement="left">
                <router-link :to="{path:'/news/preview'}">
                  <el-button type="primary" plain @click="previewNews">新闻预览</el-button>
                </router-link>
              </el-tooltip>
            </div>
          </div>
          <div class="editor_right-add" v-if="operationType == 1">
            <div><el-button type="primary" plain @click="publishNews(1)">发表新闻</el-button></div>
            <div><el-button type="primary" plain @click="publishNews(2)">保存草稿</el-button></div>
          </div>
          <div class="editor_right-editor" v-else-if="operationType == 2">
            <div><el-button type="primary" plain @click="saveUpdate">保存修改</el-button></div>
          </div>
          <div class="editor_right-spare" v-else></div>
          <div class="editor_right-same2">
            <div><el-button type="primary" plain @click="clearNews">清除内容</el-button></div>
            <div>
              <el-popover ref="attention" placement="left" title="编辑注意" width="200" trigger="hover"
              content="编辑中尽量使用编辑器自带的工具栏设置样式，避免出错，还有编辑过程中慎用空格。一切编辑效果以预览结果为标准">
              </el-popover>
              <el-button type="warning" plain icon="el-icon-warning" v-popover:attention>注意项</el-button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import E from 'wangeditor'
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import FormaterTime from '../../../module/time.js'
import Cookies from '../../../module/cookie.js'
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: 'newsDetail',
  data () {
    return {
      carousel: '',           // 轮播新闻开关值
      imageUrl: '',           // 图片新闻首页显示的图片地址
      imageDescription: '',   // 图片的文字说明
      datetime :{
        date: '',
        time: ''
      },
      operationType: 0,     // 正在操作的动作类型：1-新增/2-修改
      operationIndex: -1,   // 如果是修改状态时，需要被操作的索引
      editorObj: null,      // wangEditor对象
      news: {
        id: -1,
        title: '',          // 新闻标题
        subtitle: '',       // 新闻副标题
        author: '',         // 新闻作者
        date: '',           // 发表日期
        contents: '',        // 新闻内容
        state: -1,          // 发表状态
        visits: 0          // 访问次数（备用）
      },
      rules: {              // 验证规则
        title: [
          { required: true, message: '请输入新闻标题', trigger: 'blur' },
          { min: 1, max: 50, message: '长度在 1 到 50 个字符', trigger: 'blur' }
        ],
        date: [
          { type: 'date', required: true, message: '请输入时间日期', trigger: 'change' }
        ]
      },
      operation: '',          // 显示的操作标题
      newsDetailNewStyle: {}  // news类元素新增样式
    }
  },

  created () {
    // 改变当前页的宽度等样式
    this.changePageStyle(this.getIsCollapse)
    var _that = this

    var path = this.$route.path
    if (path.indexOf('/news/add') > -1) {
      _that.operationType = 1
      _that.operation = '新增新闻'

    } else if (path.indexOf('/news/edit') > -1) {
      _that.operationType = 2
      _that.operationIndex = this.$route.query.id
       _that.operation = '修改新闻'
    }

    // 如果是修改操作，根据编辑传过来的索引值向服务器请求数据
    if (_that.operationType == 2) {
      this.getNewsDetail(this.$route.query.id)
    }

  },

  mounted () {
    // 格式化时间
    FormaterTime()

    // 获取cookie的当前用户
    var currentUser = Cookies.get('CURRENTUSER')
    this.news.author = currentUser || '游客'

    // 初始化编辑器
    var editor = new E('editorElem')
    // editor.onchange = () => {
    //   this.news.contents = editor.$txt.html()
    // }
    editor.create()
    this.editorObj = editor

  },
  computed: {
    ...mapGetters ([
      'getIsCollapse',            // 获取导航列表展开收缩状态
      'getOperationNewsIndex'     // 获取当前正在操作的新闻索引：1-新增/2-编辑
    ])
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setIsCollapse',
      'setNewsPreviewDatas'
    ]),

    /**
     * 改变当前页的宽度等样式
     */
    changePageStyle (val) {
      if (val == true) {
        this.newsDetailNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.newsDetailNewStyle = {
          left: '200px',
          width: 'calc(100% - 200px)',
          transition: 'width 0.6s, left 0.6s',
          MozTransition: 'width 0.6s, left 0.6s',
          WebkitTransition: 'width 0.6s, left 0.6s',
          OTransition: 'width 0.6s, left 0.6s'
        }
      }
    },

    /**
     * 获取新闻信息详情
     */
    getNewsDetail (id) {
      var _that = this
      //根据ID向服务器请求新闻信息
      $http.post(apis.getNewsById, {
        id: parseInt(id)
      })
      .then(res => {
        _that.news = res.data.news
        _that.news.date = new Date(res.data.news.date).format('yyyy-MM-dd hh:mm:ss', false)
        // 初始化编辑器的内容
        _that.editorObj.$txt.html(_that.news.contents)
      })

      // 根据新闻ID向服务器请求轮播新闻信息
      $http.post(apis.getImageNewsById, {
        nId: parseInt(id)
      })
      .then(res => {
        var datas = res.data
        if (datas != undefined) {
          _that.carousel = datas.imageNews.isShow.toString()
          _that.imageUrl = datas.imageNews.url
          _that.imageDescription = datas.imageNews.description
        }
      })
    },

    /**
     * 新闻预览
     */
    previewNews () {
      var news = {
        title: this.news.title,
        subtitle: this.news.subtitle,
        author: this.news.author,
        date: this.news.date,
        visits:  0,     //this.news.visits
        contents: this.editorObj.$txt.html()
      }

      // 调用vewx的store仓库存储需要预览的数据
      this.setNewsPreviewDatas(news)
    },

    /**
     * 发表新闻/保存为草稿
     */
    publishNews (type) {
      var warn = ''
      var words = ''
      if (type == 1) {
        warn = '发表该新闻'
        words = '发表'
      } else {
        warn = '保存为草稿'
        words = '保存'
      }

      this.$confirm('是否要'+warn+'?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {

        // 验证时间，如果为空，自动补上当前时间
        if (this.news.date == '' || this.news.date == null) {
          this.news.date = new Date().format('yyyy-MM-dd hh:mm:ss', false)
        }

        // 验证新闻标题
        if (this.news.title == '' || this.news.title == null) {
          this.$message({
            type: 'error',
            message: '错误:文章标题不能为空!',
            center: true
          });
          return false
        }

        // 验证输入的内容是否为空
        var contents = this.editorObj.$txt.html() // 获取编辑器内容
        if (contents == '' || contents == '<p><br></p>') {
          this.$message({
            type: 'error',
            message: '错误:文章内容不能为空!',
            center: true
          })
          return false
        } else {
          this.news.contents = contents
        }

        // 异步请求添加新闻
        var _that = this
        this.news.state = type   // 已发表或者为草稿：1-发表；2-草稿
        $http.post(apis.addNews, this.news)
        .then(res => {
          if (res.code== 1) {  // 如果返回码状态为1，即操作成功
            _that.$message({
              type: 'success',
              message: words + '成功!',
              center: true
            })
            // 跳转到新闻管理页
            _that.$router.push('/news')
          } else {
          _that.$message({
            type: 'error',
            message: words + '失败!',
            center: true
          })
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消' + words,
          center: true
        })
      })

      // 添加轮播图片信息
      if (carousel == 1) {
        this.addImageNews(this.imageUrl,this.imageDescription)
      }
    },

    /**
     * 新增轮播新闻信息
     */
    addImageNews (url,description) {
      if (url != null&& description != null) {
        $http.post(apis.addImageNews, {
          url: url,
          description: description
        })
        .then(res => {})
      } else {
        this.$message({
          type: 'error',
          message: '轮播新闻的图片地址和描述不能为空!',
          center: true
        })
      }
    },

    /**
     * 清除内容
     */
    clearNews () {
      this.$confirm('是否要清除全部已编辑的内容, 你确定?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 清除编辑器的内容, 赋值一个特殊值置空
        this.editorObj.$txt.html('<p><br></p>');

        this.news.title = ''
        this.news.subtitle = ''
        this.news.date = ''

        this.$message({
          type: 'success',
          message: '清除成功!',
          center: true
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消清除',
          center: true
        })
      })
    },

    /**
     * 保存修改
     */
    saveUpdate () {
      this.$confirm('是否要更改该新闻内容?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {

        // 验证时间，如果为空，自动补上当前时间
        if (this.news.date == '' || this.news.date == null) {
          this.news.date = new Date().format('yyyy-MM-dd hh:mm:ss', false)
        }

        // 验证新闻标题
        if (this.news.title == '' || this.news.title == null) {
          this.$message({
            type: 'error',
            message: '错误:文章标题不能为空!',
            center: true
          });
          return false
        }

        // 验证输入的内容是否为空
        var contents = this.editorObj.$txt.html() // 获取编辑器内容
        if (contents == '' || contents == '<p><br></p>') {
          this.$message({
            type: 'error',
            message: '错误:文章内容不能为空!',
            center: true
          })
          return false
        } else {
          this.news.contents = contents
        }

        // 异步请求添加新闻
        var _that = this
        $http.post(apis.updateNewsById, {
          id: _that.news.id,
          title: _that.news.title,             // 新闻标题
          subtitle: _that.news.subtitle,       // 新闻副标题
          author: _that.news.author,           // 新闻作者
          date: _that.news.date,               // 发表日期
          contents: _that.news.contents,       // 新闻内容
          state: _that.news.state,             // 发表状态
          visits: _that.news.visits,
          isShow: parseInt(_that.carousel),
          url: _that.imageUrl,
          description: _that.imageDescription
        })
        .then(res => {
          if (res.code== 1) {  // 如果返回码状态为1，即操作成功
            _that.$message({
            type: 'success',
            message: '更改成功!',
            center: true
          })
          } else {
          _that.$message({
            type: 'error',
            message: '更改失败!',
            center: true
          })
          }
        })
      }).catch((err) => {
        this.$message({
          type: 'info',
          message: '已取消更改',
          center: true
        })
      })
    },

    /**
     * 统一验证
     */
    validated () {

      // 验证状态
      var state = true

      // 验证时间，如果为空，自动补上当前时间
      if (this.news.date == '' || this.news.date == null) {
        this.news.date = new Date().format('yyyy-MM-dd hh:mm:ss', false)
        state = true
      }

      // 验证新闻标题
      if (this.news.title == '' || this.news.title == null) {
        this.$message({
          type: 'error',
          message: '错误:文章标题不能为空!',
          center: true
        });
        state = false;
      } else {
        state = true
      }

        // 验证输入的内容是否为空
      if (this.news.editorContent == '' || this.news.editorContent == '<p><br></p>') {
          this.$message({
          type: 'error',
          message: '错误:文章内容不能为空!',
          center: true
        });
        state = false;
      } else {
        state = true;
      }
    }

  },

  watch: {
    getIsCollapse: {
      handler (val, oldVal) {
        this.changePageStyle(val)
      }
    }
  }
}
</script>

<style scoped>
  .newsDetail {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    height: 900px;
    font-size: 14px;
    overflow-y: scroll;
  }

  .newsDetail__head {
    position: relative;
    width: 100%;
    height: 30px;
    line-height: 1;
    color: #999999;
    padding: 3px 0 3px 20px;
  }
  .newsDetail__body {
    position: relative;
    width: 100%;
    padding-bottom: 140px;
    height: 1100px;
  }
  .newsDetail__body-explain,
  .newsDetail__body-header,
  .newsDetail__body-editor {
    position: relative;
    margin: 10px 20px;
  }
  .newsDetail__body-explain {
    color: #409eff;
    font-weight: bold;
    font-size: 16px;
  }
  .newsDetail__body-header {
    width: 56%;
    text-align: left;
  }
  .carousel__url,
  .imageNews__carousel {
    float: left;
    margin-right: 20px;
  }
  .carousel__url-input {
    width: 250px;
  }
  .newsDetail__body-editor {
    width: 100%;
    height: auto;
  }
  .newsDetail__body-editor::after {
    display: block;
    content: '';
    clear: both;
  }
  #editorElem {
    height: 520px;
    min-height: 400px;
  }
  .editor_left,
  .editor_right {
    float: left;
  }
  .editor_left {
    width: 84%;
    margin-right: 10px;
  }
  .editor_right-same1 > div,
  .editor_right-same2 > div,
  .editor_right-add > div,
  .editor_right-editor > div {
    margin-bottom: 10px;
  }
</style>
<style>
  .el-form-item__label {
    text-align: center;
  }
  .el-input-group__append {
    background-color: #ffffff;
    color: #f5131c;
    border: none;
  }
  .el-input__inner > *{
    display: inline-block;
  }
  .el-breadcrumb {
    display: inline-block;
    line-height: 1;
  }
  .el-breadcrumb__inner,
  .el-breadcrumb__inner a {
    font-weight: normal;
    color: #999999;
  }
  .el-breadcrumb__item:last-child .el-breadcrumb__inner,
  .el-breadcrumb__item:last-child .el-breadcrumb__inner:hover {
    color: #999999;
  }
</style>
