const { authJwt } = require("../middleware");
const controller = require("../controllers/agr.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  app.put(
    "/api/test/agrs/:id",
    [authJwt.verifyToken, authJwt.isModerator],
    controller.updateAgr
  );

  app.post(
    "/api/test/agrs",
    [authJwt.verifyToken, authJwt.isAdmin],
    controller.createAgr
  );

  app.delete(
    "/api/test/agrs/:id",
    [authJwt.verifyToken, authJwt.isAdmin],
    controller.deleteAgr
  );
};
