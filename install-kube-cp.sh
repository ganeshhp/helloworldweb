### script to install containerd and kubernetes services
## YELLOW='\033[0;33m'

sudo apt-get update
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

##echo -r "${YELLOW} Load the required kernel modules on the node"
sleep 3

sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter

## echo -e "${YELLOW} Configure the critical kernel parameters for Kubernetes"
sleep 5

sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

## reload all changes

sudo sysctl --system

### install containerd runtime

sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

### enable docker repository

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

### update package list and install containerd

sudo apt update
sudo apt install -y containerd.io

### configure containerd to start using sysntemd as cgroup.

containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

## restart and enable containerd service

sudo systemctl restart containerd
sudo systemctl enable containerd

### add kubernetes package repository with below coammnds,

sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

### install kubectl, kubelet nd kubeadm 

sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

### initiate cluster
echo -e "Initialize the Cluster on the Control-Plane Node"
sleep 5

#ipaddr=$(hostname --all-ip-addresses)
#sudo kubeadm init --apiserver-advertise-address=$ipaddr --ignore-preflight-errors=all | tee outfile

sudo kubeadm init --ignore-preflight-errors=all

### add kubectl config file

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

## install network add-on (calico) on cluster node as daemonset.
## echo -e "${YELLOW} Let's add Network Add-On on the cluster nodes. This will create a Daemonset in the cluster"

sleep 5

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/calico.yaml

## xtract cluster join command from cluster install logs
tail -n -2 outfile | tee shell.sh
sudo  chmod +x shell.sh

YELLOW='\033[0;33m'

echo -e "\n"
echo -e "\n"
echo -e "${YELLOW} To add the worker Node to the Cluster, execute the 'shell.sh' file on worker node in sudo mode."
echo -e "\n"
echo -e "\n"

