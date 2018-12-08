export default class Sidebar {
  constructor() {
    const button = document.querySelector('[data-toggle="sidebar"]');
    const sidebar = document.querySelector('.sidebar');
    const mainContent = document.querySelector('.dashboard__container');

    button.addEventListener("click", (e) => {
      e.preventDefault();
      sidebar.classList.toggle('open');
      mainContent.classList.toggle('translated');
    });

  }
}