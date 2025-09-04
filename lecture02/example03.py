import os

def main():
    filename = input("Enter a filename to list: ")
    os.system(f"ls {filename}")

if __name__ == "__main__":
    main()
