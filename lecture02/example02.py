import sqlite3

def main():  
    conn = sqlite3.connect(":memory:")
    c = conn.cursor()
    c.execute("CREATE TABLE users (id INTEGER, name TEXT)")
    c.execute("INSERT INTO users VALUES (1, 'Alice'), (2, 'Bob')")

    user_input = input("Enter a user id to look up: ")
    query = f"SELECT * FROM users WHERE id = {user_input};"
    print("Running:", query)
    for row in c.execute(query):
        print(row)

if __name__ == "__main__":
    main()
