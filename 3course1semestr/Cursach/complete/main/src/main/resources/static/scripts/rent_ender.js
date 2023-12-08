
const stopRentButton = document.querySelector('.btn_stop_rent');
if (stopRentButton != null){



    stopRentButton.addEventListener('click', () => {
        var rent_id = stopRentButton.getAttribute("rent_id");
        const rent = {
          endingPoint: generateRandomString(6),
          endTime: (new Date()).toISOString()
        };
        console.log(JSON.stringify(rent))
        fetch('/api/rents/close/' + rent_id , {
          method: 'POST',
          body: JSON.stringify(rent),
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : localStorage.getItem('userToken')
          }
        })
        .then(response => {
          location.reload();
          console.log(response);
        })
        .catch(error => {
          console.error(error);
        });
    });
}

function parseStringToObject(objectString){
  const object = {};
  const parts = objectString.split("(")[1].split(")")[0].split(",");  // get key-value pairs between braces
  for (const part of parts) {
    const [key, value] = part.split("=");  // split by equals sign
    object[key.trim()] = value.trim().replace(/'/g, "");  // remove quotes
  }
  return object;
}

function generateRandomString(length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let result = '';

  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    result += characters.charAt(randomIndex);
  }

  return result;
}