// Get the "Add new brand" form
const addNewBrandForm = document.getElementById('add_new_brand_form');
const addNewBrandButton = document.getElementById('add_new_brand_name');
addNewBrandButton.addEventListener('click', event => {
  event.preventDefault();

  const newBrandNameInput = document.getElementById('new_brand_name');
  const newBrandName = newBrandNameInput.value;

  fetch('/api/vehicle_brand/add?brandName=' + newBrandName, {
    method: 'POST'
  })
  .then(response => {
    location.reload();
  })
  .catch(error => {
    console.error('Error sending POST request:', error);
  });
});

// Get the "Add new model" form
const addNewModelForm = document.getElementById('add_new_model_form');
const addNewModelButton = document.getElementById('add_new_model_name');
addNewModelButton.addEventListener('click', event => {
  event.preventDefault();

  const newModelNameInput = document.getElementById('new_model_name');
  const newModelName = newModelNameInput.value;

  fetch('/api/vehicle_model/add?modelName=' + newModelName, {
    method: 'POST'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    console.error('Error sending POST request:', error);
  });
});

// Get the "Delete old brand" form
const deleteOldBrandForm = document.getElementById('delete_old_brand_form');
const deleteOldBrandButton = document.getElementById('delete_old_brand_name');
deleteOldBrandButton.addEventListener('click', event => {
  event.preventDefault();

  const brandNameInput = document.getElementById('old_brand_name');
  const brandName = brandNameInput.value;

  fetch('/api/vehicle_brand?brandName=' + brandName, {
    method: 'DELETE'
  })
  .then(response => {
    location.reload();
  })
  .catch(error => {
    console.error('Error sending POST request:', error);
  });
});

// Get the "Delete old model" form
const deleteOldModelForm = document.getElementById('delete_old_model_form');
const deleteOldModelButton = document.getElementById('delete_old_model_name');
deleteOldModelButton.addEventListener('click', event => {
  event.preventDefault();

  const modelNameInput = document.getElementById('old_model_name');
  const modelName = modelNameInput.value;

  fetch('/api/vehicle_model?modelName=' + modelName, {
    method: 'DELETE'
  })
  .then(response => {
    location.reload();
  })
  .catch(error => {
    console.error('Error sending POST request:', error);
  });
});

// Get the "Update old brand" form
const updateOldBrandForm = document.getElementById('update_old_brand_form');
const updateOldBrandButton = document.getElementById('update_old_brand_name');
updateOldBrandButton.addEventListener('click', event => {
  event.preventDefault();

  const brandIdInput = document.getElementById('updated_brand_name_id');
  const brandId = brandIdInput.value;

  const brandNameInput = document.getElementById('updated_brand_name');
  const brandName = brandNameInput.value;

  fetch('/api/vehicle_brand/update?idBrand=' + brandId + '&brandName='+ brandName, {
    method: 'POST'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    console.error('Error sending POST request:', error);
  });
});

// Get the "Update old model" form
const updateOldModelForm = document.getElementById('update_old_model_form');
const updateOldModelButton = document.getElementById('update_old_model_name');
updateOldModelButton.addEventListener('click', event => {
  event.preventDefault();

  const modelIdInput = document.getElementById('updated_model_name_id');
  const modelId = modelIdInput.value;

  const modelNameInput = document.getElementById('updated_model_name');
  const modelName = modelNameInput.value;

  fetch('/api/vehicle_model/update?idModel=' + modelId + '&modelName=' + modelName, {
    method: 'POST'
  })
  .then(response => {
    location.reload();
  })
  .catch(error => {
    console.error('Error sending POST request:', error);
  });
});

// Get the "Connect into name" form
const connectIntoNameForm = document.getElementById('connect_into_name_form');
const connectIntoNameButton = document.getElementById('connect_into_name');
connectIntoNameButton.addEventListener('click', event => {
  event.preventDefault();

  const brandNameInput = document.getElementById('connected_brand_name');
  const brandName = brandNameInput.value;

  const modelNameInput = document.getElementById('connected_model_name');
  const modelName = modelNameInput.value;

  fetch('/api/vehicle_name/add?brandName=' + brandName + '&modelName=' + modelName, {
    method: 'POST'
  })
  .then(response => {
    location.reload();
  })
  .catch(error => {
    console.error('Error sending POST request:', error);
  });
});

// Get the "Delete connection" form
const deleteConnectionForm = document.getElementById('delete_connection_form');
const deleteConnectionButton = document.getElementById('delete_connection');
deleteConnectionButton.addEventListener('click', event => {
  event.preventDefault();

  const brandNameInput = document.getElementById('connected_del_brand_name');
  const brandName = brandNameInput.value;

  const modelNameInput = document.getElementById('connected_del_model_name');
  const modelName = modelNameInput.value;

  fetch('/api/vehicle_name?brandName=' + brandName + '&modelName=' + modelName, {
      method: 'DELETE'
    })
    .then(response => {
      location.reload();
    })
    .catch(error => {
      console.error('Error sending POST request:', error);
    });
});

//Get the "Change connection" form
const changeConnectionButton = document.getElementById('change_name');
changeConnectionButton.addEventListener('click', event => {
  event.preventDefault();

  const nameId = document.getElementById("changed_name_id").value

  const brandNameInput = document.getElementById('changed_brand_name');
  const brandName = brandNameInput.value;

  const modelNameInput = document.getElementById('changed_model_name');
  const modelName = modelNameInput.value;

  fetch('/api/vehicle_name/change?idName=' + nameId + '&brandName=' + brandName + '&modelName=' + modelName, {
      method: 'POST'
    })
    .then(response => {
      location.reload();
    })
    .catch(error => {
      console.error('Error sending POST request:', error);
    });
});