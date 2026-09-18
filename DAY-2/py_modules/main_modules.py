import os
import subprocess
import sys


# -----------------------------------------------------------------------------------------
def generate_ssh_keys(key_name, key_cwd="."):
    key_dir = os.path.join(key_cwd, ".ssh_keys")
    os.makedirs(key_dir, exist_ok=True)

    # Generate SSH keys if they don't already exist
    if os.path.exists(f"{key_dir}/{key_name}") and os.path.exists(
        f"{key_dir}/{key_name}.pub"
    ):
        print(f"-----{key_name} already exist. Skipping key generation")
    else:
        print(f"-----Generating SSH keys {key_name}")
        subprocess.run(
            ["ssh-keygen", "-t", "ed25519", "-f", key_name, "-N", ""],
            cwd=key_dir,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=True,
        )


# -----------------------------------------------------------------------------------------
def terraform_init(terraform_cwd, server_name="server", log_dir=""):

    if log_dir == "":
        log_dir = os.path.join(terraform_cwd, "logs")
        log_path = os.path.join(log_dir, "tf_init.log")
        os.makedirs(log_dir, exist_ok=True)
    else:
        os.makedirs(log_dir, exist_ok=True)
        log_path = os.path.join(log_dir, "tf_init.log")

    print(f"-----Initializing Terraform ({server_name})")
    with open(log_path, "w") as log_file:
        tf_init = subprocess.run(
            ["terraform", "init"],
            cwd=terraform_cwd,
            stdout=log_file,
            stderr=log_file,
            text=True,
        )
    if tf_init.returncode != 0:
        print(f"--!--Error occured while initializing Terraform ({server_name})")
        sys.exit(1)


# -----------------------------------------------------------------------------------------
def terraform_apply(terraform_cwd, server_name="server", log_dir=""):

    if log_dir == "":
        log_dir = os.path.join(terraform_cwd, "logs")
        log_path = os.path.join(log_dir, "tf_apply.log")
        os.makedirs(log_dir, exist_ok=True)
    else:
        os.makedirs(log_dir, exist_ok=True)
        log_path = os.path.join(log_dir, "tf_apply.log")

    print(f"-----Applying Terraform configuration ({server_name})")
    with open(log_path, "w") as log_file:
        terraform_apply = subprocess.run(
            ["terraform", "apply", "-auto-approve"],
            cwd=terraform_cwd,
            stdout=log_file,
            stderr=log_file,
            text=True,
        )
    if terraform_apply.returncode != 0:
        print(
            f"--!--Error occured while applying Terraform configuration ({server_name}). Check {log_dir} for details."
        )
        sys.exit(1)


# -----------------------------------------------------------------------------------------
def terraform_outputs(terraform_cwd, server_name="server", outputs_file_path=""):
    if outputs_file_path == "":
        outputs_file_path = os.path.join(terraform_cwd, f".{server_name}_output.json")
    else:
        outputs_file_path = f"{outputs_file_path}/.{server_name}_output.json"

    # Direct the outputs to a json file
    print(f"-----Getting terraform outputs ({server_name})")
    with open(outputs_file_path, "w") as outputs_file:
        tmp_tf_output = subprocess.run(
            ["terraform", "output", "-json"],
            cwd=terraform_cwd,
            stdout=outputs_file,
            stderr=outputs_file,
            text=True,
        )
    if tmp_tf_output.returncode != 0:
        print(f"--!--Error occured while retrieving Terraform outputs ({server_name})")
        sys.exit(1)
        


# -----------------------------------------------------------------------------------------
def terraform_destroy(terraform_cwd, server_name="server", log_dir=""):

    if log_dir == "":
        log_dir = os.path.join(terraform_cwd, "logs")
        log_path = os.path.join(log_dir, "tf_destroy.log")
        os.makedirs(log_dir, exist_ok=True)
    else:
        os.makedirs(log_dir, exist_ok=True)
        log_path = os.path.join(log_dir, "tf_destroy.log")

    print(f"-----Destroying infrastructure -> Terraform ({server_name})")
    with open(log_path, "w") as log_file:
        terraform_apply = subprocess.run(
            ["terraform", "destroy", "-auto-approve"],
            cwd=terraform_cwd,
            stdout=log_file,
            stderr=log_file,
            text=True,
        )
    if terraform_apply.returncode != 0:
        print(
            f"--!--Error occured while destroying Terraform Infrastructure ({server_name}). Check {log_dir} for details."
        )
        sys.exit(1)