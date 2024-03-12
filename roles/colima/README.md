# colima

### Main Branch
[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml)

### Dev Branch
[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml)

Ansible role that installs the [Docker Desktop](https://www.docker.com/products/docker-desktop/) alternative [colima](https://github.com/abiosoft/colima).

### Catalina and Later

When using Colima as a service **Full Disk Access** in OSX may be problematic.  
- In particular, it can be irksome when removable volumes are not accessible from inside a container.

For those experiencing this problem, a manual workaround can be found with the use of `fdautil`, a component of [LaunchControl](https://soma-zone.com/LaunchControl/).
- Although this application is proprietary, the enclosed free to use `fdautil` binary it ships with provides a secure method of granting **Full Disk Access**.  (And it's a great tool!)

#### Full Disk Access Workaround

Use `fdautil` as a proxy, grant it **Full Disk Access**, then follow these 4 steps:

1. In your terminal execute:
    ```bash
      sudo /usr/local/bin/fdautil set agent com.github.abiosoft.colima /bin/bash /usr/local/bin/colima-start-fg.sh
    ```

2. Next, modify `~/Library/LaunchAgents/com.github.abiosoft.colima.plist`:
   - change:
      ```html
        <string>/bin/bash</string>
        <string>/usr/local/bin/colima-start-fg.sh</string>
      ```
   - to:
      ```html
        <string>/usr/local/bin/fdautil</string>
        <string>exec</string>
        <string>/bin/bash</string>
        <string>/usr/local/bin/colima-start-fg.sh</string>
      ```

3. Then, secure your startup script to prevent it from becoming a point of escalation:
    ```bash
      chmod 755 /usr/local/bin/colima-start-fg.sh
      chown root:wheel /usr/local/bin/colima-start-fg.sh
    ```

4. Finally, unload and reload your service:
    ```bash
      launchctl unload -w ~/Library/LaunchAgents/com.github.abiosoft.colima.plist
      launchctl load -w ~/Library/LaunchAgents/com.github.abiosoft.colima.plist
    ```

This is fairly easy to automate in Ansible, however I'm hesitant to bundle [LaunchControl](https://soma-zone.com/LaunchControl/) with this role and will instead leave these hints for others in this situation.

Requirements
------------

- [Homebrew](https://brew.sh/) must already be present on the machine ([geerlingguy.mac.homebrew](https://github.com/geerlingguy/ansible-collection-mac) is a great solution for this).

Role Variables
--------------

| Variable Name                           | Value                                                                                                                                                                |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| brew_prefix                             | Usually `/usr/local` or `/opt/homebrew` depending on your OSX version.                                                                                               |
| colima_homebrew_retries                 | The number of attempts homebrew should make to install colima.                                                                                                       |
| colima_service_additional_profiles      | A list of additional colima profiles to create when writing the configuration.<br />(This is particularly useful for preserving backup copies of the configuration.) |
| colima_service_default_profile          | This is the colima profile that is used by the installed service.                                                                                                    |
| colima_service_startup_delay            | The number of seconds after boot to wait until colima starts up.  Useful for slow mounting disks.                                                                    |
| colima_service_stderr_log_file          | The stderr log file for the installed launchd service.                                                                                                               |
| colima_service_stdout_log_file          | The stdout log file for the installed launchd service.                                                                                                               |
| colima_service_user                     | The user to configure colima with.                                                                                                                                   |
| colima_cpus                             | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_disk_gigs                        | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_memory_gigs                      | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_arch                             | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_runtime                          | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_kubernetes_enabled               | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_kubernetes_version               | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_kubernetes_args                  | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_auto_activate                    | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_network_address                  | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_network_dns                      | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_network_dns_hosts                | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_network_driver                   | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_forward_agent                    | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_docker_config                    | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_vm_type                          | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_use_rosetta                      | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_mount_type                       | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_mount_inotify                    | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_cpu_type                         | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_layer                            | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_provision_script                 | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_ssh_config                       | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_mounts                           | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |
| colima_environment_variables            | See the [configuration template](templates/colima/colima.yaml.j2) for details.                                                                                       |

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
      colima_service_user: "{{ ansible_user_id }}"
      colima_mounts:
        - location: /Users/{{ colima_service_user }}
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
