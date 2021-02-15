# Cosmosdb account for mongodb

Terraform module to create a CosmosDB account with mongodb in Azure with set of databases.


## Limitations

TODO


## Usage

Example showing deployment of a server with a single database.

```terraform
module "cosmosdb" {
  source = "github.com/avinor/terraform-azurerm-cosmosdb-mongodb"

  name                = "cosmosdb"
  resource_group_name = "cosmosdb-rg"
  location            = "westeurope"

  databases = {
    mydb  = {
      throughput = 400
      collections = [
        { name = "col0", shard_key = "somekey_0", throughput = 1000 },
        { name = "col1", shard_key = "somekey_1", throughput = null }
      ]
    }
    mydb2 = {
      throughput = 400
      collections = [{ name = "col2", shard_key = "someotherkey", throughput = null }]
    }
  }
}
```

## Diagnostics

Diagnostics settings can be sent to either storage account, event hub or Log Analytics workspace. The variable `diagnostics.destination` is the id of receiver, ie. storage account id, event namespace authorization rule id or log analytics resource id. Depending on what id is it will detect where to send. Unless using event namespace the `eventhub_name` is not required, just set to `null` for storage account and log analytics workspace.

Setting `all` in logs and metrics will send all possible diagnostics to destination. If not using `all` type name of categories to send.

## Capabilities

The variable `capabilities` can be used to enable following capabilities (comma separated): 

AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses, EnableAggregationPipeline, EnableCassandra, EnableGremlin, EnableMongo, EnableTable, EnableServerless, MongoDBv3.4 and mongoEnableDocLevelTTL.
