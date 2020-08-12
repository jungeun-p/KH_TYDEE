function readyToSubmit(){
	let number1 = document.getElementById("phone_first").value;
	let number2 = document.getElementById("phone_second").value;
	let number3 = document.getElementById("phone_third").value;
	let phone = document.createElement("input");
	phone.setAttribute("type","hidden");
	phone.setAttribute("name","user_phone");
	phone.setAttribute("value",number1+number2+number3);
	let where = document.getElementsByTagName("form")[0];
	where.appendChild(phone);
	let address1 = document.getElementById("address").value;
	let address2 = document.getElementById("detailAddress").value;
	let address3 = document.getElementById("extraAddress").value;
	let address = document.createElement("input");
	address.setAttribute("type", "hidden");
	address.setAttribute("name","address");
	address.setAttribute("value", address1 + " " + address2 + " " + address3);
	where.appendChild(address);
	let item_name = document.getElementsByName("item_name")[0].value;
	let item_number = document.getElementsByName("item_number")[0].value;
	let item_lead_name = document.createElement("input");
	item_lead_name.setAttribute("type","hidden");
	item_lead_name.setAttribute("name","item_lead_name");
	if (Number(item_number) > 1){
		item_lead_name.setAttribute("value", item_name + " 외 " + item_number + "종");
	} else {
		item_lead_name.setAttribute("value", item_name);			
	}
	where.appendChild(item_lead_name);
	
	let recentradio = document.getElementById("recent");
	if (recentradio.checked == true) {
		where.setAttribute("action", "order.do?command=order");
	} else {
		where.setAttribute("action", "address.do?command=insert");
	}
}