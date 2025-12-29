# What is this role?
This role allows you to add a DNS record on your server running DNS, which will update this for all your VM's joined to the domain

**Variables required to specify**

In defaults/main.yml
    {{ dns_name }}, ex. (<name>.zone)
    {{ record_type }} ex. (A,TXT,AAA)
    {{ dns_targetIP }} ex. (185.85.20.1)
Specified in range config
    {{ dns_zone }} - this zone MUST already exist on the DC! ex. if you're domain is DOMAIN.LOCAL, set dns_zone = 'DOMAIN.LOCAL'

**SEE default/main.yml & defaultrange.yml for example of usage of this role**


# README

This template includes a task yml for caching downloads to the Ludus host (download_file.yml) as well as GitHub action to push the role to Ansible Galaxy when a tag is created in git. You'll need to get a [Galaxy token](https://galaxy.ansible.com/ui/token/) and set it as `GALAXY_API_KEY` in [Github Secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository) for the Ansible Galaxy deployment to work correctly.

Remove this section, and replace all `{{ variable }}` strings. Write your tasks in `./tasks/main.yml`

# Ansible Role: {{ Thing }} ([Ludus](https://ludus.cloud))

An Ansible Role that installs [{{ Something }}](https://example.com) on {{ type of host }} and optionally configures [{{ Another Thing }}](https://example).

> [!WARNING]
> This is a warning about something in this role

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    # This is a comment explaining the variable below
    ludus_thing_variable1: true

## Dependencies

None.

## Example Playbook

```yaml
- hosts: {{ thing }}_hosts
  roles:
    - {{ your github username }}.{{ this repo name }}
  vars:
    {{ role vars here }}
```

## Example Ludus Range Config

```yaml
ludus:
  - vm_name: "{{ range_id }}-ad-dc-win2022-server-x64-1"
    hostname: "{{ range_id }}-DC01-2022"
    template: win2022-server-x64-template
    vlan: 10
    ip_last_octet: 11
    ram_gb: 6
    cpus: 4
    windows:
      sysprep: true
    domain:
      fqdn: ludus.domain
      role: primary-dc
    roles:
      - {{ your github username }}.{{ this repo name }}
    role_vars:
      {{ example role var usage }}
```

## License

[//]: # (If you change the License type, be sure to change the actual LICENSE file as well)
MIT

## Author Information

This role was created by [{{Your Github Username}}](https://github.com/{{ your github username }}), for [Ludus](https://ludus.cloud/).
