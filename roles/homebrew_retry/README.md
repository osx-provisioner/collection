# homebrew_retry

### Master Branch
[![role-homebrew_retry](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml)

### Dev Branch
[![role-homebrew_retry](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml)

Ansible role that installs homebrew apps, casks and taps in a retry loop to deal with connectivity issues.

Requirements
------------

- [Homebrew](https://brew.sh/) must already be present on the machine ([geerlingguy.mac.homebrew](https://github.com/geerlingguy/ansible-collection-mac) is a great solution for this).

Role Variables
--------------

### Standard Configuration

| Variable Name      | Vale                                                                                                                                                                                                                                                                                                                                              |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| brew_user          | The user to run homebrew operations as:<br />- This role requires [geeringguy.mac.homebrew](https://github.com/geerlingguy/ansible-collection-mac) to setup homebrew, you may need to set the `homebrew_user` variable in the top-level playbook.<br />- The default value will work fine if you're simply installing for the current user.       |
| brew_retries       | The number of attempts that will be made to install the homebrew apps, casks and taps.                                                                                                                                                                                                                                                            |
| brew_packages      | A list of homebrew apps install.                                                                                                                                                                                                                                                                                                                  |
| brew_casks         | A list of homebrew casks to install for ALL users.<br />- Homebrew typically installs these to `/Applications` by default.                                                                                                                                                                                                                        |
| brew_taps          | A list of homebrew taps to install.                                                                                                                                                                                                                                                                                                               |
| brew_install_state | Toggles between various install options:<br />- Set this to `latest` to install the newest version on each execution.<br />- Set this to `present` to simply ensure the app or cash is present.<br />- `latest` is temporarily disabled for casks due to [this issue](https://github.com/ansible-collections/community.general/issues/1647).      |
| brew_sudo_password | Some casks may require SUDO to complete their install (Zoom is an example...)  This variable gives you a way to override the default value used.                                                                                                                                                                                                  |

### Homebrew Cask Installation Options

This role provides 2 alternative locations to install Casks to:

#### User Casks

| Variable Name            | Vale                                                                                                                                                                                                                        |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| brew_user_casks          | A list of homebrew casks to install to a "user" location.                                                                                                                                                                   |
| brew_user_casks_location | This defaults to a separate `Applications` folder that will be created in the user's home directory for user only cask installs:<br />- You may alternatively specify another user install location, which will be created. |
  
#### Targeted Casks

| Variable Name                 | Vale                                                                                                                                                                                                                                                                             |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| brew_targeted_casks           | A list of homebrew casks to install to a custom location.                                                                                                                                                                                                                        |
| brew_targeted_casks_group     | This is the group with write permissions to this location. Defaults to `admin`.                                                                                                                                                                                                  |
| brew_targeted_casks_location  | This defaults to a separate `/opt/casks` folder that will be created:<br />- The primary intended use for targeted casks is a separate partition that is shared on a multi-boot mac setup.<br />- This would allow you to share apps between boot disks, to conserve disk space. |

[See The Default Values](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: all
  roles:
  - role: elliotweiser.osx-command-line-tools  # Dependency of geerlingguy.mac.homebrew
  - role: geerlingguy.mac.homebrew
  - role: osx_provisioner.collection.homebrew_retry
    vars:
      brew_packages:
        - mysql
      brew_retries: 42
```

License
-------

MIT

(Homebrew itself is licensed as BSD 2-Clause)

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
