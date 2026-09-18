from py_modules.main_modules import *
from os import path, makedirs
from json import load
from sys import exit
from subprocess import run


webkey = "lab-web-server-key"
appkey = "lab-app-server-key"
key_dir = "./project-infrastructure"

if not path.exists(key_dir):
    makedirs(key_dir)

generate_ssh_keys(webkey, key_dir)
generate_ssh_keys(appkey, key_dir)


# ---------------------------------------------------------------------------
infra_dir = "./project-infrastructure"
server = "lab_servers"
log_dir = "./project-infrastructure/logs"

# Creating Infrastructure using Terraform
terraform_init(infra_dir, server, log_dir)
terraform_apply(infra_dir, server, log_dir)
terraform_outputs(infra_dir, server, ".")

print(f"-----{server} created successfully")


# Message
with open(".lab_servers_output.json", "r") as var_file:
    server = load(var_file)
lab_web_server_ip = server["lab_web_public_ip"]["value"]

print(f"-----lab_web_server is running at http://{lab_web_server_ip}")

start_session = input("Do you want to start session (y/n): ")

if start_session == "y":
    run(["python3", "start-session.py"])
else:
    print("-----Exited")
    exit()

