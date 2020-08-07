let edit = document.getElementById("editarea");
let del = document.getElementById("deletearea");
let add = document.getElementById("addarea");

document.addEventListener("DOMContentLoaded", () => {
	let tiny_no;
	let name = document.getElementsByClassName("tiny__content")[1];
	let content = document.getElementsByClassName("tiny__content")[3];
	edit.addEventListener("click", () => {
		if (edit.innerHTML.indexOf("fa-edit") != -1){
			edit.innerHTML = "<i class='fas fa-undo-alt'></i>";
			del.innerHTML = "<i class='fas fa-check'></i>";
			name.removeAttribute("readonly");
			content.removeAttribute("readonly");
			name.focus();
			newSlice.on("mouseover", null);
		} else {
			edit.innerHTML = "<i class='fas fa-edit'></i>";
			del.innerHTML = "<i class='far fa-trash-alt'></i>";
			name.setAttribute("readonly", "readonly");
			content.setAttribute("readonly", "readonly");
			newSlice.on("mouseover", d => {
				d3.select("[name=tiny_no]").attr("value", d.data.tiny_no);
				d3.select("[name=tiny_type]").attr("value", d.data.tiny_type);
				d3.select("[name=type]").attr("value", (d.data.tiny_type == 'D')?"TYDEE":((d.data.tiny_type == 'N')?"TINY":"USER"));
				d3.select("[name=name]").attr("value", d.data.name);
				d3.select("[name=location]").attr("value", `${d.ancestors().map(d => d.data.name).reverse().join("/")}`);
				d3.select("[name=content]").text(d.data.tiny_content);
				d3.select("[name=regdate]").attr("value", d.data.regdate);
				name.value = d.data.name;
				content.value = (d.data.tiny_content == undefined)?null:d.data.tiny_content;
			});
		}
	}, false);
	del.addEventListener("click",() =>{
		tiny_no = document.getElementsByName("tiny_no")[0].value;
		let tiny_type = document.getElementsByName("tiny_type")[0].value;
		let confirmtype = (tiny_type == 'D')?'TYDEE':((tiny_type == 'N')?"TINY":"USER");
		let form = document.getElementById("tiny-form");
		let input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "command");
		if (del.innerHTML.indexOf("fa-trash-alt") != -1){
			let check = confirm("삭제할 "+ confirmtype + " 이름 : "+name.value+"\n삭제하시겠습니까?");
			if (check) {
				input.setAttribute("value", "delete");
				form.append(input);
				form.submit();
			}
		} else {
			input.setAttribute("value", "update");
			form.append(input);
			form.submit();
		}
	});
	add.addEventListener("click", () => {
		let dimsection = document.createElement("section");
		dimsection.setAttribute("class", "dim__layer");


		let dimbg = document.createElement("div");
		dimbg.setAttribute("class", "dim__background");
		dimsection.appendChild(dimbg);


		let addlayer = document.createElement("article");
		addlayer.setAttribute("class", "pop__layer");

		let closebutton = document.createElement("div");
		closebutton.setAttribute("class", "pop__buttons");
		let span1 = document.createElement("span");
		span1.setAttribute("id", "closearea");
		let iclose = document.createElement("i");
		iclose.setAttribute("class", "fas fa-times");
		span1.appendChild(iclose);

		closebutton.appendChild(span1);
		addlayer.appendChild(closebutton);


		let menu = document.createElement("div");
		menu.setAttribute("class", "pop__menu");
		let p0 = document.createElement("p");
		let label0 = document.createElement("label");
		label0.setAttribute("for", "tiny_type");
		label0.textContent = "TYPE";
		p0.appendChild(label0);
		let p1 = document.createElement("p");
		let label1 = document.createElement("label");
		label1.setAttribute("for", "tiny_title");
		label1.textContent = "NAME";
		p1.appendChild(label1);
		let p2 = document.createElement("p");
		let label2 = document.createElement("label");
		label2.setAttribute("for", "tiny_content");
		label2.textContent = "CONTENT";
		p2.appendChild(label2);
		let p3 = document.createElement("p");
		let label3 = document.createElement("label");
		label3.setAttribute("for", "tiny_image");
		label3.textContent = "IMAGE";
		p3.appendChild(label3);
		let p4 = document.createElement("p");
		let label4 = document.createElement("label");
		label4.setAttribute("for", "tiny_depth")
		label4.textContent = "UPPER TYDEE";
		p4.appendChild(label4);

		menu.appendChild(p0);
		menu.appendChild(p1);
		menu.appendChild(p2);
		menu.appendChild(p3);
		menu.appendChild(p4);
		addlayer.appendChild(menu);


		let contents = document.createElement("div");
		contents.setAttribute("class", "pop__contents");

		let form = document.createElement("form");
		form.setAttribute("action", "mytydee.do");
		form.setAttribute("method", "post");
		form.setAttribute("id", "insert-form");
		let command = document.createElement("input");
		command.setAttribute("type", "hidden");
		command.setAttribute("name", "command");
		command.setAttribute("value", "insert");
		form.appendChild(command);

		let typediv = document.createElement("div");
		typediv.setAttribute("class","pop__content_box")

		let typeD = document.createElement("input");
		typeD.setAttribute("class", "pop__content");
		typeD.setAttribute("type", "radio");
		typeD.setAttribute("name", "tiny_type");
		typeD.setAttribute("value", "D");
		typeD.setAttribute("id", "typeD");
		let labelD = document.createElement("label");
		labelD.setAttribute("for", "typeD");
		labelD.textContent = "TYDEE";

		let typeN = document.createElement("input");
		typeN.setAttribute("class", "pop__content");
		typeN.setAttribute("type", "radio");
		typeN.setAttribute("name", "tiny_type");
		typeN.setAttribute("value", "N");
		typeN.setAttribute("id", "typeN");
		typeN.setAttribute("checked", "checked");
		typeN.required = true;
		let labelN = document.createElement("label");
		labelN.setAttribute("for", "typeN");
		labelN.textContent = "TINY";

		typediv.appendChild(typeD);
		typediv.appendChild(labelD);
		typediv.appendChild(typeN);
		typediv.appendChild(labelN);
		contents.appendChild(typediv);
		let titlediv = document.createElement("div");
		titlediv.setAttribute("class","pop__content_box")

		let title = document.createElement("input");
		title.setAttribute("class", "pop__content");
		title.setAttribute("type", "text");
		title.setAttribute("name", "tiny_title");
		title.required = true;
		titlediv.appendChild(title);
		
		let contentdiv = document.createElement("div");
		contentdiv.setAttribute("class","pop__content_box")
		
		let content = document.createElement("textarea");
		content.setAttribute("class", "pop__content");
		content.setAttribute("type", "text");
		content.setAttribute("name", "tiny_content");
		content.setAttribute("style", "resize:none;")
		contentdiv.appendChild(content);
		
		let imagediv = document.createElement("div");
		imagediv.setAttribute("class","pop__content_box")
		
		let image = document.createElement("input");
		image.setAttribute("class", "pop__content");
		image.setAttribute("type", "file");
		image.setAttribute("name", "tiny_image");
		imagediv.appendChild(image);
		
		let depthdiv = document.createElement("div");
		depthdiv.setAttribute("class","pop__content_box")
		
		let tiny_depth = document.createElement("select");
		tiny_depth.setAttribute("class", "pop__content");
		tiny_depth.setAttribute("name","tiny_depth");
		tiny_depth.required = true;
		let selection = document.createElement("option");
		selection.setAttribute("value", "");
		selection.textContent = "=TYDEEs=";
		tiny_depth.appendChild(selection);
		let user = document.createElement("option");
		user.setAttribute("value", 0);
		user.textContent = mytydeejson.name;
		tiny_depth.appendChild(user);
		options.forEach((data) => {
			let option = document.createElement("option");
			option.setAttribute("value", data.tiny_no);
			option.textContent = data.tiny_title;
			tiny_depth.appendChild(option);
		});
		depthdiv.appendChild(tiny_depth);
		
		contents.appendChild(titlediv);
		contents.appendChild(contentdiv);
		contents.appendChild(imagediv);
		contents.appendChild(depthdiv);
    
		form.appendChild(contents);
		addlayer.appendChild(form);

		let insertbutton = document.createElement("div");
		insertbutton.setAttribute("class", "pop__buttons");
		let span2 = document.createElement("span");
		span2.setAttribute("id", "insertarea");
		let icheck = document.createElement("i");
		icheck.setAttribute("class", "fas fa-check");
		span2.appendChild(icheck);
		insertbutton.appendChild(span2);
		addlayer.appendChild(insertbutton);
		dimsection.appendChild(addlayer);
		document.body.appendChild(dimsection);
		let exit = document.getElementById("closearea");
		exit.addEventListener("click", () => {
			document.getElementsByClassName("dim__layer")[0].remove();
		});
		let send = document.getElementById("insertarea");
		send.addEventListener("click", () => {
			let titlefield = document.getElementsByName("tiny_title")[0];
			let depthfield = document.getElementsByName("tiny_depth")[0];
			if (titlefield.value == '') {
				alert("이름을 입력해주세요");
				titlefield.focus();
				return false;
			} else if (depthfield.value == ''){
				alert("수납할 TYDEE를 고르세요");
				depthfield.focus();
				return false;
			} else {
				let insert = document.getElementById("insert-form");
				insert.submit();
			}
		});
	});
	
	let search = document.getElementsByClassName("tiny__search")[0];
	let searchbutton = document.getElementsByClassName("tiny__search")[1];
	let gs = document.getElementsByTagName("g");
	search.addEventListener("keyup", (e) => {
		if (e.keyCode == 13){
			for (var i=0; i<gs.length; i++){
				if (search.value != ""){
					if (gs[i].getAttribute("value").indexOf(search.value) != -1){
						gs[i].setAttribute("fill-opacity", 1);
						gs[i].getElementsByTagName("path")[0].setAttribute("fill-opacity", 1);
					} else {
						gs[i].setAttribute("fill-opacity", 0.1);
						gs[i].getElementsByTagName("path")[0].setAttribute("fill-opacity", 0.1);
					}
				} else {
					d3.selectAll("g").attr("fill-opacity", d => (d.children ? 0.8 : 0.6));
					d3.selectAll(".main-arc").attr("fill-opacity", d => (d.children ? 0.8 : 0.6));
				}
			}
		} else if (e.keyCode == 8){
			d3.selectAll("g").attr("fill-opacity", d => (d.children ? 0.8 : 0.6));
			d3.selectAll(".main-arc").attr("fill-opacity", d => (d.children ? 0.8 : 0.6));
		}
	});
	searchbutton.addEventListener("click", () => {
		for (var i=0; i<gs.length; i++){
			if (gs[i].getAttribute("value").indexOf(search.value) != -1){
				gs[i].setAttribute("fill-opacity", 1);
				gs[i].getElementsByTagName("path")[0].setAttribute("fill-opacity", 1);
			} else {
				gs[i].setAttribute("fill-opacity", 0.1);
				gs[i].getElementsByTagName("path")[0].setAttribute("fill-opacity", 0.1);
			}
		}
	});
});