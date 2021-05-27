import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if ("#banner-typed-text") {
    new Typed('#banner-typed-text', {
      strings: ["Campervans", "Hammocks", "Camping Chairs", "Tents", "Backpacks", "Survival Kits", "Cooking Gear"],
      typeSpeed: 100,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
