// External imports
import "bootstrap";

// Internal imports
import { topArrow, scrollFunction, topFunction } from '../components/top_arrow';


document.addEventListener('turbolinks:load', () => {
  // flèche pour scroll jusqu'en haut (toutes les pages)
  topArrow();
});
