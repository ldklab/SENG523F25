import os

def list_files():
    filename = input("Enter filename: ")
    os.system(f"ls {filename}")
