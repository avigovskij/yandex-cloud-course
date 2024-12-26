import subprocess
import json

import yaml


subprocess.run('terraform apply -auto-approve', shell=True, cwd='./terraform')
terraform_output = subprocess.run('terraform output -json machines', shell=True, capture_output=True, cwd='./terraform')

target_machines = json.loads(terraform_output.stdout.decode())
inventory_content = {'ungroupped': {'hosts': {}}}


for target_machine in target_machines:
    inventory_content['ungroupped']['hosts'][target_machine['ip']] = {
        'ansible_ssh_user': target_machine['user']
    }

with open('./ansible/inventory.yml', 'w') as yaml_output_file:
    yaml.dump(inventory_content, yaml_output_file)

ansible_outptu = subprocess.run(
    'ansible-playbook -i ./inventory.yml playbook.yml',
    shell=True,
    cwd='./ansible'
)
