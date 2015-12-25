resource "digitalocean_droplet" "centos7node1" {
    image = "centos-7-0-x64"
    name = "centos7node1"
    region = "ams3"
    size = "512mb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]

 connection {
      user = "root"
      type = "ssh"
      key_file = "${var.pvt_key}"
      timeout = "2m"
  }

provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # update system
      "sudo yum -y update",
      "sudo reboot now"
    ]
  }
}
