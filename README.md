# collection

[![cicd-tools](https://img.shields.io/badge/ci/cd:-cicd_tools-blue)](https://github.com/cicd-tools-org/cicd-tools) [![license](https://img.shields.io/github/license/osx-provisioner/collection)](LICENSE) [![collection](https://img.shields.io/badge/collection-osx_provisioner.collection-blue)](https://galaxy.ansible.com/osx_provisioner/collection)

A collection of OSX automation tools for [Ansible](https://www.ansible.com/).

- [![collection-github-workflow-push](https://github.com/osx-provisioner/collection/actions/workflows/workflow-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-push.yml)<sup> (Main)</sup>
- [![collection-github-workflow-push](https://github.com/osx-provisioner/collection/actions/workflows/workflow-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-push.yml)<sup> (Dev)</sup>

## Table of Contents

This collection contains the following roles for OSX related tasks:

| Role Name                                                                                      | Description and Build Status                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [asdf](https://github.com/osx-provisioner/collection/tree/main/roles/asdf)                     | Manage [asdf](https://asdf-vm.com/) installations on OSX.<br />[![role-asdf](https://github.com/osx-provisioner/collection/actions/workflows/workflow-asdf-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-asdf-push.yml)<sup> (Main)</sup><br />[![role-asdf](https://github.com/osx-provisioner/collection/actions/workflows/workflow-asdf-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-asdf-push.yml)<sup> (Dev)</sup>                                                                                                                 |
| [clamav](https://github.com/osx-provisioner/collection/tree/main/roles/clamav)                 | Manage [ClamAV](https://www.clamav.net/) installations on OSX.<br />[![role-clamav](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml)<sup> (Main)</sup><br />[![role-clamav](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-clamav-push.yml)<sup> (Dev)</sup>                                                                                                |
| [colima](https://github.com/osx-provisioner/collection/tree/main/roles/colima)                 | Manage [Colima](https://github.com/abiosoft/colima) installations on OSX.<br />[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml)<sup> (Main)</sup><br />[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml)<sup> (Dev)</sup>                                                                                     |
| [downloader](https://github.com/osx-provisioner/collection/tree/main/roles/downloader)         | Simplifies fetching groups of remote files.<br />[![role-downloader](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml)<sup> (Main)</sup><br />[![role-downloader](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-downloader-push.yml)<sup> (Dev)</sup>                                                                                           |
| [firewall](https://github.com/osx-provisioner/collection/tree/main/roles/firewall)             | Manage the OSX firewall down to the [pf](https://www.openbsd.org/faq/pf/index.html) layer.<br />[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-firewall-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml)<sup> (Main)</sup><br />[![role-colima](https://github.com/osx-provisioner/collection/actions/workflows/workflow-colima-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-firewall-push.yml)<sup> (Dev)</sup>                                                                |
| [homebrew_retry](https://github.com/osx-provisioner/collection/tree/main/roles/homebrew_retry) | Install software via [Homebrew](https://brew.sh/) with a handy retry mechanism to fend off unstable networks.<br />[![role-homebrew_retry](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml)<sup> (Main)</sup><br />[![role-homebrew_retry](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homebrew_retry-push.yml)<sup> (Dev)</sup> |
| [homeshick](https://github.com/osx-provisioner/collection/tree/main/roles/homeshick)           | Use [homeshick](https://github.com/andsens/homeshick) to manage your home folder dotfiles.<br />[![role-homeshick](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homeshick-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homeshick-push.yml)<sup> (Main)</sup><br />[![role-homeshick](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homeshick-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-homeshick-push.yml)<sup> (Dev)</sup>                                                  |
| [jumpcloud](https://github.com/osx-provisioner/collection/tree/main/roles/jumpcloud)           | Manage [JumpCloud](https://jumpcloud.com/) installations on OSX.<br />[![role-jumpcloud](https://github.com/osx-provisioner/collection/actions/workflows/workflow-jumpcloud-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-jumpcloud-push.yml)<sup> (Main)</sup><br />[![role-jumpcloud](https://github.com/osx-provisioner/collection/actions/workflows/workflow-jumpcloud-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-jumpcloud-push.yml)<sup> (Dev)</sup>                                                                            |
| [symlinks](https://github.com/osx-provisioner/collection/tree/main/roles/symlinks)             | Simplifies creating groups of symlinks on your filesystem.<br />[![collection-github-workflow-symlinks-push](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml/badge.svg?branch=main)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml)<sup> (Main)</sup><br />[![role-symlinks](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/collection/actions/workflows/workflow-symlinks-push.yml)<sup> (Dev)</sup>                                                             |

## Installation


Install via Ansible Galaxy:

```ansible-galaxy collection install osx_provisioner.collection```

Or include this collection in your playbook's requirements.yml file:

```yaml
---
collections:
  - name: osx_provisioner.collection
```

### Galaxy Requirements

The external [Ansible Galaxy](https://galaxy.ansible.com/) requirements for this collection are defined in its own [requirements.yml](https://github.com/osx-provisioner/collection/tree/main/requirements.yml) file.

## Usage

A thorough example of using this collection can be found in my own [OSX system profile](https://github.com/niall-byrne/osx-system-profile) repository.
This profile, uses the [mac_maker](https://github.com/osx-provisioner/mac_maker) provisioning tool to apply an [Ansible Playbook](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html) using this collection.

## License

[MIT](LICENSE)
