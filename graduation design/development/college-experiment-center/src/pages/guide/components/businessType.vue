<template>
  <div class="quality">
    <div class="quality__title">
      <span>业务种类</span>
    </div>
    <div class="quality__body">
      <p>一类：是否出具实验中心专用章，在送样时确定。《实验登记表》、《实验报告》等的填写、原始记录和实验报告的签名按规定进行；需留副样。 </p>
      <p>二类：填写《实验登记表》，是否留副样由客户和接样工作人员共同确认；实验报告由工作人按中心办公室提供的格式打印。实验报告的检测人、校核人、审批人签名后交办公室盖章、发出。</p>
      <p>三类：填写《实验登记表》。实验时间一般为1～7个工作日；需加急视情况处理。</p>
    </div>
  </div>
</template>

<script>

export default {
  name: 'quality',
  data () {
    return {}
  }
}

</script>

<style scoped>
  .quality__title {
    padding: 8px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .quality__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .quality__body {
    padding: 20px 0;
  }
</style>
