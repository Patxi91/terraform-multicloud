from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    # Direct URL of the Asamimi-chan GIF sticker
    gif_url = "https://media1.giphy.com/media/h6kmhiU4z5LkIV7HiQ/giphy.gif"

    # HTML content including your specific message and the GIF below it
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
        </style>
    </head>
    <body>
        <h1>Hello, Meme!</h1>
        <img src="{gif_url}" alt="Asamimi-chan Sticker GIF">
    </body>
    </html>
    """
    return html_content

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
