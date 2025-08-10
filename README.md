# incus-tofu-k8 

Creating a kubernetes cluster for a home-lab on an `Alpine3.22` server,
using `incus`, `talos`, and `opentofu`.

- prepare the host machine:
```bash
./setup-host.sh
```

- prepare incus:
```bash
incus admin init
```

- prepare tofu:
```bash
tofu init
```

## launching a talos VM via incus using an ISO

- pull the latest talos ISO from [here](https://factory.talos.dev)
  - at time of writing the ISO was downloaded from [this](https://factory.talos.dev/image/376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba/v1.10.6/metal-amd64.iso) url which was generated from the above link.



## References
- [terraform-provider-incus](https://search.opentofu.org/provider/lxc/incus/latest)
- [launch a vm that boots from an ISO](https://linuxcontainers.org/incus/docs/main/howto/instances_create/#launch-a-vm-that-boots-from-an-iso)
