function quan_minus(){
	let where = document.getElementsByClassName("item__quantity_value")[0];
	let quantity = where.querySelector("[type=number]").value; 
	if (quantity == 1){
		return false;
	} else {
		quantity = Number(quantity) - 1;
		where.querySelector("[type=number]").value = quantity;
	}
}
function quan_plus(){
	let where = document.getElementsByClassName("item__quantity_value")[0];
	let quantity = where.querySelector("[type=number]").value; 
	quantity = Number(quantity) + 1;
	where.querySelector("[type=number]").value = quantity;
}