#Module to deploy the web tier. The deployment parameters like capability, environment, app name, and web tier are being passed from the input data stored in local.web_deploy_data_map.

module "web-deploy" {
  source   = "./module/web-mod"
  for_each = local.web_deploy_data_map

  capability  = each.value.deployment.capability
  environment = each.value.deployment.environment
  appname     = each.value.deployment.app_name
  web_tier    = each.value.deployment.web_tier
}

