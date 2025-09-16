import os

def main():
    user = input("Enter filename: ")
    prefix = "/tmp/"
    full_path = prefix + user
    print("Checking:", full_path)
    
    safe_cmd = "ls /etc"
    dangerous_cmd = "cat " + full_path
    os.system(safe_cmd)
    os.system(dangerous_cmd)
    