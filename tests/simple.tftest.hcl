variables {

  name                 = "cosmosdb"
  resource_group_name  = "cosmosdb-rg"
  location             = "westeurope"
  capabilities         = ["DisableRateLimitingResponses"]
  mongo_server_version = "4.2"

  ip_range_filter = ["10.221.100.10", "10.221.101.0/24"]

  databases = {
    mydb1 = {
      throughput = 400
      collections = [
        { name = "col0", shard_key = "somekey_0", throughput = 1000 },
        { name = "col1", shard_key = "somekey_1" }
      ]
    }
    mydb2 = {
      max_throughput = 4000
      collections    = [{ name = "mycol2", shard_key = "someother_key" }]
    }
    mydb3 = {
      collections = [{ name = "mycol3", shard_key = "mycol3_key", max_throughput = 5000 }]
    }
  }

  tags = {
    tag1 = "value1"
  }

}

run "simple" {
  command = plan
}