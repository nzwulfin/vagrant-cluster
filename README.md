This is a stub to create a Gluster cluster, a Ceph cluster and F23 Atomic hosts for testing

* All VMs share a 172.x network called "storage"
* All VMs share a public network on the vagrant libvirt default

Gluster and ceph multinode setup based on:
https://github.com/carmstrong/multinode-glusterfs-vagrant
https://github.com/carmstrong/multinode-ceph-vagrant


Testing use the upstream Kubernetes examples found here:
https://github.com/kubernetes/kubernetes/tree/master/examples/glusterfs
https://github.com/kubernetes/kubernetes/tree/master/examples/rbd

To create the F23 cluster via ansible use:
`vagrant up --no-provision && vagrant provision`
