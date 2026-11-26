# Ansible cisco.aci Module Catalogue

Static catalogue of every module in the `cisco.aci` Ansible collection
(3.0.0, 287 modules).

- Page: https://amoeoo-coles.github.io/zfrontier/ansible-aci-modules/
- Combined playbook: `site.yml`
- Combined sample model: `sample/aci-model.yml`
- Inventory placeholders: `inventory.yml`

```bash
ansible-galaxy collection install cisco.aci:3.0.0
ansible-playbook --syntax-check -i inventory.yml site.yml \
  -e apic_host=apic.example.com -e apic_username=admin -e apic_password=placeholder
```

Credentials are placeholders only. Do not commit real passwords.
