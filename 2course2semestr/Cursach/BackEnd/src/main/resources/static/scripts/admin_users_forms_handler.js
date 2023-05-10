// Change user
const changeUserForm = document.querySelector('#change_user').closest('form');
changeUserForm.addEventListener('submit', event => {
  event.preventDefault();

  const changedUserPassportInput = changeUserForm.querySelector('#changed_user_passport');
  const changedUserPassport = changedUserPassportInput.value;

  const changedFullNameInput = changeUserForm.querySelector('#changed_full_name');
  const changedFullName = changedFullNameInput.value;

  const changedDateOfBirthInput = changeUserForm.querySelector('#changed_date_of_birth');
  const changedDateOfBirth = changedDateOfBirthInput.value;

  const changedPasswordInput = changeUserForm.querySelector('#changed_password');
  const changedPassword = changedPasswordInput.value;

  const changedUsernameInput = changeUserForm.querySelector('#changed_username');
  const changedUsername = changedUsernameInput.value;

  const changedRoleInput = changeUserForm.querySelector('#changed_role');
  const changedRole = changedRoleInput.value;

  const changedLevelIdInput = changeUserForm.querySelector('#changed_level_id');
  const changedLevelId = changedLevelIdInput.value;

  // Construct URL-encoded parameters
  const params = new URLSearchParams();
  params.append('snpassport', changedUserPassport);
  params.append('fullname', changedFullName);
  params.append('dateOfBirth', changedDateOfBirth);
  params.append('password', changedPassword);
  params.append('username', changedUsername);
  params.append('role', changedRole);
  params.append('idLevel', changedLevelId);

  // Send POST request
  fetch('/api/user/change?' + parseParams(params), {
    method: 'POST'
  })
  .then(response => {
    location.reload()
  })
  .catch(error => {
    // Handle error
  });
});

// Delete user
const deleteUserForm = document.querySelector('#delete_user').closest('form');
deleteUserForm.addEventListener('submit', event => {
  event.preventDefault();

  const delUserPassportInput = deleteUserForm.querySelector('#del_user_passport');
  const delUserPassport = delUserPassportInput.value;

  // Construct URL-encoded parameters
  const params = new URLSearchParams();
  params.append('snpassport', delUserPassport);

  // Send POST request
  fetch('/api/delete-user?' + parseParams(params), {
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
    for key, value in data.items():
        output_string += f'&{key}={value}'
    output_string.slice(1)
    return output_string;
}