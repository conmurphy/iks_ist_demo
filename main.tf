provider "intersight" {
    apikey    = var.intersight_api_key
    secretkey = var.intersight_secret_key
    endpoint  = var.intersight_endpoint
}

module "terraform-intersight-iks" {
    source  = "terraform-cisco-modules/iks/intersight"
    version ="2.1.31"

    cluster = {
        name = var.iks_cluster_name
        action = "Deploy"
        wait_for_completion = false
        worker_nodes = 3
        load_balancers = 6
        worker_max = 20
        control_nodes = 3
        ssh_user = var.iks_ssh_user
        ssh_public_key = var.iks_ssh_key
    }

    ip_pool = {
        use_existing = true
        name = "iks-demo-ip-pool"
    }
    
    sysconfig = {
        use_existing = true
        name = "iks-demo-cluster-sys-config-policy"
    }

    k8s_network = {
        use_existing = true
        name = "iks-demo-cluster-network-policy"
    }

    runtime_policy = {
        use_existing = false
        create_new = false
    }

    versionPolicy = {
        useExisting = true
        iksVersionName    = "iks-demo-kubernetes-version1.19.15.5"
        policyName = "1.19.15-iks.5"
    }
    
    
    tr_policy = {
        use_existing = false
        create_new = false
    }
    

    # Infra Config Policy Information
    infraConfigPolicy = {
        use_existing = true
        policyName = "iks-demo-vm-infra-config-policy"
    }

    instance_type = {
        use_existing = true
        name = "iks-demo-vm-instance-type-medium"
    }
    
    addons = [
    {
        createNew = false
        addonPolicyName = "iks-demo-smm-addon"
    }
  ]
    
    organization = var.intersight_organization
}

