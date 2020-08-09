function makeapopup(jspname){
    let popupWidth = 400;
    let popupHeight = 500;
    let popupX = (window.screen.width / 2) - (popupWidth / 2);
    let popupY = (window.screen.height / 2) - (popupHeight / 2);
    let options = "top=" + popupY + ", left=" + popupX + ", width=" + popupWidth + ", height=" + popupHeight + ", status=no, menubar=no, toolbar=no, resizable=no";
    window.open(jspname, "popup", options);
}