# Ansible VXLAN EVPN Catalogue

Static catalogue for Cisco VXLAN EVPN automation with Ansible (129 items):
`cisco.nac_dc_vxlan` 0.9.1 roles and data-model sections,
`cisco.nxos` 14.0.0 VXLAN EVPN modules and every `cisco.dcnm` 3.13.1 module.

- Page: /zfrontier/ansible-vxlan-modules/
- Combined playbook: `site.yml`
- Combined sample model: `sample/vxlan-model.yml`
- Inventory placeholders: `inventory.yml`
- Each `models/<name>.yml` starts with a `references` block (doc URL, collection and version, module or role, schema path).

```bash
ansible-galaxy collection install cisco.nac_dc_vxlan:0.9.1 cisco.nxos:14.0.0 cisco.dcnm:3.13.1
ansible-playbook --syntax-check -i inventory.yml site.yml
```

Credentials are placeholders only. Do not commit real passwords.
