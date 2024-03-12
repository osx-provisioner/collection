# firewall

### Main Branch
[![role-firewall](https://github.com/osx-provisioner/collection/actions/workflows/workflow-firewall-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-firewall-push.yml)

### Dev Branch
[![role-firewall](https://github.com/osx-provisioner/collection/actions/workflows/workflow-firewall-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-firewall-push.yml)

Ansible role that manages the OSX firewall.

Requirements
------------

None

Role Variables
--------------

| Variable Name                    | Value                                                                                          |
|----------------------------------|------------------------------------------------------------------------------------------------|
| firewall_enabled                 | A boolean indicating if the firewall should be enabled.                                        |                                                                                                             |
| firewall_allow_builtin_apps      | A boolean indicating if OSX builtin apps should automatically be permitted to receive traffic. |
| firewall_allow_all_signed_apps   | A boolean indicating if ALL signed apps should automatically be permitted to receive traffic.  |
| firewall_block_all_enabled       | A boolean indicating if ALL traffic should be blocked, with some OS related permits.           |
| firewall_logging_enabled         | A boolean indicating if logging should be enabled on the firewall.                             |
| firewall_logging_level           | A string indicating the type of logging.  Valid options: "throttled", "brief" or "detail".     |
| firewall_stealth_mode_enabled    | A boolean indicating if stealth mode should be enabled on the firewall.                        |
| firewall_apps_blocked_paths      | A list of paths to apps that are blocked from receiving traffic.                               |
| firewall_apps_unblocked_paths    | A list of paths to apps that are permitted to receive traffic.                                 |
| firewall_apps_unmanaged_paths    | A list of paths to apps that are not managed by the firewall.                                  |
| firewall_service_stdout_log_file | The path of the packet filter customization service stdout log file.                           |
| firewall_service_stderr_log_file | The path of the packet filter customization service stderr log file.                           |

### Custom Packet Filter Anchors

This role also enables adding customized [pf](https://www.openbsd.org/faq/pf/index.html) firewall rules in the form of [anchors](https://www.openbsd.org/faq/pf/anchors.html).
- A small service is created that loads these anchors during boot so that the rules persist whenever the firewall is enabled.

The anchors themselves are defined by the `firewall_pf_anchors` variable in the following format:
```yaml
firewall_pf_anchors:
  - name: "A filename with no spaces that conforms to the anchor naming format."
    description: "A short description of what the anchor does."
    rules: |
      One or more pf configuration commands to customize the firewall.
```

[See The Default Values](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: all
  roles:
  - role: osx_provisioner.collection.firewall
    vars:
      firewall_enabled: true
      firewall_stealth_mode_enabled: true
      firewall_apps_blocked_paths:
        - "/usr/sbin/netbiosd"
      firewall_pf_anchors:
        - name: "enable_lan_vnc.pf"
          description: "Allow VNC traffic from 192.168.0.10"
          rules: |
            block drop in proto {tcp, udp} from any to any port = 5900
            pass in inet proto tcp from 192.168.0.10 to any port = 5900 keep state
```

License
-------

MIT

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
