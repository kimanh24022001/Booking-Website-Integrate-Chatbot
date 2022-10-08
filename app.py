from email import message
import os
import random
from flask import Flask, render_template, request, redirect, url_for,session,flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import numpy as np
import pickle
import json
from flask_ngrok import run_with_ngrok
import nltk
from keras.models import load_model
from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()
nltk.download('punkt')
nltk.download('wordnet')
nltk.download('omw-1.4')
# chat initialization
model = load_model("chatbot_model.h5")
intents = json.loads(open("intents.json").read())
words = pickle.load(open("words.pkl", "rb"))
classes = pickle.load(open("classes.pkl", "rb"))

app = Flask(__name__)

db = SQLAlchemy()
app.config["SQLALCHEMY_DATABASE_URI"] =  "postgresql://wnxgwnqsndjjkf:c5aedb553e95563cfe2bd7dab46e4607e0d99947f62f39b3189cdd2c2563ea68@ec2-3-219-19-205.compute-1.amazonaws.com:5432/d52nkfph56vp7n"
app.config['SECRET_KEY'] = "random string"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db.init_app(app)
class Admin(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(100), nullable=False)
class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    country = db.Column(db.String(100), nullable=False)
    subject = db.Column(db.String(500), nullable=False)
class Accpted(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    country = db.Column(db.String(100), nullable=False)
    type_of_room = db.Column(db.String(100), nullable=False)
    bedding = db.Column(db.String(100), nullable=False)
    number_of_room = db.Column(db.String(100), nullable=False)
    check_in = db.Column(db.String(100), nullable=False)
    check_out = db.Column(db.String(100), nullable=False)
class Booking(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False) 
    first_name = db.Column(db.String(100), nullable=False)
    last_name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    nationality = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(100), nullable=False)
    type_of_room = db.Column(db.String(100), nullable=False)
    bedding_type = db.Column(db.String(100), nullable=False)
    number_of_rooms = db.Column(db.String(100), nullable=False)
    check_in = db.Column(db.String(100), nullable=False)
    check_out = db.Column(db.String(100), nullable=False)
