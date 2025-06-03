from flask import Flask, request
import requests

app = Flask(__name__)

def get_location(ip):
    try:
        response = requests.get(f"https://ipapi.co/{ip}/json/")
        data = response.json()
        city = data.get("city", "Unknown city")
        country = data.get("country_name", "Unknown country")
        return f"{city}, {country}"
    except Exception:
        return "Unknown location"

@app.route("/")
def landing():
    gif_url = "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHVjcXdxcjRndmp6Y2c5MGl4dm45NDJ2cDdmeXNna2w3M25xbHJoNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/QS0KOjNRG0tfG/giphy.gif"
    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>The Matrix Awaits</title>
        <style>
            body {{
                font-family: monospace;
                text-align: center;
                background-color: #000;
                color: #0f0;
                margin-top: 50px;
            }}
            img {{
                max-width: 80%;
                height: auto;
                margin-top: 30px;
                border: 2px solid #0f0;
            }}
        </style>
    </head>
    <body>
        <h1>Welcome to the Matrix.</h1>
        <p>If you know the code, you may enter.</p>
        <img src="{gif_url}" alt="Matrix GIF">
    </body>
    </html>
    """
    return html_content

@app.route("/meme")
def meme():
    gif_url = "https://media1.giphy.com/media/h6kmhiU4z5LkIV7HiQ/giphy.gif"
    ip = request.remote_addr
    location = get_location(ip)
    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Terraform Flask App</title>
        <style>
            body {{
                font-family: sans-serif;
                text-align: center;
                margin-top: 50px;
            }}
            img {{
                max-width: 100%;
                height: auto;
                margin-top: 20px;
            }}
            .info {{
                margin-top: 30px;
                color: #555;
                font-size: 0.9em;
            }}
        </style>
    </head>
    <body>
        <h1>Hello, Meme!</h1>
        <img src="{gif_url}" alt="Asamimi-chan Sticker GIF">
        <div class="info">
            <p>Your IP: {ip}</p>
            <p>Location: {location}</p>
        </div>
    </body>
    </html>
    """
    return html_content

@app.route("/oscar")
def oscar():
    gif_url = "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExdDA5NmlreHBqZTV4a2IyMHJ6b250MHJyaDZ4azRpbTRvbDR2NDB6cCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/599I8Qbr533P2/giphy.gif"
    ip = request.remote_addr
    location = get_location(ip)
    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hola, Óscar!</title>
        <style>
            body {{
                font-family: sans-serif;
                text-align: center;
                margin-top: 50px;
            }}
            img {{
                max-width: 100%;
                height: auto;
                margin-top: 20px;
            }}
            .info {{
                margin-top: 30px;
                color: #555;
                font-size: 0.9em;
            }}
        </style>
    </head>
    <body>
        <h1>Hello, Óscar!</h1>
        <img src="{gif_url}" alt="Oscar GIF">
        <div class="info">
            <p>Your IP: {ip}</p>
            <p>Location: {location}</p>
        </div>
    </body>
    </html>
    """
    return html_content

@app.route("/javi")
def javi():
    gif_url = "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYnB5Njl6cW1kbGF0YTE5MXE2N2R6ejBrMDFidWZubXpnc2ljdWdmNyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/h2GpJK6ljDJJnLDWUA/giphy.gif"
    ip = request.remote_addr
    location = get_location(ip)
    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hello, Javi!</title>
        <style>
            body {{
                font-family: sans-serif;
                text-align: center;
                margin-top: 50px;
            }}
            img {{
                max-width: 100%;
                height: auto;
                margin-top: 20px;
            }}
            .info {{
                margin-top: 30px;
                color: #555;
                font-size: 0.9em;
            }}
        </style>
    </head>
    <body>
        <h1>Hello, Javi!</h1>
        <img src="{gif_url}" alt="Javi GIF">
        <div class="info">
            <p>Your IP: {ip}</p>
            <p>Location: {location}</p>
        </div>
    </body>
    </html>
    """
    return html_content

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
