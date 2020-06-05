# Ansible infrastructure deployment

# Running the playbooks on all nodes:
```bash
ansible-playbook ./site.yml
```

### SSH keygen
```bash
mkdir .secrets
ssh-keygen -t ecdsa -b 521 -C "ansible@${HOSTNAME}" -f ./.secrets/ansible_key -P ''
```

### Generating ansible password
```bash
# If you want to know your password
#!/bin/bash
export LC_ALL=C
export NEW_PASS="$(stdbuf -o0 tr -dc 'a-zA-Z0-9-!"@/#$%^&*()_+~' < /dev/random | head -c "$((20 + RANDOM % 100))")"

echo -n "$NEW_PASS" > .secrets/ansible-pass.txt
echo -n "$NEW_PASS" | python3 -c 'import crypt; print(crypt.crypt("somesecret", crypt.mksalt(crypt.METHOD_SHA512)))' > .secrets/ansible-pass.crypt
```
