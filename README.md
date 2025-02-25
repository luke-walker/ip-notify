# IP Notify
Send an email notification when your external IP changes.

## Requirements
```
python 3.12.8
```

## Installation
### Script (Linux)
```bash
sudo ./install.sh
```
Installs to ```/opt/ip-notify/```
### Manual (Linux)
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
```
Include preferred SMTP server, login credentials, and path to save directory in ```.env``` file.

## Usage
```bash
python main.py
```

## License
MIT License
