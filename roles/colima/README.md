# colima

### Master Branch
[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml)

### Dev Branch
[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml)

Ansible role that installs the [Docker Desktop](https://www.docker.com/products/docker-desktop/) alternative [colima](https://github.com/abiosoft/colima).

Requirements
------------

- [Homebrew](https://brew.sh/) must already be present on the machine ([geerlingguy.mac.homebrew](https://github.com/geerlingguy/ansible-collection-mac) is a great solution for this).

Role Variables
--------------

| Variable Name                | Value                                                                                                                                                                 |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| brew_prefix                  | Usually `/usr/local` or `/opt/homebrew` depending on your OSX version.                                                                                                |
| colima_user                  | The user to configure colima with.                                                                                                                                    |
| colima_homebrew_retries      | The number of attempts homebrew should make to install colima.                                                                                                        |
| colima_default_profile       | This is the colima profile that is used by the installed service.                                                                                                     |
| colima_additional_profiles   | A list of additional colima profiles to create when writing the configuration.<br />(This is particularly useful for preserving backup copies of the configuration.)  |
| colima_cpus                  | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_disk_gigs             | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_memory_gigs           | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_arch                  | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_runtime               | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_kubernetes_enabled    | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_kubernetes_version    | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_kubernetes_args       | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_auto_activate         | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_network_address       | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_network_dns           | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_network_dns_hosts     | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_network_driver        | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_forward_agent         | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_docker_config         | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_vm_type               | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_use_rosetta           | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_mount_type            | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_mount_inotify         | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_cpu_type              | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_layer                 | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_provision_script      | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_ssh_config            | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_mounts                | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |
| colima_environment_variables | See the [configuration template](./templates/colima.yaml.j2) for details.                                                                                             |

[See The Default Values](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: all
  roles:
  - role: osx_provisioner.collection.colima
    vars:
      colima_user: "{{ ansible_user_id }}"
      colima_mounts:
        - location: /Users/{{ colima_user }}
          writable: true
        - location: /Volumes/Code
          writable: true
```

License
-------

MIT

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
