from subprocess import run
from json import load
from os import path
from sys import exit

server_output_file = ".lab_servers_output.json"

if not path.exists(server_output_file):
    print('--!--Server JSON file is missing, run "create_infra.py before running this file')
    print("-----Exited")
    exit()

# Loads Instance_id or SSM Session
with open(server_output_file, "r") as var_file:
    server = load(var_file)
lab_web_server_id = server["lab_web_id"]["value"]
lab_app_server_id = server["lab_app_id"]["value"]

# Choice of server to log in
server_choice = input("-----Select server to start session:\n     1. lab_web_server\n     2. lab_app_server\n---->")
if server_choice == "1":
    print(f"-----Starting session ({lab_web_server_id})")
    run(["aws", "ssm", "start-session", "--target", f"{lab_app_server_id}"], check=True)
elif server_choice == "2":
    print(f"-----Starting session ({lab_app_server_id})")
    run(["aws", "ssm", "start-session", "--target", f"{lab_web_server_id}"], check=True)
else:
    print("-----Exited")