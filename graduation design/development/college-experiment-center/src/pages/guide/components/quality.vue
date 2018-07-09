<template>
  <div class="quality">
    <div class="quality__title">
      <span>质量方针</span>
    </div>
    <div class="quality__body">
      <b>科学</b> <b>公正</b> <b>准确</b> <b>高效</b>
      <p>★ 科学：科学是本中心一贯遵守的原则，全体人员努力学习专业知识、不断提高实验技能，完善内部管理机制，确保实验操作程序规范，方法、结果科学可靠。</p>
      <p>★公正：对客户负责。实验工作不受任何来自行政、商业、财政或其他方面不正当的压力及影响。</p>
      <p>★准确：要求每一位实验人员坚持质量第一的方针，精益求精， 严格按 检测和操作流程工作，有效地控制影响质量的各种因素，保证实验数据准确。</p>
      <p>★高效：在商定的时间完成检测任务，及时提供检测结果。</p>
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
