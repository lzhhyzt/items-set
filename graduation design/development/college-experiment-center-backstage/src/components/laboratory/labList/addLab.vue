<template>
  <div class="addLab">
    <div class="addLab__body">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="实验室名">
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
          <el-button type="primary" @click="onSubmit">立即添加</el-button>
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
  name: 'addLab',
  data () {
    return {
      form: {
        name: '',
        floor: 0,
        usages: '',
        vacant: '',
        building: '',
        description: ''
      }
    }
  },

  methods: {
    onSubmit() {
      var forms = this.form
      if (forms.name != "" || forms.name != null) {
        this.$confirm('添加此实验室, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
           $http.post(apis.addLaboratory, forms)
          .then(res => {
            if (res.code == 1) {
              this.$message({
                type: 'success',
                center: true,
                message: '添加成功!'
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
            message: '已取消添加'
          });
        });
      }
    }
  }
}

</script>

<style scoped>
  .addLab {
    position: relative;
    width: inherit;
    height: inherit;
  }

  .addLab__body {
    position: absolute;
    left: 60%;
    top: 50%;
    width: 350px;
    transform: translateX(-50%) translateY(-50%);
  }
</style>
