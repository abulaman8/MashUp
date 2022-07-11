import os
from flask import Blueprint, request, current_app, jsonify, make_response
import jwt
from functools import wraps
from .models import User
import datetime
from werkzeug.security import generate_password_hash, check_password_hash
from . import db

auth = Blueprint("auth", __name__)




static_path = 'C:\\Users\\5.413U14M4N\\Desktop\\python\\mashup\\mashup\\static\\'




def check_token(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('token')
        if token:
            try:
                data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
                
            except:
                return jsonify({'message': 'Invalid/Missing token'}), 401
        else:
            return jsonify({'message': 'Invalid/Missing token'}), 401
    return decorated



@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        data = request.json
        username = data['username']
        password = data['password']

        user = User.query.filter_by(username=username).first()
        if user:
            if check_password_hash(user.password, password):
                token = jwt.encode({'user': username, 'id':user.id,'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=24)}, current_app.config['SECRET_KEY'])
                return jsonify({'token': token}), 200

            else:
                return make_response({'message':'Incorrect Password.... :-('}, 401)
                
                
        else:
            return make_response({'message':'User name does not exist.... :-('}, 404)


@auth.route('/register', methods = ['GET', 'POST'])
def register():
    if request.method == 'POST':
        data = request.json
        username = data['username']
        email = data['email']
        password = data['password']
        


        if User.query.filter_by(username=username).first() or User.query.filter_by(email=email).first():
            return make_response({'message': 'Account with same email or username already exists'}, 401)
        new_user = User(username=username, email=email, password= generate_password_hash(password, method='sha256'))
        try:
            db.session.add(new_user)
            db.session.commit()
            return make_response({'message': 'Account created Succesfully'}, 200)
        except:
            return make_response({'message': 'Account Not Created'}, 401)