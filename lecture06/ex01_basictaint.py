def main():
    user = input("Enter filename: ")
    full_path = user
    safe_cmd = "ls /etc"
    dangerous_cmd = full_path
    os.system(safe_cmd)
    os.system(dangerous_cmd)
