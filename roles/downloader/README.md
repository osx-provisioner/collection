# downloader

### Master Branch
[![role-downloader](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml)

### Dev Branch
[![role-downloader](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml)

Ansible role that fetches remote content and places it in a configurable location.

Requirements
------------

None

Role Variables
--------------

Each remote url can be specified in the following format:

```yaml
download_remote_urls:
  - url: http://cdn.propellerheads.se/Reason10/Reason_1041_d4-Stable_164_10.dmg
    name: Reason10.dmg
  - url: https://fael-downloads-prod.focusrite.com/customer/prod/s3fs-public/downloads/Scarlett%20MixControl-1.10_0.dmg
    name: MixControl-1.10_0.dmg
  - url: https://www.sws-extension.org/download/featured/sws-v2.10.0.1.dmg
    name: sws-v2.10.0.1.dmg
```

The following variables are also configured:

| Variable Name            | Value                                                                                          |
|--------------------------|------------------------------------------------------------------------------------------------|
| download_retries         | The number of attempts that will be made to download the file.                                 |
| download_save_user       | The user to write downloaded content as.                                                       |
| download_save_location   | The location to save the remote content to.                                                    |
| download_timeout         | The number of seconds without transfer inactivity before the connection is considered failed.  |

[See The Default Values](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: all
  roles:
  - role: osx_provisioner.collection.downloader
    vars:
      download_remote_urls:
        - url: http://cdn.propellerheads.se/Reason10/Reason_1041_d4-Stable_164_10.dmg
          name: Reason10.dmg
        - url: https://fael-downloads-prod.focusrite.com/customer/prod/s3fs-public/downloads/Scarlett%20MixControl-1.10_0.dmg
          name: MixControl-1.10_0.dmg
        - url: https://www.sws-extension.org/download/featured/sws-v2.10.0.1.dmg
          name: sws-v2.10.0.1.dmg
```

License
-------

MIT

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
