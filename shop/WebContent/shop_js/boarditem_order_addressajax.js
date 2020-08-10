let recent = document.getElementById("recent");
let newradio = document.getElementById("new");
recent.addEventListener("change", () => {
	if (recent.checked == true){
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "address.do?command=select");
		xhr.send();
		xhr.onreadystatechange = () => {
			if (xhr.readyState == 4 && xhr.status == 200){
				let text = "";
				if (xhr.responseText != null || xhr.responseText != ""){
					text = JSON.parse(xhr.responseText);
				}
				console.log(text);
				if(text == null || text == ""){
					alert("최근 저장된 주소록이 없습니다");
					newradio.checked = true;
				} else {
					let name = document.getElementById("name");
					name.value = text.user_name;
					let phone1 = document.getElementById("phone_first");
					let phone2 = document.getElementById("phone_second");
					let phone3 = document.getElementById("phone_third");
					phone1.value = text.user_phone.substring(0,3);
					phone2.value = text.user_phone.substring(3,7);
					phone3.value = text.user_phone.substring(7);
					let address1 = document.getElementById("address");
					address1.value = text.user_address_first;
					let address2 = document.getElementById("detailAddress");
					address2.value = text.user_address_second;
					let address3 = document.getElementById("extraAddress");
					address3.value = text.user_address_extra;
					let postcode = document.getElementById("postcode");
					postcode.value = text.user_postcode;
					let add_no = document.createElement("input");
					add_no.setAttribute("type","hidden");
					add_no.setAttribute("name", "address_no");
					add_no.setAttribute("value", text.address_no);
					let where = document.getElementsByTagName("form")[0];
					where.appendChild(add_no);
				}
			}
		}
	}
});
newradio.addEventListener('click', () => {
	let name = document.getElementById("name");
	name.value = "";
	let phone1 = document.getElementById("phone_first");
	let phone2 = document.getElementById("phone_second");
	let phone3 = document.getElementById("phone_third");
	phone1.value = "";
	phone2.value = "";
	phone3.value = "";
	let address1 = document.getElementById("address");
	address1.value = "";
	let address2 = document.getElementById("detailAddress");
	address2.value = "";
	let address3 = document.getElementById("extraAddress");
	address3.value = "";
	let postcode = document.getElementById("postcode");
	postcode.value = "";
});