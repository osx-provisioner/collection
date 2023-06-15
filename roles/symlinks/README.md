# symlinks

### Master Branch
[![role-symlinks](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml)

### Dev Branch
[![role-symlinks](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml)

Ansible role that creates the configured symlinks.

Requirements
------------

None

Role Variables
--------------

Symlinks can be specified in the following format:

```yaml
symlinks:
  - link: /Users/{{ ansible_user_id }}/iCloud
    target: /Users/{{ ansible_user_id }}/Library/Mobile Documents/com~apple~CloudDocs
    force: true
  - link: /Users/{{ ansible_user_id }}/workspace
    target: /Volumes/Code/
```

The following variables are also configured:

| Variable Name | Value                                 |
|---------------|---------------------------------------|
| symlinks_user | The user to write the symlinks with.  |

[See The Default Values](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: all
  roles:
  - role: osx_provisioner.collection.symlinks
    vars:
      symlinks_user: "{{ ansible_user_id }}"
      symlinks:
        - link: /Users/{{ symlinks_user }}/iCloud
          target: /Users/{{ symlinks_user }}/Library/Mobile Documents/com~apple~CloudDocs
          force: true
        - link: /Users/{{ symlinks_user }}/workspace
          target: /Volumes/Code/
```

License
-------

MIT

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
