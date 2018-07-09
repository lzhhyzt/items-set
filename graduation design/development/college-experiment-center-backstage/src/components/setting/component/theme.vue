<template>
  <div class="theme">
    <div class="theme__title">
      <span>前台主题色</span>
    </div>
    <div class="theme__body">
      <p class="theme__body-p1">
        请选择主题色：
        <el-color-picker v-model="defaultColor" size="small" :change="changeColor"></el-color-picker>
      </p>
      <p>&nbsp;</p>
      <p class="theme__body-p2">
        你选择的主题色：<span>{{ defaultColor }}</span>
      </p>
      <p>&nbsp;</p>
      <div class="theme__body-d1" :style="{background:defaultColor}">&nbsp;</div>
      <p>&nbsp;</p>
      <p class="theme__body-p3">
        <el-button size="small" @click="cancel">取消</el-button>
        <el-button type="primary" size="small" @click="save">保存</el-button>
        <el-button type="warning" size="small" @click="reset">重置</el-button>
      </p>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'theme',
  data () {
    return {
      defaultColor: '#409eff' // 默认主题色
    }
  },
  created () {
    this.getThemeColor(0)
  },
  methods: {
    /**
     * 获取主题色
     */
    getThemeColor (id) {
      var _that = this
      $http.post(apis.getThemeById, {
        id:id
      })
      .then(res => {
        var theme = res.data.theme
        _that.defaultColor = theme.currentColor
      })
    },
    /**
     * 改变颜色
     */
    changeColor (data) {
      //console.log('当前主题',this.defaultColor)
    },

    /**
     * 取消操作
     */
    cancel () {
      this.getThemeColor(0)
      this.$message({
        type: 'success',
        message: '已取消设置',
        center: true
      })
    },

    /**
     * 保存颜色
     */
    save () {
      this.$confirm('是否永久保存该主题色设定?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        $http.post(apis.updateTheme, {
          id: 0,
          currentColor: this.defaultColor,
          previousColor: ''
        })
        .then(res => {
          this.$message({
            type: 'success',
            message: '保存成功!',
            center: true
          });
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消保存',
          center: true
        })
      })
    },

    /**
     * 重置主题色为#409eff
     */
    reset () {
      this.$confirm('是否重置主题色为最开始的#409eff?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.defaultColor = '#409eff'
        this.$message({
          type: 'success',
          message: '重置成功，请保存！',
          center: true
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消重置',
          center: true
        })
      })
    }
  }
}
</script>

<style scoped>
  .theme {
    width: 100%;
    height: 100%;
  }
  .theme__title {
    display: table;
    width: 100%;
    height: 40px;
    padding-left: 20px;
    background: #fafafa;
    border-top: 1px solid #D8D8D8;
    border-bottom: 1px solid #D8D8D8;
  }
  .theme__title span {
    display: table-cell;
    vertical-align: middle;
    color: #3A3A53;
    font-size: 16px;
  }
  .theme__body {
    margin-left: 20px;
    margin-top: 10px;
    width: auto;
  }
  .theme__body-p2 > span{
    text-decoration: underline;
  }
  .theme__body-d1 {
    position: relative;
    display: block;
    width: 100%;
    height: 50px;
  }
  .theme__body-p3 {
    text-align: center;
  }
</style>
