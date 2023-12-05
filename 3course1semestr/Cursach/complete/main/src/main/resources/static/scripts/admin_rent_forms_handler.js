// Add new rent
const addNewRentForm = document.querySelector('#add_new_rent').closest('form');
addNewRentForm.addEventListener('submit', event => {
  event.preventDefault();

  const newSNPassportInput = document.querySelector('#new_snpassport');
  const newSNPassport = newSNPassportInput.value;

  const newVINInput = document.querySelector('#new_vin');
  const newVIN = newVINInput.value;

  const newStartPointInput = document.querySelector('#new_start_point');
  const newStartPoint = newStartPointInput.value;

  const newEndPointInput = document.querySelector('#new_end_point');
  const newEndPoint = newEndPointInput.value;

  const newStartTimeInput = document.querySelector('#new_start_time');
  const newStartTime = newStartTimeInput.value;

  const newEndTimeInput = document.querySelector('#new_end_time');
  const newEndTime = newEndTimeInput.value;

  // Send POST request
  fetch('/api/rent/add', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      snpassport: newSNPassport,
      vin: newVIN,
      duration:0,
      startingPoint: newStartPoint,
      endPoint: newEndPoint,
      startTime: newStartTime,
      endTime: newEndTime
    })
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Delete rent
const deleteRentForm = document.querySelector('#delete_rent').closest('form');
deleteRentForm.addEventListener('submit', event => {
  event.preventDefault();

  const delRentIdInput = document.querySelector('#del_rent_id');
  const delRentId = delRentIdInput.value;

  // Send POST request
  fetch('/api/rent?iRentID=' + delRentId, {
    method: 'DELETE'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Change rent
const changeRentForm = document.querySelector('#change_rent').closest('form');
changeRentForm.addEventListener('submit', event => {
  event.preventDefault();

  const changedRentIdInput = document.querySelector('#id_changed_rent');
  const changedRentId = changedRentIdInput.value;

  const changedSNPassportInput = document.querySelector('#changed_snpassport');
  const changedSNPassport = changedSNPassportInput.value;

  const changedVINInput = document.querySelector('#changed_vin');
  const changedVIN = changedVINInput.value;

  const changedStartPointInput = document.querySelector('#changed_start_point');
  const changedStartPoint = changedStartPointInput.value;

  const changedEndPointInput = document.querySelector('#changed_end_point');
  const changedEndPoint = changedEndPointInput.value;

  const changedStartTimeInput = document.querySelector('#changed_start_time');
  const changedStartTime = changedStartTimeInput.value;

  const changedEndTimeInput = document.querySelector('#changed_end_time');
  const changedEndTime = changedEndTimeInput.value;

  // Send POST request
  fetch('/api/rent/change?iRentID=' + changedRentId + '&snpassport=' + changedSNPassport + '&vin=' + changedVIN + '&startingPoint=' + changedStartPoint + '&endPoint=' + changedEndPoint + '&startTime=' + changedStartTime + '&endTime=' + changedEndTime, {
    method: 'POST'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});