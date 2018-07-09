<template>
  <div class="trend">
    <div ref="chart" class="trend__chart"></div>
  </div>
</template>

<script>

export default {
  name: 'trend',
  mounted () {
    // echarts图表
    let lineChart = this.$echarts.init(this.$refs.chart)
    lineChart.setOption({
      color: ['#3da5fe', '#fe5723', '#6cc60A', '#8f8e97'],
      textStyle: {color: '#707079', fontSize: 14, fontFamily: 'PingFangSC-Regular'},
      tooltip: { trigger: 'axis' },
      legend: {
        data: ['排队量', '已接入会话量']
      },
      xAxis: {
        data: []
      },
      yAxis: {},
      series: [
        { name: '排队量', type: 'line', symbol: 'circle', symbolSize: 9, data: [] },
        { name: '已接入会话量', type: 'line', symbol: 'circle', symbolSize: 9, data: [] }
      ]
    })

    // // 处理返回的数据
    let obj = { hour: [], receiveCount: [], totalSessionCount: [], unreceiveCount: [], waitCount: [] }
    obj.hour = ['1:00','3:00','5:00','7:00','9:00','11:00','13:00','15:00','17:00','19:00','21:00','23:00']
    obj.waitCount = [0,1,0,2,5,3,7,6,8,5,7,6]
    obj.receiveCount = [5,2,3,5,4,1,0,2,0,6,5,8]
    // 设置图表
    lineChart.setOption({
      xAxis: { data: obj.hour },
      series: [
        { name: '排队量', data: obj.waitCount },
        { name: '已接入会话量', data: obj.receiveCount }
      ]
    })

    // 请求图表数据
    // this.getTrend().then(res => {
    //   // 处理返回的数据
    //   let obj = { hour: [], receiveCount: [], totalSessionCount: [], unreceiveCount: [], waitCount: [] }
    //   res.data.map(dot => {
    //     Object.keys(obj).forEach(item => {
    //       if (item === 'hour') {
    //         obj[item].push(dot[item].toString().slice(-2) + ':00')
    //       } else {
    //         obj[item].push(dot[item])
    //       }
    //     })
    //   })
    //   lineChart.setOption({
    //     xAxis: { data: obj.hour },
    //     series: [
    //       { name: '排队量', data: obj.waitCount },
    //       { name: '已接入会话量', data: obj.receiveCount },
    //       { name: '未接入会话量', data: obj.unreceiveCount },
    //       { name: '会话总量', data: obj.totalSessionCount }
    //     ]
    //   })
    // })
  },
  methods: {
  }
}
</script>

<style scoped>
  .trend {
    height: 280px;
    padding: 0 10px;
    background: #ffffff;
  }
  .trend__chart {
    width: 100%;
    height: 100%;
  }
</style>
