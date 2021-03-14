/*output "ir_akey1" {
    value = { for i in inazurerm_data_factory_integration_runtime_self_hosted.ir : i.name => i.auth_key_1}
}

output "ir_akey2" {
    value = { for i in inazurerm_data_factory_integration_runtime_self_hosted.ir : i.name => i.auth_key_2}
}*/