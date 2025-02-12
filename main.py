import os

from dotenv import load_dotenv

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

    # Fetch external IPv4
    # ...

    # Compare fetched IP to stored IP
    # ...

    # Send email if different
    # ...

    # Store new IP
    # ...

if __name__ == "__main__":
    main()
