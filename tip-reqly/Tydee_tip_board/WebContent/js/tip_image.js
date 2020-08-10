let add = document.getElementById("addarea");

add.addEventListener("click", () => {
	
	 let imagediv = document.createElement("div");
     imagediv.setAttribute("class", "pop__content_box")

     let image = document.createElement("input");
     image.setAttribute("class", "pop__content");
     image.setAttribute("type", "button");
     image.setAttribute("value", "업로드");
     image.setAttribute("onclick", "makeapopup('mytydee_popup.jsp')");
     imagediv.appendChild(image);
     let spanimg = document.createElement("span");
     spanimg.textContent = "이미지 없음";
     imagediv.appendChild(spanimg);
	
	
});