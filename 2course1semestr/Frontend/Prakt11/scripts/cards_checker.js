var cards_content = document.querySelectorAll('.content')
const maxlength = 32


if (cards_content.length) {
	for (var j = cards_content.length - 1; j >= 0; --j) {
		let card = cards_content[j]
		
		let text_holder = card.querySelectorAll('p')[0]
		let text = text_holder.innerText
		if (text.length > maxlength) {
			text = text.substring(0, text.length - (text.length - maxlength + 3)) + '...'
		}
		text_holder.innerText = text
	}
}