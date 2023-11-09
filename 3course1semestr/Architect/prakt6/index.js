const express = require('express');
const { graphqlHTTP } = require('express-graphql');
const app = express();
const port = 1234; 
const schema = require('./schema/schema');
app.use(
    "/graphql",
    graphqlHTTP({
        schema: schema,
        graphiql: true,
    })
);
app.listen(port); 