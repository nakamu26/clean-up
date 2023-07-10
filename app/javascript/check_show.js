function check (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/normal_reports/${gon.normal_report_id}/check_normal_reports`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    submit.setAttribute("style", "display:none;");
    const checkBtn = document.getElementById("check-btn");
    const html = `
      <div class='check-complete'>
        チェック済み
      </div>`;
    checkBtn.insertAdjacentHTML("afterbegin", html);
  });
};

window.addEventListener('load', check);
