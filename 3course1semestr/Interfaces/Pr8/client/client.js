const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');

const packageDefinition = protoLoader.loadSync('auth.proto');
const protoDescriptor = grpc.loadPackageDefinition(packageDefinition);
const greetings = protoDescriptor.greetings;

const client = new greetings.GreetingService('localhost:50051', grpc.credentials.createInsecure());

function registerUser(username, password, callback) {
  const request = { username, password };
  client.register(request, callback);
}

function loginUser(username, password, callback) {
  const request = { username, password };
  client.login(request, callback);
}

function updateUser(username, newPassword, callback) {
  const request = { username, newPassword };
  client.updateUser(request, callback);
}

function deleteUser(username, callback) {
  const request = { username };
  client.deleteUser(request, callback);
}

function getUser(username, callback) {
  const request = { username };
  client.getUser(request, callback);
}

module.exports = {
  registerUser,
  loginUser,
  updateUser,
  deleteUser,
  getUser,
};