locals {
  web_deployment_data_dir = "${path.root}/data"

  # Defines the set of files that match the pattern `web_deploy*.json` in the `web_deployment_data_dir` directory.
  web_deploy_input_files = fileset(local.web_deployment_data_dir, "web_deploy*.json")

  # Decodes the content of each file in the `web_deploy_input_files` set into JSON and creates a map where the file name is the key and the decoded JSON is the value.
  web_deploy_data_map = {
    for f in local.web_deploy_input_files :
    f => jsondecode(file("${local.web_deployment_data_dir}/${f}"))
  }
}
