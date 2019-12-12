/** Database setup for reviews. */

const { Client } = require("pg");
// const { DB_URI } = require("./config");

const client = new Client({
  connectionString: "reviews_list"
});

client.connect();


module.exports = client;
