## State Module 1

In this folder we'll look at the basic structure
of Terraform state and how we can meaningfully
interact with it.

## Setup

Navigate to the [hashicups](/hashicups) folder and follow the [Starticups](/hashicups/README.md#Starticups) procedure.


### Build Hashicups Provider
There is no arm build for terraform-provider-hashicups, so we'll have to build it
and mangle our local system slightly.

```
cd ~/repos
gh repo clone hashicorp/terraform-provider-hashicups
cd terraform-provider-hashicups
go build -o terraform-provider-hashicups
mkdir -p ~/.terraform.d/plugins
cp terraform-provider-hashicups ~/.terraform.d/plugins
```

### Write Dev Override

```
cat > ~/.terraformrc <<EOF
provider_installation {

  dev_overrides {
      "hashicorp.com/edu/hashicups" = "${HOME}/.terraform.d/plugins"
  }

  # For all other providers, install them directly from their origin provider
  # registries as normal. If you omit this, Terraform will _only_ use
  # the dev_overrides block, and so no other providers will be available.
  direct {}
}
EOF
```

## Run the Module

See [MODULE.md](MODULE.md)
