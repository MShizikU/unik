
const rentBtns = document.querySelectorAll('.rent_btn');

console.log(rentBtns);

rentBtns.forEach(btn => {
  btn.addEventListener('click', (event) => {
    event.preventDefault();

    const vehicleModelString = btn.getAttribute('vehicle_work_model');

    const vehiclesString = btn.getAttribute('vehicles_list');
    const vehiclesArray = vehiclesString
      .replace(/\[/g, "")  // remove opening square bracket
      .replace(/\]/g, "")  // remove closing square bracket
      .split("Vehicle{")  // split by "Vehicle{"
      .slice(1)  // remove first empty element
      .map(vehicleString => {
        const parts = vehicleString.split(",");  // split by comma
        const vehicle = {};
        for (const part of parts) {
           if (part.includes("=")){
              const [key, value] = part.split("=");  // split by equals sign
              vehicle[key.trim()] = value.trim().replace(/'/g, "");  // remove quotes
          }
        }
        return vehicle;
      });
    const vehicleModel = {};
    const parts = vehicleModelString.split("{")[1].split("}")[0].split(",");  // get key-value pairs between braces
    for (const part of parts) {
      const [key, value] = part.split("=");  // split by equals sign
      vehicleModel[key.trim()] = parseInt(value.trim());  // parse value as integer and add to object
    }
    const chosen =  vehiclesArray.filter(vehicle =>
                       vehicle.iVehicleWorkModelID === vehicleModel.iVehicleWorkModelID + "" && vehicle.stState === "Free")[0];
    const muser = parseStringToObject(btn.getAttribute('current_user'));

    console.log(muser)
    console.log(chosen)

    const rent = {
      snpassport: muser.stSNPassport +'',
      vin: chosen.VIN + '',
      startingPoint: 'Moscow, pr. Vernadskogo, 76'
    };
    console.log(JSON.stringify(rent))
    fetch('/api/rent/start?snpassport=' + muser.stSNPassport + '&VIN=' + chosen.VIN + '&startingPoint=MoscowVernadskogo76' , {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(response => {
      location.reload();
      console.log(response);
    })
    .catch(error => {
      // handle error
      console.error(error);
    });
  });
});

function parseStringToObject(objectString){
  const object = {};
  const parts = objectString.split("{")[1].split("}")[0].split(",");  // get key-value pairs between braces
  for (const part of parts) {
    const [key, value] = part.split("=");  // split by equals sign
    object[key.trim()] = value.trim().replace(/'/g, "");  // remove quotes
  }
  return object;
}
