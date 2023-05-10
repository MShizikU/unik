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

  const delVinInput = deleteVehicleForm.querySelector('#del_vin');
  const delVin = delVinInput.value;

  // Construct URL-encoded parameters
  const params = new URLSearchParams();
  params.append('vin', delVin);

  // Send POST request
  fetch('/api/vehicle/' + parseParams(params), {
    method: 'DELETE'
  })
  .then(response => {
    // Handle response
  })
  .catch(error => {
    // Handle error
  });
});

// Change vehicle
const changeVehicleForm = document.querySelector('#change_vehicle').closest('form');
changeVehicleForm.addEventListener('submit', event => {
  event.preventDefault();

  const vehicleVinInput = changeVehicleForm.querySelector('#vehicle_vin');
  const vehicleVin = vehicleVinInput.value;

  const changedColorInput = changeVehicleForm.querySelector('#changed_color');
  const changedColor = changedColorInput.value;

  const changedStateInput = changeVehicleForm.querySelector('#changed_state');
  const changedState = changedStateInput.value;

  const changedPlaceInput = changeVehicleForm.querySelector('#changed_place');
  const changedPlace = changedPlaceInput.value;

  const changedWorkModelIdInput = changeVehicleForm.querySelector('#changed_work_model_id');
  const changedWorkModelId = changedWorkModelIdInput.value;

  // Construct URL-encoded parameters
  const params = new URLSearchParams();
  params.append('vin', vehicleVin);
  params.append('color', changedColor);
  params.append('state', changedState);
  params.append('place', changedPlace);
  params.append('idVehicleWorkModel', changedWorkModelId);

  // Send POST request
  fetch('/api/vehicle/change?' + parseParams(params), {
    method: 'POST'
  })
  .then(response => {
    // Handle response
  })
  .catch(error => {
    // Handle error
  });
});

function parseParams(data){
    output_string = ''
    for key, value in data.items():
        output_string += f'&{key}={value}'
    output_string.slice(1)
    return output_string;
}