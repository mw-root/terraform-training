## Module 1

Inspect the files provided. We have `main.tf`, `providers.tf`, and `requirements.tf`.

Verify your understanding of what function they perform.

```
❯ la
-rw-r--r--  1 mikeweeks  staff     0B 10 Oct 15:47 .file
-rw-r--r--  1 mikeweeks  staff   279B 10 Oct 15:47 MODULE.md
-rw-r--r--  1 mikeweeks  staff   1.1K 10 Oct 15:39 README.md
-rw-r--r--  1 mikeweeks  staff    74B 10 Oct 15:46 main.tf
-rw-r--r--  1 mikeweeks  staff   196B 10 Oct 15:44 providers.tf
-rw-r--r--  1 mikeweeks  staff   430B 10 Oct 15:44 requirements.tf
```

NOTE: if you don't have `la` as an alias, you can! Do this: `alias la='ls -lAh'`

Notice that there are no hidden files or terraform generates files.. yet.

### Let's Gooooooooooo

#### Planning

Run:
`terraform plan`

> Did state get created?

Run
`la`

> Have our directory contents changed? Why? Or Why Not?

#### Applying

Run:
`terraform apply`

> Did you get prompted for approval? Why/Why Not?

> Did state get created? (hint: `la`)

View the statefile.

`cat terraform.tfstate`


#### Data Sources
Uncomment the data source block in main.tf and run `terraform apply`

> Did you get prompted for approval? Why/Why Not?

> What changes were made to state?

Run:
`jq < terraform.tfstate`

#### Outputs
Uncomment the output block in main.tf and run `terraform apply`

> Did you get prompted for approval? Why/Why Not?

> What changes were made to state?

Run:
`jq < terraform.tfstate`

Run:
`terraform output`

> Can you set the output block to only output the first coffee in the list?

When you've got a solution, be sure to run `terraform apply` to update state

Run:
`terraform output`

Run:
`terraform output -json`

> How does this compare to the state?
`jq < terraform.tfstate '.outputs'`


#### State Commands
Run:
`terraform state pull`

> How does this compare to the local state file?

Run:
`terraform state list`

> What do you see and why? (Hint: `terraform state --help`)

#### Remote State

From: https://developer.hashicorp.com/terraform/language/state/remote

>By default, Terraform stores state locally in a file named terraform.tfstate. When working with Terraform in a team, use of a local file makes Terraform usage complicated because each user must make sure they always have the latest state data before running Terraform and make sure that nobody else runs Terraform at the same time.
>
>With remote state, Terraform writes the state data to a remote data store, which can then be shared between all members of a team. Terraform supports storing state in Terraform Cloud, HashiCorp Consul, Amazon S3, Azure Blob Storage, Google Cloud Storage, Alibaba Cloud OSS, and more.

##### State Storage Backend

Remote state storage is identical in content to local state.
It is facilitated by one of the many supported [backends](https://developer.hashicorp.com/terraform/language/settings/backends).
Concepts have been added to create subfolders for projects and workspaces,
but the concept and structure of state in json does not change.

Each

##### State Locks

One new problem of shared remote state is concurrency.
There is no appetites or reason for multiple terraform applies to happen at the same time.
As such a new feature needs to be introduced to ensure only one user is manipulating state
at a time.

> For fully-featured remote backends, Terraform can also use state locking to prevent concurrent runs of Terraform against the same state.

State locking is a function of the backend chosen for state storage.

For AWS the backend locks are done by dynamodb.

For AzureRM the state locking is managed automagically by the storage backend.


#### Resources
See [ProvisionResource.md](ProvisionResource.md)
