<template>
  <navigationBar />
  <div class="bg-[#4D8734] w-full h-full min-h-screen">
    <div class="flex flex-col items-center">
      <div class="bg-[#E0E0E0] rounded-lg bg-opacity-75 p-4 text-[#648E2A] w-1/2 mt-10">
        <div class="row flex w-full"></div>

        <div class="flex justify-center w-full">
          <el-table :data="productData" :style="{ width: '100%' }">
            <el-table-column label="Image" width="180">
              <img :src="image" alt="image" />
            </el-table-column>
            <el-table-column prop="productName" label="Product Name" width="180" />
            <el-table-column prop="productPrice" label="Product Price" width="180" />
            <el-table-column label="Action" width="180">
              <template v-slot="scope">
                <el-button size="mini" @click="handleEdit(scope.row)">Edit</el-button>
                <el-button size="mini" @click="handleEdit(scope.row)">Add</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import navigationBar from './NavigationView.vue';
import { faker } from '@faker-js/faker';
export default {
  components: {
    navigationBar,
  },
  name: 'inventoryView',
  data() {
    return {
      productData: [
        {
          image: faker.image.avatar(),
          productName: 'Dalandan',
          productPrice: 2500,
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
