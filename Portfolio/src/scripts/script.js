// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function () {
  // Menu icon functionality
  const menuIcon = document.querySelector('.menu-icon i');
  const navbar = document.querySelector('.navbar');

  // Toggle menu on icon click
  menuIcon.onclick = () => {
    menuIcon.classList.toggle('bx-menu');
    menuIcon.classList.toggle('bx-x');
    navbar.classList.toggle('active');
  };

  // Active link highlighting
  const sections = document.querySelectorAll('section');
  const navLinks = document.querySelectorAll('header nav a');

  window.onscroll = () => {
    sections.forEach(sec => {
      const top = window.scrollY;
      const offset = sec.offsetTop - 150;
      const height = sec.offsetHeight;
      const id = sec.getAttribute('id');

      if (top >= offset && top < offset + height) {
        navLinks.forEach(link => {
          link.classList.remove('active');
        });
        document.querySelector('header nav a[href*=' + id + ']').classList.add('active');
      }
    });

    // Reset to menu icon and close navbar when scrolling
    menuIcon.classList.add('bx-menu');
    menuIcon.classList.remove('bx-x');
    navbar.classList.remove('active');
  };

  // Initialize ScrollReveal
  const sr = ScrollReveal({
    reset: true,
    distance: '80px',
    duration: 2000,
    delay: 200
  });

  sr.reveal('.home-content, .heading', { origin: 'top' });
  sr.reveal('.home-img, .services-container, .portfolio-box, .contact form', { origin: 'bottom' });
  sr.reveal('.home-content h1, .about-img', { origin: 'left' });
  sr.reveal('.home-content p, .about-content', { origin: 'right' });

  // Initialize Typed.js
  try {
    const typed = new Typed('.multiple-text', {
      strings: ['Frontend Developer', 'Backend Developer', 'Full Stack Developer'],
      typeSpeed: 100,
      backSpeed: 100,
      backDelay: 1000,
      loop: true
    });
    console.log('Typed.js initialized successfully');
  } catch (error) {
    console.error('Error initializing Typed.js:', error);
  }
});

// Log when the script loads
console.log('Script loaded');