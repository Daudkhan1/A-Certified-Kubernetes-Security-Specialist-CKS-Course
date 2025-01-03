output "kubeadm-master-public-ip" {
    value = aws_instance.kubeadm-master.public_ip
}

output "kubeadm-slave-public-ip" {
    value = aws_instance.kubeadm-slave.public_ip
}

 