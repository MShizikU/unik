// Add new level
const addNewLevelForm = document.getElementById('add_new_level_form');
const addNewLevelButton = document.getElementById('add_new_level_name');
addNewLevelButton.addEventListener('click', event => {
  event.preventDefault();

  const newLevelNameInput = document.getElementById('new_level_name');
  const newLevelName = newLevelNameInput.value;

  // Send POST request without a request body
  fetch('/api/level/add?levelName=' + newLevelName, {
    method: 'POST'
  })
  .then(response => {
    location.reload();
  })
  .catch(error => {

  });
});

// Add new group
const addNewGroupForm = document.getElementById('add_new_group_form');
const addNewGroupButton = document.getElementById('add_new_group_name');
addNewGroupButton.addEventListener('click', event => {
  event.preventDefault();

  const newGroupNameInput = document.getElementById('new_group_name');
  const newGroupName = newGroupNameInput.value;

  // Send POST request without a request body
  fetch('/api/group/add?groupName=' + newGroupName, {
    method: 'POST'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Delete old level
const deleteOldLevelForm = document.getElementById('delete_old_level_form');
const deleteOldLevelButton = document.getElementById('delete_old_level_name');
deleteOldLevelButton.addEventListener('click', event => {
  event.preventDefault();

  const oldLevelNameInput = document.getElementById('old_level_name');
  const oldLevelName = oldLevelNameInput.value;

  // Send POST request without a request body
  fetch('/api/level?levelName=' + oldLevelName, {
    method: 'DELETE'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Delete old group
const deleteOldGroupForm = document.getElementById('delete_old_group_form');
const deleteOldGroupButton = document.getElementById('delete_old_group_name');
deleteOldGroupButton.addEventListener('click', event => {
  event.preventDefault();

  const oldGroupNameInput = document.getElementById('old_group_name');
  const oldGroupName = oldGroupNameInput.value;

  // Send POST request without a request body
  fetch('/api/group?groupName=' + oldGroupName, {
    method: 'DELETE'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Update old level
const updateOldLevelForm = document.getElementById('update_old_level_form');
const updateOldLevelButton = document.getElementById('update_old_level_name');
updateOldLevelButton.addEventListener('click', event => {
  event.preventDefault();

  const updatedLevelNameIdInput = document.getElementById('updated_level_name_id');
  const updatedLevelNameId = updatedLevelNameIdInput.value;

  const updatedLevelNameInput = document.getElementById('updated_level_name');
  const updatedLevelName = updatedLevelNameInput.value;

  // Send POST request without a request body
  fetch('/api/level/update?idLevel=' + updatedLevelNameId + '&levelName=' + updatedLevelName, {
    method: 'POST'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Update old group
const updateOldGroupForm = document.getElementById('update_old_group_form');
const updateOldGroupButton = document.getElementById('update_old_group_name');
updateOldGroupButton.addEventListener('click', event => {
  event.preventDefault();

  const updatedGroupNameIdInput = document.getElementById('updated_group_name_id');
  const updatedGroupNameId = updatedGroupNameIdInput.value;

  const updatedGroupNameInput = document.getElementById('updated_group_name');
  const updatedGroupName = updatedGroupNameInput.value;

  // Send POST request without a request body
  fetch('/api/group/update?idGroup=' + updatedGroupNameId + '&groupName=' + updatedGroupName, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Connect into permission
const connectIntoPermissionForm = document.querySelector('#connect_into_permission').closest('form');
connectIntoPermissionForm.addEventListener('submit', event => {
  event.preventDefault();

  const connectedLevelIdInput = connectIntoPermissionForm.querySelector('#connected_level_id');
  const connectedLevelId = connectedLevelIdInput.value;

  const connectedGroupIdInput = connectIntoPermissionForm.querySelector('#connected_group_id');
  const connectedGroupId = connectedGroupIdInput.value;

  // Send POST request
  fetch('/api/permission/save', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      idPermission: 0,
      idLevel: Number(connectedLevelId),
      idGroup: Number(connectedGroupId)
    })
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Delete connection
const deletePermissionForm = document.querySelector('#delete_permission').closest('form');
deletePermissionForm.addEventListener('submit', event => {
  event.preventDefault();

  const connectedLevelIdInput = document.querySelector('#connected_del_level_id');
  const connectedLevelId = connectedLevelIdInput.value;

  const connectedGroupIdInput = document.querySelector('#connected_del_group_id');
  const connectedGroupId = connectedGroupIdInput.value;

  // Send POST request
  fetch('/api/permission', {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
    idPermission:0,
      idLevel: Number(connectedLevelId),
      idGroup: Number(connectedGroupId)
    })
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});