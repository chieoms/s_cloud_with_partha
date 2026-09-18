from py_modules.main_modules import terraform_destroy
from shutil import rmtree
from pathlib import Path
from os import path, remove

# Terraform Destroy
infra_dir = "./project-infrastructure"
server = "lab-servers"
log_dir = "./project-infrastructure/logs"

terraform_destroy(infra_dir, server, log_dir)


# Remove Generated SSH Keys
key_dir = Path("./project-infrastructure/.ssh_keys").resolve()
print(f"-----Removing SSH keys {server}")
protected_dir = Path("./project-infrastructure").resolve()

if key_dir.is_dir():
    if key_dir == protected_dir:
        raise ValueError("You cannot delete this directory")

    rmtree(key_dir)


# Remove create_infra.py logs
log_dir = "./project-infrastructure/logs"
tf_apply_log = Path(f"{log_dir}/tf_init.log").resolve()
tf_init_log = Path(f"{log_dir}/tf_apply.log").resolve()
server_outputs = Path(".lab_servers_output.json").resolve()
generated_files = [tf_apply_log, tf_init_log, server_outputs]

for filepath in generated_files:
    if path.exists(filepath):
        remove(filepath)
        print(f"-----removed {filepath}")
