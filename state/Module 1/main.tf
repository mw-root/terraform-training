/*
  This is where the fun happens.
*/

# Uncomment for "Data Sources" section
# data "hashicups_coffees" "all" {}


# Uncomment for "Outputs" section
# output "hashicups_coffees" {
#   value = data.hashicups_coffees.all.coffees[0]
# }


# # Uncomment for Provision an Order section
# resource "hashicups_order" "order" {
#   items = [{
#     coffee = {
#       id = 3
#     }
#     quantity = 2
#     },
#     {
#       coffee = {
#         id = 2
#       }
#       quantity = 3
#   }]
# }

# # Uncomment after applying the order
# output "hashicups_order" {
#   value = hashicups_order.order
# }
