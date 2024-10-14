<template>
  <div
    v-if="!triggerLandingPage"
    class="bg-[url('../src/assets/Images/cult-background.png')] h-screen bg-cover"
  >
    <div class="flex h-screen justify-center items-center fade-in-slide-down">
      <!-- handleLandingPage -->
      <button
        @click="handleLandingPage"
        class="p-6 rounded-full px-10 hover:bg-slate-500 hover:text-white font-bold bg-white"
      >
        Get Started
      </button>
    </div>
  </div>
  <div
    v-if="triggerLandingPage"
    class="fixed top-0 left-0 w-screen h-screen bg-[url('../src/assets/Images/raw-bg-landing-page.png')] bg-cover fade-in-slide-down"
  >
    <NavLinks @navigate-login="handleLoginPage" />
    <section>
      <div class="flex-row flex h-screen px-40">
        <div class="flex-col text-[24px]">
          <div class="flex-row text-[60px] font-extrabold drop-shadow-md">CultivaTrade</div>
          <div class="flex-row text-[30px] font-medium italic mt-10 drop-shadow-md">
            Where Freshness Meets Quality
          </div>
          <div class="flex-row mt-10">
            At CULTIVATRADE, we bring you the freshest produce straight from the fields to your
            table.
          </div>
          <div class="flex-row mt-10 w-3/6 text-start">
            Enjoy a seamless shopping experience, whether you're a consumer, retailer, or business
            owner, and support local farmers by choosing from a wide variety of vegetables, fruits,
            and more.
          </div>
          <div class="flex-row mt-10 w-3/6">
            Join us in cultivating a community that values quality, sustainability, and the essence
            of farm-to-table goodness.
          </div>
          <div class="flex-row mt-10 w-20 text-nowrap">
            <button
              @click="handleLoginPage"
              class="bg-[#1A4D2E] text-white p-6 rounded-full px-10 hover:bg-[#2c7e4d]"
            >
              SHOP NOW!
            </button>
          </div>
        </div>
        <div class="flex-col"></div>
      </div>
    </section>
  </div>
</template>

<script>
import router from '@/router';
import NavLinks from '../components/homeNavigation.vue';
export default {
  components: {
    NavLinks,
  },
  data() {
    return {
      user: JSON.parse(localStorage.getItem('user')),
      triggerLandingPage: false,
      triggerLogin: false,
    };
  },
  methods: {
    handleLandingPage() {
      this.triggerLandingPage = true;
    },
    handleLoginPage() {
      router.push('login');
    },
  },
  mounted() {},
};
</script>

<style></style>
