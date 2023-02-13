

function switch_form() {
	let selected_type = document.querySelector(".selected")
	let unselected_type = document.querySelector(".unselected")

	selected_type.classList.remove("selected")
	selected_type.classList.add("unselected");

	unselected_type.classList.remove("unselected")
	unselected_type.classList.add("selected");
}