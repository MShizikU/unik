
const stopRentButton = document.querySelector('.btn_stop_rent');
if (stopRentButton != null){

    const muser = parseStringToObject(stopRentButton.getAttribute('current_user'))

    stopRentButton.addEventListener('click', () => {
      fetch('/api/rent/end?snpassport='+muser.stSNPassport+'&endPoint=MoscowHove263', { method: 'POST' })
        .then(response => {
          location.reload();
        })
        .catch(error => {
          console.error('Error stopping rent:', error);
        });
    });
}
function parseStringToObject(objectString){
  const object = {};
  const parts = objectString.split("{")[1].split("}")[0].split(",");  // get key-value pairs between braces
  for (const part of parts) {
    const [key, value] = part.split("=");  // split by equals sign
    object[key.trim()] = value.trim().replace(/'/g, "");  // remove quotes
  }
  return object;
}
