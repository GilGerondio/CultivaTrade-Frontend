<template>
  <div>
    <navigationBar />
    <!-- Dashboard Cards -->
    <div class="flex justify-around p-8">
      <div
        class="bg-white shadow-md rounded-lg p-6 w-1/4 text-center hover:transition-all hover:-translate-y-2"
      >
        <h3 class="text-lg font-bold">Total Products</h3>
        <p class="text-2xl">{{ totalProducts }}</p>
      </div>
      <div
        class="bg-white shadow-md rounded-lg p-6 w-1/4 text-center hover:transition-all hover:-translate-y-2"
      >
        <h3 class="text-lg font-bold">Total Sellers</h3>
        <p class="text-2xl">{{ totalSellers }}</p>
      </div>
      <div
        class="bg-white shadow-md rounded-lg p-6 w-1/4 text-center hover:transition-all hover:-translate-y-2"
      >
        <h3 class="text-lg font-bold">Total Buyers</h3>
        <p class="text-2xl">{{ totalBuyers }}</p>
      </div>
    </div>
    <!-- Chart Section -->
    <div class="flex w-full border p-4 space-x-4">
      <div class="flex-1 w/2">
        <BarChart class="border" />
      </div>
      <div class="flex-none w-1/4">
        <!-- You can adjust the width here -->
        <div class="flex-1 w/2">
          <div>Month of {{ monthDate() }}</div>
          <DoughnutChart class="border" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import navigationBar from './NavigationView.vue';
import { defineComponent, onMounted } from 'vue';
import BarChart from '@/components/BarChart.vue';
import DoughnutChart from '@/components/DoughnutChart.vue';
export default defineComponent({
  components: { BarChart, DoughnutChart, navigationBar },
  data() {
    return {
      totalProducts: 120,
      totalSellers: 50,
      totalBuyers: 80,
      date: new Date(),
      chartData: {
        labels: ['Products', 'Sellers', 'Buyers'],
        datasets: [
          {
            label: 'Total',
            data: [120, 50, 80],
            backgroundColor: ['#68912E', '#4A90E2', '#E94E77'],
          },
        ],
      },
      chartOptions: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
          title: {
            display: true,
            text: 'Total Metrics',
          },
        },
      },
    };
  },
  methods: {
    monthDate() {
      return this.date.toLocaleString('default', { month: 'long' });
    },
  },
  mounted() {
    this.renderChart();
  },
  setup() {
    onMounted(() => {
      this.renderChart();
    });
  },
});
</script>
<style>
/* Add any additional styles here */
</style>
