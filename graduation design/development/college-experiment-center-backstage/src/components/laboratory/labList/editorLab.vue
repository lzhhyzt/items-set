<template>
  <div class="editorLab">
    <div class="editorLab__body">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="活动名称">
          <el-input v-model="form.name" placeholder="请填写实验室名"></el-input>
        </el-form-item>
        <el-form-item label="所在楼层">
          <el-input-number v-model="form.floor" :min="1" :max="10" label="无">
          </el-input-number>
        </el-form-item>
        <el-form-item label="活动区域">
          <el-select v-model="form.usages" placeholder="请选择用途">
            <el-option label="教学" value="1"></el-option>
            <el-option label="实验" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="空置情况">
          <el-select v-model="form.vacant" placeholder="请选择状态">
            <el-option label="空闲" value="1"></el-option>
            <el-option label="已预订" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所在位置">
          <el-input v-model="form.building" placeholder="请填写位置"></el-input>
        </el-form-item>
        <el-form-item label="具体描述">
          <el-input v-model="form.description" placeholder="请填写描述"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit">立即修改</el-button>
          <el-button>取消</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import Cookie from '../../../module/cookie.js'

export default {
  name: 'editorLab',
  data () {
    return {
      form: {
        id: '',
        name: '',
        floor: 0,
        usages: '',
        vacant: '',
        building: '',
        description: ''
      },
      usagesLabel: '',
      vacantLabel: ''
    }
  },

  created () {
    this.getInfo()
  },

  methods: {

    /**
     * 提交表单修改
     */
    onSubmit() {
      var forms = this.form
      if (forms.name != "" || forms.name != null) {
        this.$confirm('修改此实验室, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          $http.post(apis.updateLaboratoryById, forms)
          .then(res => {
            if (res.code == 1) {
              this.$message({
                type: 'success',
                center: true,
                message: '修改成功!'
              });

              // 重置
              this.form = {
                name: '',
                floor: 0,
                usages: '',
                vacant: '',
                building: '',
                description: ''
              }
            }
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            center: true,
            message: '已取消修改'
          });
        });
      }
    },

    /**
     * 获取信息
     */
    getInfo () {
      var id = this.$route.query.index
      $http.post(apis.getLaboratoryById, {
        id: id
      })
      .then(res => {
        this.form = res.data.laboratory

        if (this.form.usages == 1) {
          this.form.usages = '教学'
        } else {
           this.form.usages = '实验'
        }

        if (this.form.vacant == 1) {
          this.form.vacant = '空闲'
        } else {
           this.form.vacant = '已预订'
        }

      })
    }
  },

  //监听路由变化
  watch: {
    // 如果路由有变化，会再次执行该方法
    "$route": function(newValue,oldValue){
      this.getInfo()
    }
  }
}

</script>

<style scoped>
  .editorLab {
    position: relative;
    width: inherit;
    height: inherit;
  }

  .editorLab__body {
    position: absolute;
    left: 60%;
    top: 50%;
    width: 350px;
    transform: translateX(-50%) translateY(-50%);
  }
</style>
