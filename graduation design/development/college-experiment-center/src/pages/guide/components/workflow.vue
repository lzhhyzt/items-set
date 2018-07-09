<template>
  <div class="quality">
    <div class="quality__title">
      <span>工作流程</span>
    </div>
    <div class="quality__body">
      <p>1. 接样：由仪器责任人负责接受送测样品，接样后登记、编号（见样品收发保管制度）；</p>
      <p>2．实验：在实验的全过程坚持质量第一的方针，保证实验数据准确、可靠。严格按操作流程进行工作，有效地控制影响质量的各种因素。未经检定或检定不合格的仪器和未经考核合格的人员不能参与实验工作 （见质量管理条例）；</p>
      <p>3．报告：需盖章的测试报告一式两份交中心办公室登记后，发给送测单位和存档。（见业务种类）。不需盖章的实验报告或结果各仪器负责人自己做好存档；</p>
      <p>4．收费及报告发放：凭财务发票，发放实验报告。（见收费办法）；</p>
      <p>5．投诉：对分析实验结果有异议或对工作人员的服务态度不满意可书面或口头方式向本中心主任和副主任投诉。也可采用自己认为合适、方便的方式，向主管部门或学校领导投诉（见质量检测结果抱怨和投诉处理程序）。</p>
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
