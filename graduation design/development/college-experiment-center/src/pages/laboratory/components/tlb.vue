<template>
  <div class="more">
    <div class="more__title">
      <span>T栋实验楼</span>
    </div>
    <div class="more__body">
      <i class="el-icon-warning"></i>
      暂时没有更多其他操作，有待开发
    </div>
  </div>
</template>

<script>

export default {
  name: 'more',
  data () {
    return {}
  }
}

</script>

<style scoped>
  .more__title {
    padding: 8px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .more__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .more__body {
    padding: 20px 0;
  }
  .el-icon-warning {
    color: #106f00;
  }
</style>
