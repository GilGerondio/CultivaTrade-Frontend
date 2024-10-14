<template>
  <navigationBar />
  <div class="bg-[#4D8734] w-full h-full min-h-screen">
    <div class="flex flex-col items-center">
      <img src="../../assets/Images/cultivatrade-marketplace.png" alt="" />

      <div class="bg-[#E0E0E0] rounded-lg bg-opacity-75 p-4 text-[#648E2A] w-1/2">
        Category
        <div class="flex justify-start pb-2">
          <el-select
            v-model="selectedCategory"
            placeholder="Buyers"
            size="large"
            style="width: 240px"
          >
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </div>
        <div v-if="selectedCategory === 'products'" class="flex justify-center w-full">
          <el-table :data="productsData" :style="{ width: '100%' }">
            <el-table-column prop="productName" label="Prduct name" width="180" />
            <el-table-column prop="quantity" label="quantity" width="180" />
            <el-table-column prop="price" label="price" />
            <el-table-column prop="seller" label="seller" />
            <el-table-column label="remove">
              <template v-slot="scope">
                <el-radio-group v-model="scope.row.removeAction">
                  <div class="row flex">
                    <div class="col me-2">
                      <el-radio label="approve">Yes</el-radio>
                    </div>
                    <div class="col">
                      <el-radio label="deny">No</el-radio>
                    </div>
                  </div>
                </el-radio-group>
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div v-if="selectedCategory === 'buyers'" class="flex justify-center w-full">
          <el-table :data="buyersData" :style="{ width: '100%' }">
            <el-table-column prop="fullName" label="Full name" width="180" />
            <el-table-column prop="email" label="email" width="180" />
            <el-table-column prop="phoneNumber" label="Phone number" />
            <el-table-column prop="Address" label="Address" />
          </el-table>
        </div>
        <div v-if="selectedCategory === 'sellers'" class="flex justify-center w-full">
          <el-table :data="sellersData" :style="{ width: '100%' }">
            <el-table-column prop="fullName" label="Full name" width="180" />
            <el-table-column prop="email" label="email" width="180" />
            <el-table-column prop="phoneNumber" label="Phone number" />
            <el-table-column prop="inventory" label="Inventory" />
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
  name: 'marketplaceView',
  data() {
    return {
      selectedCategory: 'products',
      tableBuyer: false,
      tableSeller: false,
      tableProduct: false,
      options: [
        { value: 'products', label: 'Products' },
        { value: 'buyers', label: 'Buyers' },
        { value: 'sellers', label: 'Sellers' },
      ],
      productsData: [
        {
          productName: 'Apple',
          quantity: '100kg',
          price: '25',
          seller: '2024-01-16 | 10:05 AM',
        },
      ],
      buyersData: [
        {
          fullName: 'Karl Delfin Smith',
          email: 'dwieghtpro@gmail.com',
          phoneNumber: '09096310324',
          Address: 'Cebu City Araneta Colloseum',
        },
      ],
      sellersData: [
        {
          fullName: 'Wilson Abonda',
          email: 'asds@gmail.com',
          phoneNumber: '0909612325',
          inventory: 'View Inventory',
        },
      ],
      // Add your data here
    };
  },
  methods: {
    // Add your methods here
  },
};
</script>
<style></style>
