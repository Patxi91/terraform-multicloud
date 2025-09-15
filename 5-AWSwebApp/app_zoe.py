from flask import Flask, render_template_string, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = 'replace-with-a-secure-random-key'

PINK_HEALTH_STYLE = """
<style>
body { font-family: 'Segoe UI', Arial, sans-serif; background: #fff0f6; margin:0; padding:0; }
.header { background: #ff69b4; color: white; text-align: center; padding: 2rem 0 1rem 0; }
.nav { background: #ffe0ef; padding: 1rem 0; text-align: center; }
.nav a { text-decoration: none; color: #ff69b4; margin: 0 1.5rem; font-weight: 600; font-size: 1.1rem;}
.nav a.active, .nav a:hover { text-decoration: underline; }
.section { margin: 2rem auto; max-width: 700px; background: #fff; border-radius:10px; box-shadow:0 2px 8px #e7c5d8; padding: 2rem; }
h2 { color: #ff69b4; }
form label { display:block; margin:1rem 0 0.25rem 0; color:#aa3377;}
form input, form textarea {
    width:100%; padding:0.7rem; border:1px solid #ffc2d9; border-radius:7px; background:#fff5fa;
    font-size:1rem; color:#a03a63;
}
form button {
    margin-top:1rem; background: #ff69b4; color: #fff; border: none; padding: .65rem 2rem;
    border-radius:7px; font-size:1.1rem; font-weight:bold; cursor:pointer;
}
form button:hover { background: #f06292; }
.flash {background:#ffd9ea;color:#d7267c;border-radius:7px;padding:.7rem 1.2rem;text-align:center;}
.footer {text-align:center;color:#ff69b4;margin-top:3rem;padding:1rem 0;background:#fff0f6;}
</style>
"""

BASE_TEMPLATE = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{ title or "Wellness with Meme" }}</title>
    {{ style|safe }}
</head>
<body>
    <div class="header"><h1>Wellness with Meme</h1><p>Your healthy lifestyle inspiration ✨</p></div>
    <div class="nav">
        <a href="{{ url_for('home') }}" {% if section=='home' %}class="active"{% endif %}>Home</a>
        <a href="{{ url_for('about') }}" {% if section=='about' %}class="active"{% endif %}>About</a>
        <a href="{{ url_for('blog') }}" {% if section=='blog' %}class="active"{% endif %}>Blog</a>
        <a href="{{ url_for('contact') }}" {% if section=='contact' %}class="active"{% endif %}>Contact</a>
    </div>
    {% with messages = get_flashed_messages() %}
      {% if messages %}
        <div class="section"><div class="flash">{{ messages[0] }}</div></div>
      {% endif %}
    {% endwith %}
    <div class="section">
    {{ content|safe }}
    </div>
    <div class="footer">© 2025 Wellness with Meme &middot; <span style="color:#b6337a;font-size:1.2em;">♡</span></div>
</body>
</html>
'''

@app.route("/")
def home():
    content = """
    <h2>Welcome!</h2>
    <p>
      Hello and welcome to my pink-powered wellness hub! Here I share tips on nutrition, routines, positivity, healthy living and more.
    </p>
    <ul>
      <li><b>Healthy Recipes</b></li>
      <li><b>Self-care Routines</b></li>
      <li><b>Workouts & Challenges</b></li>
      <li><b>My Blog</b>: Weekly inspiration posts!</li>
    </ul>
    <p>Stay healthy, stay fabulous! 🌸</p>
    """
    return render_template_string(BASE_TEMPLATE, title="Home | Wellness with Meme", section="home",
                                  style=PINK_HEALTH_STYLE, content=content)

@app.route("/about")
def about():
    bunny_gif = "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExc3B0eW9iaWF0eGtpbWluY3NpdWhtZTJxbDB1ejY5dnJnZWJmNzJ5MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l2Sq2YYdLXLZnEtQA/giphy.gif"
    content = f"""
    <h2>About Meme</h2>
    <img src="{bunny_gif}"
         style="float:right;border-radius:10px;margin:0 0 1rem 2rem;width:150px;height:150px;object-fit:cover;">
    <p>
      Hi! I'm Meme 🐰, a certified wellness coach, foodie, and your daily dose of pink energy! I believe health is joyful, achievable and fun.
    </p>
    <p>
      My mission is to empower you with evidence-based wellness strategies, motivational stories, and a strong community. 
      <br>Let’s chase our healthiest, happiest selves together 🌷
    </p>
    <div style="clear:both;"></div>
    """
    return render_template_string(BASE_TEMPLATE, title="About | Wellness with Meme", section="about",
                                  style=PINK_HEALTH_STYLE, content=content)

@app.route("/blog")
def blog():
    content = """
    <h2>Blog</h2>
    <ul>
      <li><b>[Apr 2025]</b> <b>Morning Rituals for Lasting Energy</b> – Discover the 3 habits that changed my mornings.</li>
      <li><b>[Mar 2025]</b> <b>Packing Pink into Your Salad</b> – How to make healthy eating beautiful & delicious.</li>
      <li><b>[Feb 2025]</b> <b>How I Stay Motivated On Gloomy Days</b> – Mindset tips that work.</li>
    </ul>
    <p><em>Want more? Message me about future blog topics!</em></p>
    """
    return render_template_string(BASE_TEMPLATE, title="Blog | Wellness with Meme", section="blog",
                                  style=PINK_HEALTH_STYLE, content=content)

@app.route("/contact", methods=["GET", "POST"])
def contact():
    if request.method == "POST":
        name = request.form.get("name", "").strip()
        email = request.form.get("email", "").strip()
        message = request.form.get("message", "").strip()
        if not name or not email or not message:
            flash("All fields are required. Please fill out the form.")
            return redirect(url_for("contact"))
        # Normally, you’d email or log the message here.
        flash("Thank you for reaching out, Meme will get back to you soon! 💖")
        return redirect(url_for("contact"))

    content = """
    <h2>Contact Meme</h2>
    <form method="post" action="{{ url_for('contact') }}">
      <label for="name">Your Name*</label>
      <input type="text" name="name" id="name" required>
      <label for="email">Your Email*</label>
      <input type="email" name="email" id="email" required>
      <label for="message">Message*</label>
      <textarea name="message" id="message" rows="5" required></textarea>
      <button type="submit">Send Message</button>
    </form>
    <p style="font-size:.98em;color:#af357f;">* All fields are required</p>
    """
    return render_template_string(BASE_TEMPLATE, title="Contact | Wellness with Meme", section="contact",
                                  style=PINK_HEALTH_STYLE, content=content)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)