class Reject(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    country = db.Column(db.String(100), nullable=False)
    type_of_room = db.Column(db.String(100), nullable=False)
    bedding = db.Column(db.String(100), nullable=False)
    number_of_room = db.Column(db.String(100), nullable=False)
    check_in = db.Column(db.String(100), nullable=False)
    check_out = db.Column(db.String(100), nullable=False)
class Checkout(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    address = db.Column(db.String(100), nullable=False)
    city = db.Column(db.String(100), nullable=False)
    state = db.Column(db.String(100), nullable=False)
    zip = db.Column(db.Integer, primary_key=True)
    nameoncard = db.Column(db.String(100), nullable=False)
    creditcard = db.Column(db.String(100), nullable=False)
  
@app.route("/",)
def admin_login():

    return render_template ("index.html",status='SIGN IN')
@app.route("/admin",)
def admin():
    
    return render_template ("admin.html")
@app.route("/record_contact",)
def record_contact():
    record = Contact.query.all()
    return render_template ("contact.html",record=record)
@app.route("/record",)
def record():
    record = Booking.query.all()
    rejected = Reject.query.all()
    checkout = Checkout.query.all()
    return render_template ("record.html",record=record,rejected=rejected,checkout=checkout)
@app.route("/success",)
def success():

    return render_template ("index.html",status='SIGN OUT',history='HISTORY')

@app.route("/contact" , methods = ['GET','POST'])
def contact():
    if request.method == 'POST': 
        name  =  request.form.get('name')
        country = request.form.get('country')
        email =  request.form.get('email')
        subject =  request.form.get('subject')
        id_rand = random.randint(1, 100)
        while True:
          std = Contact.query.filter_by(id=id_rand).first()
          if std:
            continue
          else:
            break 
        c = Contact(id=id_rand,name=name , country = country , email = email, subject=subject)
        db.session.add(c)
        db.session.commit()
        flash("Contact  has been send successfully")  
        return render_template("contact.html")
    else:
        record = Contact.query.all()
        return render_template("contact.html",record=record)
    
@app.route("/history")
def history():
    if session.get('username'):
        record = Booking.query.all()
        flash("Accpted successfully" )
        # flash("Rejected successfully" )
        return render_template("history.html",record=record)
    else:
        return render_template("index.html")
@app.route("/login",methods=['POST','GET'])
def login():
    msg = "Login first"
    if request.method == "POST":
        
        username = request.form.get("username")
        password = request.form.get("password")
       
        std = Admin.query.filter_by(name=username, password=password).first()
        if std:
            if username == 'admin' and password == 'admin':
                return redirect("/admin")
            else:
                session['username'] = username
                return render_template("index.html",status='SIGN OUT',history='HISTORY')
        else:
            flash("Incorrect password or user name")  
            return render_template("login.html", msg=msg)
    else:

        return render_template("login.html", msg=msg)

@app.route("/signup",methods=['POST','GET'])
def signup():
    if request.method == "POST":       
        username = request.form.get("username")
        password = request.form.get("psw")
        password_re = request.form.get("psw-repeat")
        email = request.form.get("email")
        phone = request.form.get("phone")
        if password==password_re:
            id_rand = random.randint(1, 100)
            while True:
                std = Admin.query.filter_by(id=id_rand).first()
                if std:
                    continue
                else:
                    break 
            entry = Admin(id=id_rand, name=username,password=password)
            db.session.add(entry)
            db.session.commit()
            return render_template("signup.html",message="You have successfully registered!")
        else:
            return render_template("signup.html",message="You have to enter 2 times password")
    else:
        return render_template("signup.html",message="Please fill in this form to create an account.")

@app.route("/booking", methods = ['GET','POST'])
def booking():
    if  request.method == 'POST' :
        #nbr = request.form.get('numberofroom')
        title = request.form.get('title')
        first_name = request.form.get('fname')
        last_name = request.form.get('lname')
        email = request.form.get('email')
        nationality = request.form.get('nation')
        phone = request.form.get('phone')
        type_of_room = request.form.get('troom')
        bedding_type = request.form.get('bed')
        number_of_rooms = request.form.get('nroom')
        check_in = request.form.get('cin')
        check_out = request.form.get('cout')
        id_rand = random.randint(1, 100)
        while True:
          std = Booking.query.filter_by(id=id_rand).first()
          if std:
            continue
          else:
            break    
        entry = Booking(id=id_rand,title=title, first_name = first_name , last_name= last_name,email=email , nationality=nationality , phone= phone , type_of_room = type_of_room, bedding_type = bedding_type, number_of_rooms = number_of_rooms , check_in = check_in,check_out = check_out )
        db.session.add(entry)
        db.session.commit()
        flash("Room Book request has been send successfully")
        if session.get('username'):
           return render_template ("pay.html")
        else:
          return render_template ("pay.html")
    return render_template ("booking.html")
@app.route("/Accept/<int:id>")
def accept(id):

    d = Booking.query.get(id)
    apt = Booking.query.filter_by(id = id).first()
    add = Accpted(name=apt.first_name , email= apt.email , country=apt.nationality,type_of_room=apt.type_of_room,bedding=apt.Bedding_Type,number_of_room=apt.Number_of_rooms,check_in=apt.check_in,check_out=apt.check_out)
    db.session.add(add)
    db.session.delete(d)
    db.session.commit()
    return redirect("/")

@app.route("/reject/<int:id>")
def reject(id):
    d = Booking.query.get(id)
    apt = Booking.query.filter_by(id = id).first()
    add = Reject(name=apt.first_name , email= apt.email , country=apt.nationality,type_of_room=apt.type_of_room,bedding=apt.Bedding_Type,number_of_room=apt.Number_of_rooms,check_in=apt.check_in,check_out=apt.check_out)
    db.session.add(add)
    db.session.delete(d)
    db.session.commit()
    return redirect("/history") 

@app.route("/Delete/<int:id>")
def delete_accept(id):
    d = Booking.query.get(id)
    db.session.delete(d)
    db.session.commit()
    return redirect("/record")

@app.route("/reject_delete/<int:id>")
def delete_reject(id):
    d = Reject.query.get(id)
    db.session.delete(d)    
    db.session.commit()
    return redirect("/record")

@app.route("/checkout_delete/<int:id>")
def delete_checkout(id):
    d = Checkout.query.get(id)
    db.session.delete(d)    
    db.session.commit()
    return redirect("/record")

app.route("/chatbot")
def home():
    return render_template("chatbot.html")


@app.route("/get", methods=["POST"])
def chatbot_response():
    msg = request.form["msg"]
    if msg.startswith('my name is'):
        name = msg[11:]
        ints = predict_class(msg, model)
        res1 = getResponse(ints, intents)
        res =res1.replace("{n}",name)
    elif msg.startswith('hi my name is'):
        name = msg[14:]
        ints = predict_class(msg, model)
        res1 = getResponse(ints, intents)
        res =res1.replace("{n}",name)
    else:
        ints = predict_class(msg, model)
        res = getResponse(ints, intents)
    return res


# chat functionalities
def clean_up_sentence(sentence):
    sentence_words = nltk.word_tokenize(sentence)
    sentence_words = [lemmatizer.lemmatize(word.lower()) for word in sentence_words]
    return sentence_words


# return bag of words array: 0 or 1 for each word in the bag that exists in the sentence
def bow(sentence, words, show_details=True):
    # tokenize the pattern
    sentence_words = clean_up_sentence(sentence)
    # bag of words - matrix of N words, vocabulary matrix
    bag = [0] * len(words)
    for s in sentence_words:
        for i, w in enumerate(words):
            if w == s:
                # assign 1 if current word is in the vocabulary position
                bag[i] = 1
                if show_details:
                    print("found in bag: %s" % w)
    return np.array(bag)


def predict_class(sentence, model):
    # filter out predictions below a threshold
    p = bow(sentence, words, show_details=False)
    res = model.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
    # sort by strength of probability
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        return_list.append({"intent": classes[r[0]], "probability": str(r[1])})
    return return_list


def getResponse(ints, intents_json):
    tag = ints[0]["intent"]
    list_of_intents = intents_json["intents"]
    for i in list_of_intents:
        if i["tag"] == tag:
            result = random.choice(i["responses"])
            break
    return result


if __name__ == "__main__":
     app.run(debug = True)