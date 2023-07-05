# clamav

### Master Branch
[![role-clamav](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml)

### Dev Branch
[![role-clamav](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml)

Ansible role that installs ClamAV antivirus on OSX machines.

### Notes
- See the [ClamAV GitHub Repository](https://github.com/Cisco-Talos/clamav) for further details about this tool.

### Catalina and Later

On OSX versions >= 10.15, there's a manual post installation step that should be done to maximize protection.  (This is required to monitor the `Downloads` folder.)

ClamAV should be granted `Full Disk Access`.  This requires making the appropriate selection inside `System Preferences --> Security`:

![SystemPreferences](.documentation/SystemPreferences.png)

Requirements
------------

- [Homebrew](https://brew.sh/) must already be present on the machine ([geerlingguy.mac.homebrew](https://github.com/geerlingguy/ansible-collection-mac) is a great solution for this).

Role Variables
--------------

| Variable Name                      | Value                                                                                                    |
|------------------------------------|----------------------------------------------------------------------------------------------------------|
| brew_user                          | The user to run homebrew operations as.                                                                  |
| brew_prefix                        | Usually `/usr/local` or `/opt/homebrew` depending on your OSX version.                                   |
| clamav_clamd_config_file           | The clamd daemon configuration file installation location.                                               |
| clamav_clamd_daemon_log_file       | The clamd daemon log file.                                                                               |
| clamav_clamd_stderr_log_file       | The clamd service stderr log file.                                                                       |
| clamav_clamd_stdout_log_file       | The clamd service stdout log file.                                                                       |
| clamav_clamwatch                   | A boolean that indicates whether the clamwatch daemon should be installed.                               |
| clamav_clamwatch_target_folder     | The folder the clamwatch daemon will monitor.                                                            |
| clamav_clamwatch_quarantine_folder | The folder the clamwatch daemon will move infected files to.                                             |
| clamav_clamwatch_stderr_log_file   | The clamwatch service stderr log file path.                                                              |
| clamav_clamwatch_stdout_log_file   | The clamwatch service stdout log file path.                                                              |
| clamav_database_location           | The location of the virus definition database.                                                           |
| clamav_freshclam_config_file       | The freshclam daemon configuration file installation location.                                           |
| clamav_freshclam_daemon_log_file   | The freshclam daemon log file.                                                                           |
| clamav_freshclam_stderr_log_file   | The freshclam service stderr log file.                                                                   |
| clamav_freshclam_stdout_log_file   | The freshclam service stdout log file.                                                                   |
| clamav_homebrew_retries            | Sets the number of attempts homebrew will make to install dependencies. (For flaky network connections.) |

[See The Default Values](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: all
  roles:
  - role: elliotweiser.osx-command-line-tools # Dependency of geerlingguy.mac.homebrew
  - role: geerlingguy.mac.homebrew
  - role: osx_provisioner.collection.clamav
    vars:
      brew_prefix: /usr/local
      clamav_clamwatch: true
      clamav_clamwatch_target_folder: "{{ lookup('env','HOME') }}/Downloads"
      clamav_clamwatch_quarantine_folder: "{{ lookup('env','HOME') }}/Quarantine"      
```

License
-------

MIT

(ClamAV itself is licensed as GPLv2)

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
