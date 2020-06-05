#!/bin/sh
for file in $(find . | grep -P '([\w-_\s])+[.]y[a]?ml$')
do
  yamllint -c ./.yamllint.yml "$file"
  ansible-lint "$file"
done

