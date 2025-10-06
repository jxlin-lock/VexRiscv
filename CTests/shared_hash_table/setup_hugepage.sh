sudo sysctl -w vm.nr_hugepages=10
sudo mount -t hugetlbfs none /dev/hugepages
