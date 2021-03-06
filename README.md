## Terraform plan to deploy centos7 droplet(s) at Digital Ocean

### Requirements

- [Terraform](http://www.terraform.io/downloads.html)
- Account at [Digital Ocean](https://www.digitalocean.com)
- Generated [token](https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2#HowToGenerateaPersonalAccessToken) at Digital Ocean
- [Ssh key](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets) added to your Digital Ocean account
- Get your pub key [fingerprint](http://stackoverflow.com/questions/9607295/how-do-i-find-my-rsa-key-fingerprint), use ssh-keygen -E md5 -lf when md5.
- Enough credits on your Digital Ocean account :-)

### Features

- Deployment centos7 OS with terraform
- System update to latest centos7

### Instructions

Set environment variables

```
export DO_PAT=[your generated toke]
export SSH_FINGERPRINT="[your public key fingerprint]"
export TF_LOG=1
```

Check your infrastructure execution plan

```
terraform plan \ 
-var "do_token=${DO_PAT}" \ 
-var "pub_key=~/.ssh/id_rsa.pub" \
-var "pvt_key=~/.ssh/id_rsa" \
-var "ssh_fingerprint=$SSH_FINGERPRINT"
```

Apply your infrastructure execution plan

```
terraform apply \ 
-var "do_token=${DO_PAT}" \ 
-var "pub_key=~/.ssh/id_rsa.pub" \
-var "pvt_key=~/.ssh/id_rsa" \
-var "ssh_fingerprint=$SSH_FINGERPRINT"
```

Show your infrastructure setup

```
terraform show

digitalocean_droplet.centos7node1:
  id = 9639873
  image = centos-7-0-x64
  ipv4_address = [public ip]
  ipv4_address_private = [private ip]
  locked = false
  name = centos7node1
  private_networking = true
  region = ams3
  size = 512mb
  ssh_keys.# = 1
  ssh_keys.0 =  [your fingerprint]
  status = active
digitalocean_droplet.centos7node2:
  id = 9639874
  image = centos-7-0-x64
  ipv4_address = [public ip]
  ipv4_address_private = [private ip]
  locked = false
  name = centos7node2
  private_networking = true
  region = ams3
  size = 512mb
  ssh_keys.# = 1
  ssh_keys.0 = [your fingerprint]
  status = active

```

### Reference(s)

- https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean
