<template>
  <div class="h-screen w-screen bg-gray-100 font-sans">
    <div class="flex flex-row h-screen justify-center items-center border border-black">
      <!-- Right Section -->
      <div
        class="flex flex-col w-1/2 p-4 bg-[url('../src/assets/Images/loginBackground.png')] h-screen"
      ></div>
      <!-- Left Section -->
      <div class="flex flex-col justify-start w-1/2">
        <div class="flex flex-col justify-center p-8 fade-in-slide-down">
          <div class="flex flex-row justify-center w-full">
            <el-form class="w-auto" label-position="top">
              <el-upload
                ref="uploader"
                v-model:file-list="fileList"
                action="getUploadTrigger"
                list-type="picture-card"
                :on-success="onSuccess"
                :on-preview="onPreview"
                :on-remove="onRemove"
                :before-upload="beforeUpload"
                method="get"
                accept="image/jpeg, image/png, image/jpg"
                :limit="1"
                :on-exceed="onExceed"
              >
                <i class="bi bi-plus"></i>
              </el-upload>
              <!-- First Name -->
              <el-form-item label="First Name" class="w-[427px] h-[76px]">
                <el-input
                  v-model="form.firstname"
                  class="w-full rounded h-11"
                  placeholder="Enter First Name"
                  maxlength="50"
                  show-word-limit
                />
              </el-form-item>
              <!-- Last Name -->
              <el-form-item label="Last Name" class="w-[427px] h-[76px]">
                <el-input
                  v-model="form.lastname"
                  class="w-full rounded h-11"
                  placeholder="Enter Last Name"
                  maxlength="50"
                  show-word-limit
                />
              </el-form-item>
              <!-- Contact Number -->
              <el-form-item label="Contact Number" class="w-[427px] h-[76px]">
                <el-input
                  v-model="form.phone"
                  class="w-full rounded h-11"
                  placeholder="Enter Contact number"
                  maxlength="11"
                  show-word-limit
                  :formatter="(value) => value.replace(/\D/g, '')"
                />
              </el-form-item>
              <!-- Address -->
              <el-form-item label="Address" class="w-[427px] h-[76px]">
                <el-input
                  v-model="form.address"
                  class="w-full rounded h-11"
                  placeholder="Enter Address"
                />
              </el-form-item>
              <!-- Email -->
              <el-form-item label="Email" class="w-[427px] h-[76px]">
                <el-input
                  v-model="form.email"
                  class="w-full rounded h-11"
                  placeholder="Enter Email"
                  maxlength="50"
                  show-word-limit
                />
              </el-form-item>
              <!-- Password -->
              <el-form-item class="w-[427px] h-[76px]">
                <div>Password</div>
                <el-input
                  v-model="form.password1"
                  type="password"
                  class="w-full rounded h-11"
                  placeholder="Enter password"
                />
              </el-form-item>
              <!-- Confirm Password -->
              <el-form-item class="w-[427px] h-[76px]">
                <div>Confirm Password</div>
                <el-input
                  v-model="form.password2"
                  type="password"
                  class="w-full h-11"
                  placeholder="Confirm Password"
                />
              </el-form-item>

              <!-- Login Button -->
              <el-form-item class="w-[427px]">
                <button
                  type="button"
                  class="bg-[#3e6b27] w-full !important text-white hover:bg-[#5e9d3f]"
                  @click="submitForm"
                >
                  Sign Up
                </button>
              </el-form-item>
              <div class="flex w-full justify-center items-center">
                <a href="./login">
                  Already have and account? <span class="text-blue-600"> Login Now</span>
                </a>
              </div>
            </el-form>
          </div>
        </div>
      </div>
    </div>
    <!-- START PREVIEW IMAGE DIALOG -->
    <el-dialog v-model="dialog.previewImage" :before-close="clear">
      <div class="content-center">
        <div>
          <img :src="previewImg" style="width: 300px" />
        </div>
      </div>
    </el-dialog>
    <!-- END PREVIEW IMAGE DIALOG -->
  </div>
</template>

<script>
import router from '@/router';
import axios from 'axios';
import { ElMessage, ElLoading } from 'element-plus';

export default {
  data() {
    return {
      form: {
        firstname: '',
        lastname: '',
        phone: '',
        email: '',
        address: '',
        password1: '',
        password2: '',
      },
      dialog: {
        previewImage: false,
      },
      isView: false,
      fileList: [],
      file: [],
      previewImg: '',
    };
  },
  methods: {
    async submitForm() {
      const loading = ElLoading.service({
        lock: true,
        text: 'Please wait...',
        background: 'rgba(0, 0, 0, 0.7)',
      });

      if (
        this.form.firstname == '' ||
        this.form.lastname == '' ||
        this.form.phone == '' ||
        this.form.email == '' ||
        this.form.address == '' ||
        this.form.password1 == '' ||
        this.form.password2 == ''
      ) {
        setTimeout(() => {
          loading.close();
        }, 1000);
        setTimeout(() => {
          ElMessage.error('Please input required fields');
        }, 1000);

        return;
      }

      if (this.form.password1 != this.form.password2) {
        setTimeout(() => {
          loading.close();
        }, 1000);
        setTimeout(() => {
          ElMessage.error('Password not match');
        }, 1000);
        return;
      }

      const formData = new FormData();
      this.file.forEach((file) => {
        formData.append('firstname', this.form.firstname);
        formData.append('lastname', this.form.lastname);
        formData.append('phone', this.form.phone);
        formData.append('email', this.form.email);
        formData.append('password', this.form.password1);
        formData.append('address', this.form.address);
        formData.append('profileImage', file);
      });
      await axios
        .post(`${this.url}/User`, formData)
        .then((response) => {
          if (response.data == 'success') {
            ElMessage.success('Account created successfully');
            window.location.replace('/login');
          } else if (response.data == 'error') {
            ElMessage.error('Failed to create account');
          } else if (response.data == 'exists') {
            ElMessage.error('Email already exists');
          } else {
            console.log(response.data);
          }
          loading.close();
        })
        .catch(() => {
          loading.close();
          ElMessage.error('Something went wrong');
        });
    },

    clear() {
      this.dialog.previewImage = false;
    },

    onExceed(files) {
      this.$refs.uploader.clearFiles();
      this.$refs.uploader.handleStart(files[0]);
    },

    // PREVIEW IMAGE
    onPreview(file) {
      this.previewImg = file.url || file.thumbUrl;
      this.dialog.previewImage = true;
    },

    // SELECTED IMAGES
    onSuccess(res, file) {
      this.file.push(file.raw);
    },

    // REMOVE SELECTED IMAGE
    onRemove(file) {
      this.file = this.file.filter((f) => f.uid !== file.uid);
    },

    // CHECK FILE FORMAT / FILE SIZE
    beforeUpload(file) {
      if (file.type !== 'image/jpeg' && file.type !== 'image/png') {
        ElMessage.warning('File type should be JPG, PNG');
        return false;
      }
      if (file.size > 10000000) {
        ElMessage.warning('File size should be less than 10MB');
        return false;
      }
    },
  },
};
</script>

<style scoped>
.el-input {
  width: 100%;
}
</style>
