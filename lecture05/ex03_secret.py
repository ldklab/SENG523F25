import requests

API_SECRET = "sk_live_1234567890"   # hardcoded secret (bad practice)

def get_data(endpoint):
    url = f"https://api.example.com/{endpoint}"
    headers = {
        "Authorization": f"Bearer {API_SECRET}"  # secret embedded in header
    }
    response = requests.get(url, headers=headers)
    return response.json()