const btn_start_action = document.getElementsByClassName('btn_first_task')[0]


btn_start_action.addEventListener("click", () => {
	while (confirm("Do you want to registr on site?") !== true) {
		alert("Try again")
	}
	alert("Hello")
})