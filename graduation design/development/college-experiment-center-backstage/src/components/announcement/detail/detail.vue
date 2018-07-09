<template>
  <div class="announcementDetail" :style="announcementDetailNewStyle"> <!---->
    <div class="announcementDetail__head">
      您当前所在的位置：
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/announcement' }">公告管理</el-breadcrumb-item>
        <el-breadcrumb-item>{{ operation }}</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="announcementDetail__body">
      <div class="announcementDetail__body-explain">
        {{ operation }}
      </div>
      <div class="announcementDetail__body-header">

        <el-form :model="announcement" :rules="rules" ref="announcement" label-width="80px" status-icon>
          <el-form-item label="标题" prop="title">
            <el-input v-model="announcement.title" size="small" placeholder="请输入标题"></el-input>
          </el-form-item>
          <!--
          <el-form-item label="副标题">
            <el-input v-model="announcement.subtitle" size="small" placeholder="请输入副标题,没有可以为空"></el-input>
          </el-form-item>
          -->
          <el-form-item label="作者">
            {{ announcement.author }}
          </el-form-item>
          <el-form-item label="时间" prop="time">
            <el-date-picker
              v-model="announcement.date"
              type="date"
              placeholder="选择日期"
              value-format="yyyy-MM-dd">
            </el-date-picker>
          </el-form-item>
        </el-form>

      </div>
      <div class="announcementDetail__body-editor">
        <div class="editor_left">
          <!-- wangEditor编辑器 -->
          <div id="editorElem" style="text-align:left">

          </div>
        </div>
        <!-- 操作按钮 -->
        <div class="editor_right">
          <!--
          <div class="editor_right-add" v-if="operationType == 1">
            <div><el-button type="primary" plain @click="previewAnnouncement">公告预览</el-button></div>
            <div><el-button type="primary" plain @click="publishAnnouncement(1)">发布公告</el-button></div>
            <div><el-button type="primary" plain @click="publishAnnouncement(2)">保存草稿</el-button></div>
            <div><el-button type="primary" plain @click="clearAnnouncement">清除内容</el-button></div>
          </div>
          <div class="editor_right-editor" v-else-if="operationType == 2">
            <div><el-button type="primary" plain @click="previewAnnouncement">公告预览</el-button></div>
            <div><el-button type="primary" plain @click="saveUpdate">保存修改</el-button></div>
            <div><el-button type="primary" plain @click="clearAnnouncement">清除内容</el-button></div>
          </div>
          <div class="editor_right-spare" v-else></div>
        </div>
        -->
        <div class="editor_right-same1">
            <div>
              <el-tooltip class="item" effect="dark" content="前台显示效果以预览结果为标准" placement="left">
                <router-link :to="{path:'/announcement/preview'}">
                  <el-button type="primary" plain @click="previewAnnouncement">公告预览</el-button>
                </router-link>
              </el-tooltip>
            </div>
          </div>
          <div class="editor_right-add" v-if="operationType == 1">
            <div><el-button type="primary" plain @click="publishAnnouncement(1)">发布公告</el-button></div>
            <div><el-button type="primary" plain @click="publishAnnouncements(2)">保存草稿</el-button></div>
          </div>
          <div class="editor_right-editor" v-else-if="operationType == 2">
            <div><el-button type="primary" plain @click="saveUpdate">保存修改</el-button></div>
          </div>
          <div class="editor_right-spare" v-else></div>
          <div class="editor_right-same2">
            <div><el-button type="primary" plain @click="clearAnnouncement">清除内容</el-button></div>
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
  name: 'announcementDetail',
  data () {
    return {
      datetime :{
        date: '',
        time: ''
      },
      operationType: 0,     // 正在操作的动作类型：1-新增/2-修改
      operationIndex: -1,   // 如果是修改状态时，需要被操作的索引
      editorObj: null,      // wangEditor对象
      announcement: {
        id: -1,
        title: '',          // 公告标题
        author: '',         // 公告作者
        date: '',           // 发布日期
        contents: '',        // 公告内容
        state: -1,          // 发布状态
        visits: 0          // 访问次数（备用）
      },
      rules: {              // 验证规则
        title: [
          { required: true, message: '请输入公告标题', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
        date: [
          { type: 'date', required: true, message: '请输入时间日期', trigger: 'change' }
        ]
      },
      operation: '',          // 显示的操作标题
      announcementDetailNewStyle: {}  // announcement类元素新增样式
    }
  },

  created () {
    // 改变当前页的宽度等样式
    this.changePageStyle(this.getIsCollapse)
    var _that = this

    var path = this.$route.path
    if (path.indexOf('/announcement/add') > -1) {
      _that.operationType = 1
      _that.operation = "新增公告"

    } else if (path.indexOf('/announcement/edit') > -1) {
      _that.operationType = 2
      _that.operationIndex = this.$route.query.id
       _that.operation = "修改公告"
    }

    // 如果是修改操作，根据编辑传过来的索引值向服务器请求数据
    if (_that.operationType == 2) {

      /**
      * 根据ID向服务器请求公告
      */
      $http.post(apis.getAnnouncementById, {
        id: _that.operationIndex
      })
      .then(res => {
        _that.announcement = res.data.announcement
        _that.announcement.date = new Date(res.data.announcement.date).format('yyyy-MM-dd hh:mm:ss', false)
        console.log(_that.announcement.date)
        // 初始化编辑器的内容
        this.editorObj.$txt.html(this.announcement.contents)
      })
    }

  },

  mounted () {
    // 格式化时间
    FormaterTime()

    // 获取cookie的当前用户
    var currentUser = Cookies.get('CURRENTUSER')
    this.announcement.author = currentUser || '游客'

    // 初始化编辑器
    var editor = new E('editorElem')
    // editor.onchange = () => {
    //   this.announcement.contents = editor.$txt.html()
    // }
    editor.create()
    this.editorObj = editor

  },
  computed: {
    ...mapGetters ([
      'getIsCollapse',            // 获取导航列表展开收缩状态
      'getOperationAnnouncementIndex'     // 获取当前正在操作的公告索引：1-新增/2-编辑
    ])
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setIsCollapse',
      'setAnnouncementPreviewDatas'
    ]),

    /**
     * 改变当前页的宽度等样式
     */
    changePageStyle (val) {
      if (val == true) {
        this.announcementDetailNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.announcementDetailNewStyle = {
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
     * 公告预览
     */
    previewAnnouncement () {
      var announcement = {
        title: this.announcement.title,
        author: this.announcement.author,
        date: this.announcement.date,
        visits:  this.announcement.visits,
        contents: this.editorObj.$txt.html()
      }

      // 调用vewx的store仓库存储需要预览的数据
      this.setAnnouncementPreviewDatas(announcement)
    },

    /**
     * 发布公告/保存为草稿
     */
    publishAnnouncement (type) {
      var warn = ''
      var words = ''
      if (type == 1) {
        warn = '发布该公告'
        words = '发布'
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
        if (this.announcement.date == '' || this.announcement.date == null) {
          this.announcement.date = new Date().format('yyyy-MM-dd hh:mm:ss', false)
        }

        // 验证公告标题
        if (this.announcement.title == '' || this.announcement.title == null) {
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
          this.announcement.contents = contents
        }

        // 异步请求添加公告
        var _that = this
        this.announcement.state = type   // 已发布或者为草稿：1-发布；2-草稿
        $http.post(apis.addAnnouncement, this.announcement)
        .then(res => {
          if (res.code== 1) {  // 如果返回码状态为1，即操作成功
            _that.$message({
              type: 'success',
              message: words + '成功!',
              center: true
            })

            // 跳转到公告管理页
            _that.$router.push('/announcement')
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
    },

    /**
     * 清除内容
     */
    clearAnnouncement () {
      this.$confirm('是否要清除辛辛苦苦编辑的内容, 你确定?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 清除编辑器的内容, 赋值一个特殊值置空
        this.editorObj.$txt.html('<p><br></p>');

        this.announcement.title = ''
        this.announcement.subtitle = ''
        this.announcement.date = ''

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
      this.$confirm('是否要更改该公告内容?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {

        // 验证时间，如果为空，自动补上当前时间
        if (this.announcement.date == '' || this.announcement.date == null) {
          this.announcement.date = new Date().format('yyyy-MM-dd hh:mm:ss', false)
        }

        // 验证公告标题
        if (this.announcement.title == '' || this.announcement.title == null) {
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
          this.announcement.contents = contents
        }

        // 异步请求添加公告
        var _that = this
        $http.post(apis.updateAnnouncementById, _that.announcement)
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
      if (this.announcement.date == '' || this.announcement.date == null) {
        this.announcement.date = new Date().format('yyyy-MM-dd hh:mm:ss', false)
        state = true
      }

      // 验证公告标题
      if (this.announcement.title == '' || this.announcement.title == null) {
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
      if (this.announcement.editorContent == '' || this.announcement.editorContent == '<p><br></p>') {
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
  .announcementDetail {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    height: 800px;
    font-size: 14px;
    overflow-y: scroll;
  }

  .announcementDetail__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 20px;
  }
  .announcementDetail__body {
    position: relative;
    width: 100%;
    height: 1000px;
  }
  .announcementDetail__body-explain,
  .announcementDetail__body-header,
  .announcementDetail__body-editor {
    position: relative;
    margin: 10px 20px;
  }
  .announcementDetail__body-explain {
    color: #409eff;
    font-weight: bold;
    font-size: 16px;
  }
  .announcementDetail__body-header {
    width: 56%;
    text-align: left;
  }
  .announcementDetail__body-editor {
    width: 100%;
    height: auto;
  }
  .announcementDetail__body-editor::after {
    display: block;
    content: '';
    clear: both;
  }
  #editorElem {
    height: 620px;
    min-height: 500px;
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
