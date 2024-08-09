function initializeToggleFields() {
    const finishedCheckbox = document.querySelector('[data-toggle="true"]');
    const toggleFields = document.querySelectorAll('.toggle-fields');
  
    if (!finishedCheckbox || !toggleFields) return;
  
    function toggleFieldsVisibility() {
      if (finishedCheckbox.checked) {
        toggleFields.forEach(field => field.style.display = 'block');
      } else {
        toggleFields.forEach(field => field.style.display = 'none');
      }
    }
  
    // Initialize visibility based on the current state of the checkbox
    toggleFieldsVisibility();
  
    // Add event listener to the checkbox
    finishedCheckbox.addEventListener('change', toggleFieldsVisibility);
  }
  
  // Event listener for Turbo (Rails >= 7)
  document.addEventListener('turbo:load', initializeToggleFields);
  
  // Event listener for Turbolinks (Rails < 7)
  document.addEventListener('turbolinks:load', initializeToggleFields);
  
  // Event listener for a full page load (non-Turbo)
  document.addEventListener('DOMContentLoaded', initializeToggleFields);
  