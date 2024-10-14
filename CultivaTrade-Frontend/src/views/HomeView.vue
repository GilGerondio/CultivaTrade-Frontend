<template>
  <div class="h-full mb-10">
    <nav class="flex items-center justify-between flex-wrap px-9">
      <div class="flex items-center flex-shrink-0 text-black">
        <button
          @click="btnViewHomePage"
          class="block mt-4 lg:inline-block lg:mt-0 text-black text-[30px] font-semibold drop-shadow-sm mr-4"
        >
          HOME
        </button>
      </div>

      <div class="w-full block flex-grow lg:flex lg:items-center lg:w-auto ml-auto">
        <div class="text-sm lg:flex-grow flex justify-end">
          <button
            @click="btnViewAllNotifications"
            class="block mt-4 lg:inline-block lg:mt-0 text-black text-[24px] mr-4 hover:-translate-y-1 hover:transition-all"
          >
            Notification
          </button>
          <a
            href="#responsive-header"
            class="block mt-4 lg:inline-block lg:mt-0 text-black text-[24px] mr-4 hover:-translate-y-1 hover:transition-all"
            >Prices</a
          >
          <a
            href="#responsive-header"
            class="block mt-4 lg:inline-block lg:mt-0 text-black text-[24px] hover:-translate-y-1 hover:transition-all"
            >Message</a
          >
          <button
            @click="btnAddToCart"
            class="block ms-4 me-4 mt-4 lg:inline-block lg:mt-0 text-black text-[24px] hover:-translate-y-1 hover:transition-all"
          >
            My Cart
          </button>
          <button
            @click="btnOpenProfile"
            class="block mt-4 lg:inline-block lg:mt-0 text-black text-[24px] hover:-translate-y-1 hover:transition-all"
          >
            Profile
          </button>
        </div>
        <div class="ms-4">
          <button
            @click="btnSellNow"
            class="inline-block text-sm px-4 py-2 leading-none border rounded text-black border-black hover:border-[#151515] text-[20px] mt-4 lg:mt-0 hover:bg-[#252424] hover:text-white hover:-translate-y-1 hover:transition-all"
          >
            Sell Now
          </button>
        </div>
        <div class="ms-4 mt-4">
          <button @click="logout" class="hover:-translate-y-1 hover:transition-all">
            <img src="../assets/Images/icon-logout.png" alt="logout" />
          </button>
        </div>
      </div>
    </nav>
    <!-- toggleSellerRegistration-->
    <div v-if="toggleViewRegisterSeller">
      <div class="flex justify-center items-center">
        <div class="border h-screen w-1/2 p-6 drop-shadow-2xl shadow-xl rounded-xl">
          <div class="flex text-[32px] font-semibold mb-4">Seller Registration</div>
          <div class="flex text-[32px] font-normal mb-4">
            Please fill out the necessary information
          </div>
          <el-form label-position="top" class="w-auto">
            <el-form-item label="Farm Name">
              <el-input
                v-model="form.farm.name"
                class="w-full rounded h-11"
                placeholder="Enter Farm name"
            /></el-form-item>
            <el-form-item label="Farm Address">
              <el-input
                v-model="form.farm.address"
                class="w-full rounded h-11"
                placeholder="Enter Address"
            /></el-form-item>
            <el-form-item label="Farm Description">
              <el-input
                v-model="form.farm.description"
                class="w-full rounded h-11"
                placeholder="Enter Description"
            /></el-form-item>
            <el-form-item class="mt-2" label="Attach your business permit here">
              <input
                :v-model="form.farm.permit"
                type="file"
                class="w-full rounded h-11"
                @change="handleFileUpload"
                accept=".pdf,.jpg,.jpeg,.png"
              />
            </el-form-item>
          </el-form>
          <div class="flex justify-center mt-20">
            <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
              Submit Application
            </button>
          </div>
          <div class="row flex">
            <div class="col flex items-end">
              <img
                class="bottom-0"
                src="../assets/Images/seller-logo-bg.png"
                style="height: 45%"
                alt="logo"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- toggleViewHomePage -->
    <div v-if="toggleViewHomePage">
      <div
        class="flex flex-col w-full bg-[url('../assets/Images/cultivate-bg-home.png')] bg-no-repeat bg-cover border h-[500px]"
      >
        <div class="flex items-center justify-start w-[206px] h-[90px]">
          <img
            src="../assets/Images/cultivatradeLogo.png"
            alt="Logo"
            style="width: 100%; height: 100%; object-fit: contain"
          />
        </div>
        <div class="flex flex-col fade-in-slide-down">
          <div class="text-white flex flex-col ps-96">
            <div class="text-[36px] font-bold">Fresh from the Farm to Your Table</div>
            <div class="text-[24px] mt-5 w-9/12">
              Experience the taste of freshness with produce sourced directly from local farmers.
              Our marketplace connects you to the best fruits and vegetables, ensuring top quality
              while empowering our community growers. Enjoy the bounty of nature and support our
              local farmers
            </div>
            <div>
              <button
                class="p-4 mt-9 rounded bg-[#1A4D2E] text-white text-[16px] hover:bg-[#297346]"
              >
                Browse Produce
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Featured Products Section -->
      <div class="flex flex-row items-center justify-center p-5">
        <div class="container">
          <div class="flex flex-row text-[32px]">Featured Products</div>
          <div class="grid grid-cols-4 gap-4 mt-2 h-[500px] overflow-y-scroll">
            <div
              v-for="(product, index) in products"
              :key="index"
              class="rounded-lg shadow-lg p-4 flex flex-col"
            >
              <img :src="product.image" alt="Product Image" class="w-full h-[150px] object-cover" />
              <div class="mt-4">
                <div class="flex flex-row w-full items-center justify-between">
                  <!-- Left side with name and price -->
                  <div class="flex flex-col">
                    <p class="text-lg font-semibold">{{ product.name }}</p>
                    <p class="text-green-500">{{ product.price }}</p>
                  </div>
                  <div>
                    <button
                      @click="btnAddToCart"
                      class="p-2 bg-[#008475] text-white rounded w-8 h-8 flex items-center justify-center"
                    >
                      <i class="bi bi-plus-lg"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="flex flex-row justify-center items-center">
        <button @click="btnViewAllProducts" class="p-4 px-4 bg-[#1A4D2E] text-white rounded">
          View All Products
        </button>
      </div>
    </div>
  </div>
  <!-- View Add to Card -->
  <!-- toggleViewCart -->
  <div v-if="toggleViewCart" class="flex flex-col w-full justify-center items-center">
    <!-- Back Button Row -->
    <div class="flex justify-start w-full border-red-500 p-2">
      <button @click="btnViewHomePage" class="px-9">
        <i class="bi bi-arrow-left text-lg font-bold"></i>
      </button>
    </div>

    <!-- Content Wrapper -->
    <div class="flex flex-row justify-center w-full max-w-[1200px]">
      <!-- 1st column -->
      <div class="flex flex-col p-4">
        <div class="flex flex-row p-5 bg-[#EDEBE9] justify-center">
          <img :src="sampleImage" alt="sampleImage" class="h-[300px] w-[350px]" />
        </div>
        <div class="flex flex-row gap-x-4 justify-center p-5">
          <div class="flex flex-col p-2 bg-[#EDEBE9] h-[150px] w-[150px]">
            <img :src="sampleImage" alt="sampleImage" />
          </div>
          <div class="flex flex-col p-2 bg-[#EDEBE9] h-[150px] w-[150px]">
            <img :src="sampleImage" alt="sampleImage" />
          </div>
          <div class="flex flex-col p-2 bg-[#EDEBE9] h-[150px] w-[150px]">
            <img :src="sampleImage" alt="sampleImage" />
          </div>
        </div>
      </div>

      <!-- 2nd column -->
      <div class="flex flex-col max-w-[600px] p-4">
        <div class="text-[46px] font-semibold">{{ sampleName }}</div>
        <div class="">{{ sampleName }}</div>
        <div class="flex flex-row gap-x-2 mt-2">
          <div class="flex flex-col">
            <button
              class="px-2 bg-[#F46036] border rounded-md border-[#F46036] text-[#F46036] bg-opacity-[10px] text-[24px]"
            >
              Php{{ sampleInt }}
            </button>
          </div>
          <div class="flex flex-col items-center justify-center text-[#1B998B] text-[20px]">
            Recently listed
          </div>
        </div>
        <div class="flex flex-row text-[#82828B] text-[20px] w-full">
          Experience the crisp freshness of our Pechay, harvested straight from the fertile fields
          of San Fernando. This leafy green, also known as Chinese cabbage, is a staple in many
          dishes, adding a delightful crunch and a burst of nutrition.
        </div>
        <div class="flex flex-row mt-9">
          <div class="flex flex-col text-[14px] font-medium items-center me-3">By Kilo</div>
          <div class="flex flex-col me-3">
            <el-form>
              <el-form-item><el-input aria-placeholder="3"></el-input></el-form-item>
            </el-form>
          </div>
          <div class="flex flex-col">
            <button class="bg-[#F46036] text-white px-3 p-3 rounded">Add to Cart</button>
          </div>
        </div>
      </div>
    </div>
    <div class="flex flex-row border-b-2 w-full"></div>
    <div class="flex flex-row justify-start gap-x-5 w-full p-4 items-center">
      <div class="flex flex-col">
        <img :src="sampleImage" class="rounded-full h-[57px] w-[57px]" />
      </div>
      <div class="flex flex-col text-[36px] font-semibold">{{ sampleName }}</div>
      <div class="flex flex-col text-[15px] font-medium"><button>View</button></div>
      <div class="flex flex-col text-[15px] font-medium"><button>Message this seller</button></div>
    </div>
    <div class="flex flex-row justify-start w-full p-4">{{ sampleDescription }}</div>
  </div>

  <!-- View All Products -->
  <!-- toggleViewAllProducts -->
  <div v-if="toggleViewAllProducts">
    <el-form class="justify-end me-3 items-center flex mb-4">
      <div class="flex items-center space-x-2">
        <el-input
          v-model="searchCalendar"
          placeholder="Type at least 3 letters to search products"
          class="filterInput"
          clearable
          :style="{ width: '300px' }"
        />
        <button
          class="flex items-center justify-center p-2 text-white bg-blue-500 rounded hover:bg-blue-600"
          @click="search"
        >
          <i class="bi bi-search"></i>
        </button>
      </div>
    </el-form>
    <div
      class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-9 p-10 h-[1000px] overflow-y-scroll"
    >
      <div
        v-for="(product, index) in products"
        :key="index"
        class="rounded-lg shadow-lg p-4 flex flex-col"
      >
        <img :src="product.image" alt="Product Image" class="w-full h-[150px] object-cover" />
        <div class="mt-4">
          <div class="flex flex-row w-full items-center justify-between">
            <div class="flex flex-col">
              <p class="text-lg font-semibold">{{ product.name }}</p>
              <p class="text-lg font-semibold">{{ product.personName }}</p>
              <p class="text-green-500">{{ product.price }}</p>
            </div>
            <div>
              <div class="flex flex-row gap-x-2">
                <div class="flex flex-col">
                  <p class="text-[#989595]">{{ product.days }} Days</p>
                </div>
                <div class="flex flex-col">
                  <button
                    class="p-2 bg-[#008475] text-white rounded w-8 h-8 flex items-center justify-center"
                  >
                    <i class="bi bi-plus-lg"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div v-if="toggleViewAllNotification">
    <div class="flex justify-center items-center">
      <div class="border h-screen w-1/2 p-6 drop-shadow-2xl shadow-xl rounded-xl">
        <div class="flex text-[32px] font-semibold mb-4">Notification</div>
        <div class="overflow-y-scroll h-[70%]">
          <div
            v-for="(notification, index) in notifications"
            :key="index"
            @click="btnOpenOrderUpdate(notification)"
            class="flex justify-between items-center mt-10 border-b pb-4 cursor-pointer hover:bg-gray-100 p-4 rounded-lg transition duration-150 ease-in-out relative"
          >
            <div class="flex flex-row items-center">
              <div class="flex flex-col">
                <img :src="notification.image" alt="notification" class="w-16 h-16 rounded-full" />
              </div>
              <div class="flex flex-col ms-4">
                <div class="text-[14px] font-semibold">{{ notification.orderUpdate }}</div>
                <div class="text-[13px] text-[#717171]">{{ notification.date }}</div>
              </div>
            </div>
            <div class="flex">
              <button class="text-xl z-10" @click.stop>
                <i class="bi bi-x-lg"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- <div v-if="toggleOrderUpdate">
    <el-dialog
      title="Order Update"
      visible.sync:visible="toggleOrderUpdate"
      width="30%"
      class="modal-custom"
    >
      <div class="flex flex-col space-y-4">
        <div class="flex items-center space-x-3">
          <i class="bi bi-box"></i>
          <p>Seller is preparing your package...</p>
        </div>
        <div class="flex items-center space-x-3">
          <i class="bi bi-truck"></i>
          <p>Your package is on the way...</p>
        </div>
        <div class="flex items-center space-x-3">
          <i class="bi bi-clock"></i>
          <p>Estimated delivery time: 30 mins...</p>
        </div>
        <div class="flex items-center space-x-3">
          <i class="bi bi-geo-alt"></i>
          <p>The package reached its destination.</p>
        </div>
      </div>
      <template v-slot:footer>
        <span class="dialog-footer">
          <el-button type="success" @click="markAsReceived">Order Received</el-button>
          <el-button type="warning" @click="leaveReview">Leave a Review</el-button>
        </span>
      </template>
    </el-dialog>
  </div> -->
  <div v-if="toggleViewProfile">
    <div class="flex w-100 bg-[#508D4E] h-[326px] opacity-[77px]">
      <div class="flex justify-center items-center w-full">
        <img :src="sampleImage" alt="profile" class="rounded-full translate-y-32" />
      </div>
    </div>
    <div class="flex flex-row justify-between items-center px-5">
      <div class="flex flex-col text-[64px] font-semibold">{{ sampleName }}</div>
      <div class="flex flex-col justify-center">
        <button @click="btnEditProfile" class="rounded p-2 px-4 border border-black">
          Edit Profile
        </button>
      </div>
    </div>
    <div class="p-5">
      <div class="flex flex-row text-[40px] opacity-[69%]">Email:{{ sampleEmail }}</div>
      <div class="flex flex-row text-[40px] opacity-[69%] mt-10">
        Contact Number::{{ sampleNumber }}
      </div>
      <div class="flex flex-row text-[40px] opacity-[69%] mt-10">Address:{{ sampleAddress }}</div>
      <div class="flex flex-row text-[40px] opacity-[69%] mt-10">City:{{ sampleCity }}</div>
    </div>
  </div>
  <div v-if="toggleEditProfile">
    <div class="flex justify-center items-center">
      <div class="border h-screen w-1/2 p-6 drop-shadow-2xl shadow-xl rounded-xl">
        <div class="flex flex-row justify-between">
          <div class="flex flex-col text-[45px] font-semibold">Edit Profile</div>
          <div class="flex flex-col justify-center items-center">
            <div class="flex flex-row justify-center items-center gap-x-2">
              <div class="flex flex-col">
                <button class="p-3 bg-[#2E8751] rounded text-white text-[19px]">
                  Upload Image
                </button>
              </div>
              <div class="flex flex-col">
                <img
                  :src="sampleImage"
                  alt="sampleImage"
                  class="rounded-full w-[120px] h-[120px]"
                />
              </div>
            </div>
          </div>
        </div>

        <!-- el-form starts here -->
        <el-form :model="formData" label-position="top" class="mt-8">
          <div class="grid grid-cols-2 gap-x-8 gap-y-4 text-[26px]">
            <el-form-item label="First Name">
              <el-input v-model="formData.firstName" class="h-[50px]" />
            </el-form-item>
            <el-form-item label="Last Name">
              <el-input v-model="formData.lastName" class="h-[50px]" />
            </el-form-item>
            <el-form-item label="Email" class="col-span-2">
              <el-input v-model="formData.email" class="h-[50px]" />
            </el-form-item>
            <el-form-item label="Address" class="col-span-2">
              <el-input v-model="formData.address" class="h-[50px]" />
            </el-form-item>
            <el-form-item label="Contact Number" class="col-span-2">
              <el-input v-model="formData.contactNumber" class="h-[50px]" />
            </el-form-item>
            <el-form-item label="City">
              <el-input v-model="formData.city" class="h-[50px]" />
            </el-form-item>
            <el-form-item label="Password">
              <el-input v-model="formData.password" type="password" class="h-[50px]" />
            </el-form-item>
          </div>
        </el-form>
        <!-- el-form ends here -->
      </div>
    </div>
  </div>
