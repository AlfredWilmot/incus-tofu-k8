# incus-tofu-k8 

Creating a kubernetes cluster for a home-lab on an `Alpine3.22` server,
using the tools listed above.

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

## References
- [terraform-provider-incus](https://search.opentofu.org/provider/lxc/incus/latest)
