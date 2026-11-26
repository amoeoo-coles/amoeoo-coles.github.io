# Ansible cisco.mso Module Catalogue

Static catalogue of every module in the `cisco.mso` Ansible collection
(3.0.0, 135 modules).

- Page: https://amoeoo-coles.github.io/zfrontier/ansible-mso-modules/
- Combined playbook: `site.yml`
- Combined sample model: `sample/mso-model.yml`
- Inventory placeholders: `inventory.yml`

```bash
ansible-galaxy collection install cisco.mso:3.0.0
ansible-playbook --syntax-check -i inventory.yml site.yml \
  -e mso_host=ndo.example.com -e mso_username=admin -e mso_password=placeholder
```

Credentials are placeholders only. Do not commit real passwords.
