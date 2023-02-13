let logo = document.querySelector(".logo_img");

logo.onclick = function () {
	let timeStart = Date.now();
	var prevRotation = 0;
	let timer = setInterval(function () {
		let timePassed = Date.now() - timeStart;
		logo.style.transform = "rotate(" + timePassed + "deg)"
		if (timePassed > 1500) clearInterval(timer);
		timeStart += 10;
	}, 20);
}

