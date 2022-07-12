from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from os import path
from flask_migrate import Migrate
from flask_cors import CORS


db = SQLAlchemy()
migrate = Migrate()

    




DB_NAME = "mashup"

def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'abulaman'
    app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://postgres:password@localhost:5432/{DB_NAME}'
   
    

    db.init_app(app)
    migrate.init_app(app, db)
    CORS(app)



    from .views import views
    from .auth import auth

    from .models import User, Post, Tag, Comment

    app.register_blueprint(views, url_prefix="/")
    app.register_blueprint(auth, url_prefix="/auth")

    

    create_db(app)

    


    return  app

def create_db(app):
    db.create_all(app=app)
    



