var accum_btn = document.querySelector('.accumulator')


function accumulator(startingValue) {
    this.value = startingValue;

    this.read = function () {
        let num = prompt(`Current number: ${this.value}. Enter some number:`)
        if (isNaN(num)) {
            alert('It is not a number')
            this.read()
        }
        else {
            this.value = this.value + Number(num)
        }
    };
}


var accum = new accumulator(10);


accum_btn.addEventListener('click', () => {
    accum.read();
})