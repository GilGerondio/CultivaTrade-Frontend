<template>
  <navigationBar />
  <div class="bg-[#4D8734] w-full h-full min-h-screen">
    <div class="flex flex-col items-center">
      <!-- Change to flex-col and center items -->
      <img src="../../assets/Images/cultivatrade-seller.png" alt="" />

      <div class="bg-[#E0E0E0] rounded-lg bg-opacity-75 p-4 text-[#648E2A] w-1/2">
        <!-- Set a max-width for the dropdown container -->
        Status
        <div class="flex justify-start pb-2">
          <!-- Justify the select dropdown -->
          <el-select
            v-model="selectedStatus"
            placeholder="Pending"
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
        <div class="flex justify-center w-full">
          <el-table :data="tableData" :style="{ width: '100%' }">
            <el-table-column prop="fullname" label="full name" width="180" />
            <el-table-column prop="email" label="email" width="180" />
            <el-table-column prop="phone" label="phone" />
            <el-table-column label="Approval Decision">
              <template v-slot="scope">
                <el-radio-group v-model="scope.row.approvalDecision">
                  <div class="row flex">
                    <div class="col">
                      <el-radio label="approve">Approve</el-radio>
                    </div>
                    <div class="col">
                      <el-radio label="deny">Deny</el-radio>
                    </div>
                  </div>
                </el-radio-group>
              </template>
            </el-table-column>
            <el-table-column prop="status" label="status" />
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
  name: 'SampleSellerApplication',
  data() {
    return {
      selectedStatus: '',
      options: [
        { value: 'pending', label: 'Pending' },
        { value: 'complete', label: 'complete' },
      ],
      tableData: [
        {
          fullname: 'John Doe',
          email: 'johndoe@example.com',
          phone: '1234567890',
          approvalDecision: 'pending',
          status: 'Pending',
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
