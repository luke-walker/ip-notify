import os

from dotenv import load_dotenv
import requests

def main():
    load_dotenv()

    def get_env(var: str, req: bool=True) -> str | None:
        val = os.getenv(var)
        if val is None and req:
            print(f"Missing required .env var: {var}")
            exit(1)
        return val

    EMAIL_SERVER = get_env("EMAIL_SERVER")
    EMAIL_PORT = get_env("EMAIL_PORT")
    EMAIL_ADDRESS = get_env("EMAIL_ADDRESS")
    EMAIL_PASSWORD = get_env("EMAIL_PASSWORD")

    # Fetch current external IP
    response = requests.get("https://api.ipify.org")
    if response.status_code != 200:
        print(f"Failed to fetch external IP (status code {response.status_code})")
        exit(1)
    curr_ip = response.text

    # Retrieve last IP and save current IP
    last_ip = ""
    with open("ip.txt", "w+") as f:
        last_ip = f.readline()
        f.seek(0)
        f.write(curr_ip)

    # Send email if different
    if last_ip != "" and last_ip != curr_ip:
        pass

if __name__ == "__main__":
    main()
