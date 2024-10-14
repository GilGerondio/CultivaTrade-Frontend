<template>
  <navigationBar />
  <div class="bg-[#4D8734] w-full h-full min-h-screen">
    <div class="flex flex-col items-center">
      <img src="../../assets/Images/cultivatrade-inventory.png" alt="" />
      <div class="bg-[#E0E0E0] rounded-lg bg-opacity-75 p-4 text-[#648E2A] w-1/2">
        <div class="row flex w-full">
          <div class="col flex items-start">
            <label class="me-2">Month</label>
            <div class="flex justify-start pb-2">
              <el-select
                v-model="selectedMonth"
                placeholder="Select Month"
                size="large"
                style="width: 240px"
              >
                <el-option
                  v-for="(month, index) in months"
                  :key="index"
                  :label="month"
                  :value="index + 1"
                />
              </el-select>
            </div>
          </div>
          <div class="col flex">
            <label class="mx-2">Year</label>
            <div class="flex justify-start pb-2">
              <el-select
                v-model="selectedYear"
                placeholder="Select Year"
                size="large"
                style="width: 240px"
              >
                <el-option v-for="year in years" :key="year" :label="year" :value="year" />
              </el-select>
            </div>
          </div>
        </div>

        <div class="flex justify-center w-full">
          <el-table :data="productData" :style="{ width: '100%' }">
            <el-table-column prop="product" label="Products" width="180" />
            <el-table-column prop="totalQuantity" label="Total Quantity" width="180" />
            <el-table-column prop="totalSold" label="Total Sold" />
            <el-table-column prop="lastUpdate" label="Last Updated" />
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import navigationBar from './NavigationView.vue';
export default {
  components: {
    navigationBar,
  },
  name: 'inventoryView',
  data() {
    return {
      productData: [
        {
          product: 'carrots',
          totalQuantity: 100,
          totalSold: 25,
          lastUpdate: '2022-01-01',
        },
      ],
      selectedMonth: null,
      selectedYear: null,
      months: [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ],
      years: Array.from({ length: 10 }, (_, i) => new Date().getFullYear() - i),
    };
  },
  methods: {
    // Add your methods here
  },
};
</script>
<style></style>
