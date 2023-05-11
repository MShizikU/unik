// Read data from each input by its id





// Set event listener on each button by its id to send Post Request with params
document.getElementById('add_new_work_model').addEventListener('click', function() {

    let new_model_photo_name = document.getElementById('new_model_photo_name').value;
    let new_price_per_hour = document.getElementById('new_price_per_hour').value;
    let new_id_vehicle_name = document.getElementById('new_id_vehicle_name').value;
    let new_group_id = document.getElementById('new_group_id').value;
  // Send Post Request with params
  const params = {

    model_photo_name: new_model_photo_name,
    price_per_hour: new_price_per_hour,
    idVehicleName: new_id_vehicle_name,
    idGroup: new_group_id
  };
  fetch('/api/vehicle_work_model/add?' + parseParams(params), {
    method: 'POST'
  }).then(response => {
        location.reload()
      })
      .catch(error => {
        // Handle error
      });
});

document.getElementById('delete_work_model').addEventListener('click', function() {
  // Send Post Request with params

    let del_work_model_id = document.getElementById('del_work_model_id').value;

  const params = {
    idWorkModel: del_work_model_id
  };
  fetch('/api/vehicle_work_model?' + parseParams(params), {
    method: 'DELETE'
  }).then(response => {
        location.reload()
      })
      .catch(error => {
        // Handle error
      });
});

document.getElementById('change_work_model').addEventListener('click', function() {
 let work_model_id = document.getElementById('work_model_id').value;
 let changed_model_photo_name = document.getElementById('changed_model_photo_name').value;
 let changed_price_per_hour = document.getElementById('changed_price_per_hour').value;
 let changed_group_id = document.getElementById('changed_group_id').value;
 let changed_id_vehicle_name = document.getElementById('changed_id_vehicle_name').value;
  const params = {
    idWorkModel: work_model_id,
    model_photo_name: changed_model_photo_name,
    price_per_hour: changed_price_per_hour,
    idGroup: changed_group_id,
    idVehicleName: changed_id_vehicle_name
  };
  fetch('/api/vehicle_work_model/change?' + parseParams(params), {
    method: 'POST'
  }).then(response => {
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