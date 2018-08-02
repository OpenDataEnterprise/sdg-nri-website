import Config from 'config'; // Aliased via WebPack.

export const init = () => {
  // Initialize the command queue in case analytics.js hasn't loaded yet.
  window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};
  ga('create', Config.analyticsID, 'auto');
  ga('set', 'transport', 'beacon');
  ga('send', 'pageview');
};