</template>

<script>
import { faker } from '@faker-js/faker';
export default {
  data() {
    return {
      // user: JSON.parse(localStorage.getItem('user')),
      sampleDescription: faker.commerce.productDescription(),
      sampleInt: faker.number.int({ max: 100 }),
      sampleImage: faker.image.avatar(),
      sampleName: faker.person.fullName(),
      sampleEmail: faker.internet.email(),
      sampleNumber: faker.phone.number(),
      sampleAddress: faker.location.secondaryAddress(),
      sampleCity: faker.location.city(),
      toggleViewHomePage: true,
      toggleViewCart: false,
      toggleViewAllProducts: false,
      toggleViewAllNotification: false,
      toggleOrderUpdate: false,
      toggleEditProfile: false,
      products: this.generateProducts(20),
      notifications: this.generateNotifications(9),
      toggleViewProfile: false,
      searchCalendar: '',
      form: {
        farm: {
          name: '',
          address: '',
          description: '',
          permit: null,
        },
      },
      formData: {
        firstName: '',
        lastName: '',
        email: '',
        address: '',
        contactNumber: '',
        city: '',
        password: '',
      },
    };
  },
  methods: {
    handleFileUpload(event) {
      const file = event.target.files[0];
      this.form.farm.permit = file;
    },
    generateProducts(count) {
      let products = [];
      for (let i = 0; i < count; i++) {
        products.push({
          name: faker.commerce.productName(),
          personName: faker.person.fullName(),
          price: `Php ${faker.commerce.price()}`,
          image: faker.image.avatar(640, 480, true),
          days: faker.number.int({ min: 10, max: 30, multipleOf: 3 }),
        });
      }
      return products;
    },
    generateNotifications(count) {
      let notifications = [];
      for (let i = 0; i < count; i++) {
        notifications.push({
          orderUpdate: 'Order Update',
          personName: faker.person.fullName(),
          date: `July ${faker.number.int({ min: 10, max: 30 })}, 2024`,
          image: faker.image.avatar(640, 480, true),
        });
      }
      return notifications;
    },
    btnViewAllProducts() {
      this.toggleViewCart = false;
      this.toggleViewAllProducts = true;
      this.toggleViewHomePage = false;
      this.toggleViewAllNotification = false;
      this.toggleEditProfile = false;
    },
    btnSellNow() {
      this.toggleViewRegisterSeller = true;
      this.toggleViewCart = false;
      this.toggleViewProfile = false;
      this.toggleViewAllNotification = false;
      this.toggleViewAllProducts = false;
      this.toggleViewHomePage = false;
      this.toggleEditProfile = false;
    },
    btnViewAllNotifications() {
      this.toggleViewRegisterSeller = false;
      this.toggleViewCart = false;
      this.toggleViewProfile = false;
      this.toggleViewAllNotification = true;
      this.toggleViewAllProducts = false;
      this.toggleViewHomePage = false;
      this.toggleEditProfile = false;
    },
    btnViewHomePage() {
      this.toggleViewRegisterSeller = false;
      this.toggleViewCart = false;
      this.toggleViewHomePage = true;
      this.toggleViewAllNotification = false;
      this.toggleViewAllProducts = false;
      this.toggleViewProfile = false;
      this.toggleEditProfile = false;
    },
    btnOpenOrderUpdate() {
      this.toggleViewRegisterSeller = false;
      this.toggleViewCart = false;
      this.toggleOrderUpdate = true;
    },
    btnOpenProfile() {
      this.toggleViewRegisterSeller = false;
      this.toggleViewCart = false;
      this.toggleViewProfile = true;
      this.toggleViewAllProducts = false;
      this.toggleViewHomePage = false;
      this.toggleOrderUpdate = false;
      this.toggleViewAllNotification = false;
      this.toggleEditProfile = false;
    },
    btnEditProfile() {
      this.toggleViewRegisterSeller = false;
      this.toggleViewCart = false;
      this.toggleViewProfile = false;
      this.toggleEditProfile = true;
      this.toggleViewAllProducts = false;
      this.toggleViewHomePage = false;
      this.toggleOrderUpdate = false;
      this.toggleViewAllNotification = false;
    },
    btnAddToCart() {
      this.toggleViewRegisterSeller = false;
      this.toggleViewCart = true;
      this.toggleViewProfile = false;
      this.toggleEditProfile = false;
      this.toggleViewAllProducts = false;
      this.toggleViewHomePage = false;
      this.toggleOrderUpdate = false;
      this.toggleViewAllNotification = false;
    },
    search() {
      if (this.searchCalendar.length >= 3) {
        console.log('Searching for:', this.searchCalendar);
      }
    },
    logout() {
      localStorage.clear();
      window.location.replace('/login');
    },
  },
  mounted() {
    console.log(this.user);
    // if (this.user == null) {
    //   window.location.replace('/login');
    // }
  },
};
</script>

<style></style>
