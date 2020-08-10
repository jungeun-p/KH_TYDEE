function quan_minus(no){
	let where = document.getElementById(no);
	let quantity = where.querySelector("[type=number]").value; 
	if (quantity == 1){
		return false;
	} else {
		quantity = Number(quantity) - 1;
		where.querySelector("[type=number]").value = quantity;
	}
}
function quan_plus(no){
	let where = document.getElementById(no);
	let quantity = where.querySelector("[type=number]").value; 
	quantity = Number(quantity) + 1;
	where.querySelector("[type=number]").value = quantity;
}
function quan_change(no){
	let up = document.createElement("input");
	up.setAttribute("type","hidden");
	up.setAttribute("name","command");
	up.setAttribute("value","update");
	let where = document.getElementById(no);
	let form = where.getElementsByTagName("form")[0];
	form.appendChild(up);
	form.submit();
}
function quan_delete(no){
	let del = document.createElement("input");
	del.setAttribute("type","hidden");
	del.setAttribute("name","command");
	del.setAttribute("value","delete");
	let where = document.getElementById(no);
	let form = where.getElementsByTagName("form")[0];
	form.appendChild(del);
	form.submit();
}