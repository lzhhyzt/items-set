<template>
  <div class="preview">
    <div class="preview__center">
      <div class="preview__center-header">
        公告预览<i class="el-icon-view"></i>
      </div>
      <div class="preview__center-body">
        <!--公告详情标题-->
        <div class="announcement-title">
          <h4>{{ announcement.title }}</h4>
        </div>
        <!--公告详情时间作者登-->
        <div class="announcement-addition">
          <span>作者：{{ announcement.author }}</span>&nbsp;&nbsp;
          <span>发表时间：{{ new Date(announcement.date).format('yyyy-MM-dd hh:mm') }}</span>&nbsp;&nbsp;
          <span>点击数：{{ announcement.visits }}</span>
        </div>
        <!--公告详情内容-->
        <div class="announcement-content" v-html="announcement.contents">
        </div>
      </div>
    </div>
    <!--返回前页-->
    <div class="preview__backToPage" @click="backForward()"></div>
  </div>
</template>

<script>
import formaterTime from '../../../module/time.js'
import { mapGetters } from 'vuex'

export default {
  name: 'preview',
  data () {
    return {
      announcement: {
        title: '',      // 标题
        author: '',     // 作者
        date: '',       // 日期
        visits: 0,      // 访问次数
        contents: ''    // 内容
      }
    }
  },
  mounted () {
    // 时间格式化
    formaterTime()

    this.announcement = this.getAnnouncementPrevieDatas

  },
  computed: {
    ...mapGetters ([
      'getAnnouncementPrevieDatas'   // 获取公告预览内容
    ])
  },
  methods: {
    /**
     * 返回前一页
     */
    backForward () {
      this.$router.go(-1)
    }
  }
}
</script>

<style scoped>
  .preview {
    position: fixed;
    display: block;
    z-index: 1000;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    min-width: 100%;
    padding: 5px;
    background: #ededed;
    overflow: scroll;
  }
  .preview__center {
    position: absolute;
    display: block;
    left: 50%;
    width: 690px;
    height: auto;
    padding: 5px 10px;
    background: #ffffff;
    transform: translateX(-46%);
    border: 1px solid orange;
  }
  .preview__center-header {
    width: inherit;
    height: 10%;
    padding: 5px 0px;
    color: #909399;
  }
  .preview__center-body {
    width: inherit;
    height: 89%;
  }

  /*------公告详情------*/
  .announcement-title,
  .announcement-addition,
  .announcement-content {
    margin-top: 10px;
  }

  .announcement-title {
    line-height: 1.1;
    text-align: center;
    font-size: 20px;
    font-family: "Microsoft Yahei";

  }
  .announcement-addition {
    padding: 5px 0;
    color: #A9A9A9;
    text-align: center;
    font-family: "Microsoft Yahei";
    border: 1px solid #D8D8D8;

  }
  .announcement-content {
    padding: 10px 0;

    color: inherit;
    text-align: left;
    font-size: 16px;
    font-weight: 500;
    font-family: 宋体;
    line-height: 1.5;
    letter-spacing: 1px;
  }
  /*------公告详情------*/

  /*---------返回-------*/
  .preview__backToPage {
    position: fixed;
    top: 5px;
    left: 40px;
    display: block;
    width: 32px;
    height: 32px;
    cursor: pointer;
    background: url(../assets/back.png) no-repeat;
  }
  .preview__backToPage:hover {
    background: url(../assets/back1.png) no-repeat;
  }
  /*---------返回-------*/
</style>
<style>
  /**表格属性*/
  .preview table {
    border-collapse: collapse;
    border: 1px solid #000000;
  }
  .preview table td,
  .preview table th {
    border: 1px solid #000000;
    padding: 3px 5px;
    min-width: 40px;
    height: 20px;
  }
</style>
