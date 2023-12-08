document.addEventListener('DOMContentLoaded', function () {
    function sendRequest(url, method, data, id) {
        if (id && (method === 'PUT' || method === 'DELETE')) {
            url += '/' + id;
        }

        // Replace empty string values with null
        Object.keys(data).forEach(key => {
            if (data[key] === '') {
                data[key] = null;
            }
        });

        fetch('http://localhost:8081/' + url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': localStorage.getItem('userToken')
            },
            body: JSON.stringify(data)
        })
            .then(response => {
                location.reload();
                console.log(response);
            })
            .catch(error => {
                console.error(error);
            });
    }

    function handleFormSubmit(event) {
        event.preventDefault();

        const formMethod = event.target.getAttribute('data-form_method');
        const formResolver = event.target.getAttribute('data-resolver').replace(/-/g, '\\');
        const formId = event.target.id;

        const formData = {};
        const formInputs = event.target.querySelectorAll('input[data-field]');
        formInputs.forEach(input => {
            formData[input.getAttribute('data-field')] = input.value;
        });

        const id = formData.id;

        sendRequest(formResolver, formMethod, formData, id);
    }

    const forms = document.querySelectorAll('form[data-form_method]');
    forms.forEach(form => {
        form.addEventListener('submit', handleFormSubmit);
    });
});