<template>
  <navigationBar />
  <div class="bg-[#4D8734] w-full h-full min-h-screen">
    <div class="flex flex-col items-center">
      <img src="../../assets/Images/cultivatrade-report.png" alt="" />
      <div class="bg-[#E0E0E0] rounded-lg p-4 w-1/2">
        <div class="flex w-full items-center justify-center">
          <div class="w-full text-center text-[40px] fw-bold">Report</div>
        </div>
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
          <div class="col ms-4">
            <el-upload
              v-model:file-list="fileList"
              class="upload-demo"
              action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
              multiple
              :on-preview="handlePreview"
              :on-remove="handleRemove"
              :before-remove="beforeRemove"
              :limit="3"
              :on-exceed="handleExceed"
            >
              <el-button type="primary">Click to upload</el-button>
              <template #tip>
                <div class="el-upload__tip">jpg/png files with a size less than 500KB.</div>
              </template>
            </el-upload>
          </div>
        </div>
        <div class="flex justify-around gap-x-6">
          <div
            class="bg-white shadow-md rounded-lg p-6 w-1/4 text-center hover:transition-all hover:-translate-y-2"
          >
            <h3 class="text-lg font-bold">Total Users</h3>
            <p class="text-2xl">{{ totalUsers }}</p>
          </div>
          <div
            class="bg-white shadow-md rounded-lg p-6 w-1/4 text-center hover:transition-all hover:-translate-y-2"
          >
            <h3 class="text-lg font-bold">Total Products</h3>
            <p class="text-2xl">{{ totalProducts }}</p>
          </div>
          <div
            class="bg-white shadow-md rounded-lg p-6 w-1/4 text-center hover:transition-all hover:-translate-y-2"
          >
            <h3 class="text-lg font-bold">Total Revenue</h3>
            <p class="text-2xl">{{ totalRevenue }}</p>
          </div>
          <div
            class="bg-white shadow-md rounded-lg p-6 w-1/4 text-center hover:transition-all hover:-translate-y-2"
          >
            <h3 class="text-lg font-bold">Sales Made</h3>
            <p class="text-2xl">{{ totalSales }}</p>
          </div>
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
      totalUsers: 120,
      totalProducts: 120,
      totalRevenue: 120,
      totalSales: 50,
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
