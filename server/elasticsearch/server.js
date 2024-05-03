const { Client } = require("@elastic/elasticsearch");

const esClient = new Client({
  cloud: {
    id: "28a362aa8489427bb42dbfe4e2c968fe:dXMtZWFzdC0yLmF3cy5lbGFzdGljLWNsb3VkLmNvbTo0NDMkNmI1OThmZjBjMjk2NDQwYzhhZTlkNDA1M2FlYzhjMzckZGI3Mzg1NTMxNGE2NDJhM2JmODBmNjAwMjU4ZjcwNzg=",
  },
  auth: {
    apiKey: "VWtEcE9vOEI4eVl0Z1R4VUxxTzI6dmk2OFJDcGZSZHlmZ3JhblZkNDhRdw==",
  },
});

esClient
  .ping()
  .then((response) => console.log("You are connected to Elasticsearch!"))
  .catch((error) =>
    console.error("Elasticsearch is not connected" + error.message)
  );
module.exports = esClient;
