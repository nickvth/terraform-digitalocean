## Terraform plan to deploy centos7 droplet(s) at Digital Ocean

### Requirements

- [Terraform](http://www.terraform.io/downloads.html)
- Account at [digitalocean](https://www.digitalocean.com)
- Generated [token](https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2#HowToGenerateaPersonalAccessToken) at digitalocean
- [Ssh key](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets) added to your digitalocean account
- Get your pub key [fingerprint](http://stackoverflow.com/questions/9607295/how-do-i-find-my-rsa-key-fingerprint), use ssh-keygen -E md5 -lf when md5.
- Enough credits on your account :-)

### Features

- Deployment centos7 OS with terraform
- System update to latest centos7

### Instructions

```
export DO_PAT=[your generated toke]
export SSH_FINGERPRINT="[your public key fingerprint]"
export TF_LOG=1

terraform plan \ 
-var "do_token=${DO_PAT}" \ 
-var "pub_key=~/.ssh/id_rsa.pub" \
-var "pvt_key=~/.ssh/id_rsa" \
-var "ssh_fingerprint=$SSH_FINGERPRINT"

terraform apply \ 
-var "do_token=${DO_PAT}" \ 
-var "pub_key=~/.ssh/id_rsa.pub" \
-var "pvt_key=~/.ssh/id_rsa" \
-var "ssh_fingerprint=$SSH_FINGERPRINT"
```

### Reference(s)

- https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean
