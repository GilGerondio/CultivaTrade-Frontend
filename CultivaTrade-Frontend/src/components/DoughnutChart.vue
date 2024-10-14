<template>
  <Doughnut id="barChartId" :options="chartOptions" :data="chartData" />
</template>

<script>
import { Doughnut } from 'vue-chartjs';
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  ArcElement,
  CategoryScale,
  LinearScale,
} from 'chart.js';

ChartJS.register(Title, Tooltip, Legend, ArcElement, CategoryScale, LinearScale);

export default {
  name: 'doughnutChart',
  components: { Doughnut },
  data() {
    return {
      chartData: {
        labels: ['User', 'Sellers', 'Buyer'],
        datasets: [
          {
            data: [40, 20, 12],
            backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(255, 205, 86)'],
          },
        ],
      },
      chartOptions: {
        responsive: true,
      },
    };
  },
};
</script>
