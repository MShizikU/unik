// Add new vehicle
const addNewVehicleForm = document.querySelector('#add_new_vehicle').closest('form');
addNewVehicleForm.addEventListener('submit', event => {
  event.preventDefault();

  const newVinInput = addNewVehicleForm.querySelector('#new_vin');
  const newVin = newVinInput.value;

  const newColorInput = addNewVehicleForm.querySelector('#new_color');
  const newColor = newColorInput.value;

  const newStateInput = addNewVehicleForm.querySelector('#new_state');
  const newState = newStateInput.value;

  const newPlaceInput = addNewVehicleForm.querySelector('#new_place');
  const newPlace = newPlaceInput.value;

  const newWorkModelIdInput = addNewVehicleForm.querySelector('#new_work_model_id');
  const newWorkModelId = newWorkModelIdInput.value;

  // Send POST request
  fetch('/api/vehicle/add', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      vin: newVin,
      idVehicleWorkModel: newWorkModelId,
      color: newColor,
      state: newState,
      place: newPlace
    })
  })
  .then(response => {
    // Handle response
  })
  .catch(error => {
    // Handle error
  });
});

// Delete vehicle
const deleteVehicleForm = document.querySelector('#delete_vehicle').closest('form');
deleteVehicleForm.addEventListener('submit', event => {
  event.preventDefault();

  const delVinInput = document.querySelector('#del_vin');
  const delVin = delVinInput.value;

  // Construct URL-encoded parameters
  const params = {
    vin:delVin
  };

  // Send POST request
  fetch('/api/vehicle?' + parseParams(params), {
    method: 'DELETE'
  })
  .then(response => {
   location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Change vehicle
const changeVehicleForm = document.querySelector('#change_vehicle').closest('form');
changeVehicleForm.addEventListener('submit', event => {
  event.preventDefault();

  const vehicleVinInput = document.querySelector('#vehicle_vin');
  const vehicleVin = vehicleVinInput.value;

  const changedColorInput = document.querySelector('#changed_color');
  const changedColor = changedColorInput.value;

  const changedStateInput = document.querySelector('#changed_state');
  const changedState = changedStateInput.value;

  const changedPlaceInput = document.querySelector('#changed_place');
  const changedPlace = changedPlaceInput.value;

  const changedWorkModelIdInput = document.querySelector('#changed_work_model_id');
  const changedWorkModelId = changedWorkModelIdInput.value;

  // Construct URL-encoded parameters
  const params = {
    vin: vehicleVin,
    color: changedColor ,
    state:changedState ,
    place: changedPlace,
    idVehicleWorkModel: changedWorkModelId
  };

  // Send POST request
  fetch('/api/vehicle/change?' + parseParams(params), {
    method: 'POST'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

function parseParams(data){
    output_string = ''
    for (let key in data) {
        if (data.hasOwnProperty(key)) {
          output_string += `&${key}=${data[key]}`;
        }
     }
    output_string = output_string.slice(1)
    return output_string;
}