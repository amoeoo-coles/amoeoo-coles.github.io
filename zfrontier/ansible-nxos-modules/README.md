# Ansible cisco.nxos Module Catalogue

Static catalogue of every module in the `cisco.nxos` Ansible collection
(14.0.0, 80 modules), in chronological build order.

- Page: /zfrontier/ansible-nxos-modules/
- Per-module models (each starts with a `references` block): `models/<module>.yml`
- Per-module playbooks: `playbooks/<NNN>_<module>.yml`
- Combined playbook: `site.yml`
- Combined sample model: `sample/nxos-model.yml`
- Inventory placeholders: `inventory.yml`
- Null-stripping filter: `playbooks/filter_plugins/nxos_model.py`

Groups:

- 1. System and bootstrap: 5
- 2. AAA, users and management: 4
- 3. Interfaces: 5
- 4. Layer 2 (VLANs, VTP, LACP, vPC): 10
- 5. Layer 3 routing: 22
- 6. Multicast: 6
- 7. VXLAN EVPN: 7
- 8. Security and ACLs: 2
- 9. QoS: 0
- 10. Monitoring, logging and SNMP: 3
- 11. Operations and utility: 12
- 12. SAN / Fibre Channel: 4
- 13. Other: 0

```bash
ansible-galaxy collection install cisco.nxos:14.0.0
ansible-playbook --syntax-check -i inventory.yml site.yml
ansible-playbook -i inventory.yml site.yml --tags gathered \
  -e nxos_host=nxos-01.example.net -e ansible_user=admin -e ansible_password='***'
```

Credentials are placeholders only. Do not commit real passwords.
