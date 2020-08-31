const tabs = document.querySelectorAll(".nav-link");

tabs.forEach((elem) => {
   elem.addEventListener("click", showTab)
});

function showTab(e) {
    // e.preventDefault();

    tabs.forEach((elem) => {
        elem.classList.remove("active");
    });

    this.classList.add("active");

    localStorage.setItem("activeTab", this.getAttribute("href"));
}

let value = localStorage.getItem("activeTab");

tabs.forEach((elem) => {
    elem.classList.remove("active");
});

tabs.forEach((elem) => {
    if (elem.getAttribute("href") === value)
        elem.classList.add("active");
});