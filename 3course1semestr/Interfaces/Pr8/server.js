const { loadPackageDefinition, ServerCredentials, Server } = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');

const packageDefinition = protoLoader.loadSync('./auth.proto');
const protoDescriptor = loadPackageDefinition(packageDefinition);
const greetings = protoDescriptor.greetings;

const server = new Server();

const users = [];

function register(call, callback) {
  const { username, password } = call.request;
  
  // Проверяем, что пользователь с таким именем не существует
  const userExists = users.some(user => user.username === username);
  if (userExists) {
    callback(null, { status: 'Провал' });
    return;
  }

  // Создаем нового пользователя
  users.push({ username, password });
  callback(null, { status: 'Успех' });
}

function login(call, callback) {
  const { username, password } = call.request;
  
  // Ищем пользователя с таким именем и паролем
  const user = users.find(user => user.username === username && user.password === password);
  if (!user) {
    callback(null, { status: 'Провал' });
    return;
  }

  callback(null, { status: `Привет, ${username}` });
}

function updateUser(call, callback) {
  const { username, newPassword } = call.request;
  
  // Ищем пользователя с таким именем
  const user = users.find(user => user.username === username);
  if (!user) {
    callback(null, { status: 'Провал' });
    return;
  }

  // Обновляем пароль пользователя
  user.password = newPassword;
  callback(null, { status: 'Успех' });
}

function deleteUser(call, callback) {
  const { username } = call.request;
  
  // Ищем пользователя с таким именем
  const userIndex = users.findIndex(user => user.username === username);
  if (userIndex === -1) {
    callback(null, { status: 'Провал' });
    return;
  }

  // Удаляем пользователя
  users.splice(userIndex, 1);
  callback(null, { status: 'Успех' });
}

function getUser(call, callback) {
  const { username } = call.request;
  
  // Ищем пользователя с таким именем
  const user = users.find(user => user.username === username);
  if (!user) {
    callback(null, { status: 'Провал' });
    return;
  }

  callback(null, { username: user.username, password: user.password });
}

server.addService(greetings.GreetingService.service, {
  register: register,
  login: login,
  updateUser: updateUser,
  deleteUser: deleteUser,
  getUser: getUser,
});

server.bindAsync('0.0.0.0:50051', ServerCredentials.createInsecure(), (err, port) => {
    if (err) {
      console.error('Failed to bind:', err);
      return;
    }
    console.log('Server bound on port:', port);
    server.start();
  });