from flask import Blueprint, request, make_response, current_app, send_file
from .models import Post, Tag, User, Comment
from . import db
import os
from .auth import check_token
import jwt
import random
from zipfile import ZipFile
from PIL import Image


views = Blueprint("views", __name__)

static_path = 'C:\\Users\\5.413U14M4N\\Desktop\\python\\mashup\\mashup\\static\\'

def random_post():
    posts = list(Post.query.all())
    return random.choice(posts)



@check_token
@views.route('/post')
def post():

    token = request.headers.get('token')
    data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
    
    user_id = data['id']

    if request.files:
        v = request.files['video']
        t=request.files['thumbnail']
        name, ext = v.filename.split('.')
        
        new_post = Post(filename=v.filename, caption=caption, user_id=user_id)
        new_tags=[]
        data = request.json
        caption = data['caption']
        tags = data['tags'].split(',')
        try:
            db.session.add(new_post)
            db.session.commit()
            v.save((os.path.join(static_path,v.filename)))
            t.save((os.path.join(static_path,t.filename)))
            img = Image.open((os.path.join(static_path,t.filename)))
            img.save((os.path.join(static_path,f'{name}.png')))
            os.remove((os.path.join(static_path,t.filename)))
        except:
            return make_response({
                'message':'unable to post'
            },401)
        post = Post.query.filter_by(filename = v.filename).first()
        saved_tags = Tag.query.all()
        for tag in saved_tags:
            if tag.tag_text in tags:
                post.tags.append(tag)
                tags.remove(tag.tag_text)
        for tag in tags:
            new_tag = Tag(tag_text = tag)
            new_tags.append(new_tag)
        try:
            db.session.add_all(new_tags)
            db.session.commit()
        except:
            return make_response({
                'message':'unable to post'
            },401)
        for tag in tags:
            if Tag.query.filter_by(tag_text=tag).first():
                post.tags.append(Tag.query.filter_by(tag_text=tag).first())
        try:
            db.session.commit()
        except:
            return make_response({
                'message':'unable to post'
            },401)    

        return 'file saved'
    else:
        return 'file not recieved'


@views.route('/get-post', methods=['GET'])
def get_post():
    post = random_post()
    comments = len(Comment.query.filter_by(post_id=post.id).all())
    return make_response({
        'id':post.id,
        'user_id':post.user_id,
        'file_name':post.filename,
        'caption':post.caption,
        'likes':len(post.likers),
        'dislikes':len(post.dislikers),
        'tags':[tag.tag_text for tag in post.tags],
        'comments': comments,
        'thumbnail':post.thumbnail
    },200)

@views.route('/get-post-file/<string:filename>', methods=['GET'])
def get_post_files(filename):
    name, ext = filename.split('.')
    file_path = (os.path.join(static_path, name))
    with ZipFile(f'{file_path}.zip', 'w') as zip:
        zip.write(f'{file_path}.{ext}')
        zip.write(f'{file_path}.png')
    return send_file(f'{file_path}.zip')



@check_token
@views.route('/delete-post/<int:post_id>', methods=['POST'])
def delete_post(post_id):
    token = request.headers.get('token')
    data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
    
    user_id = data['id']
    post = Post.query.filter_by(id=post_id).first()
    if post and post.user_id == user_id:
        filename = post.filename
        name, ext = filename.split('.')
        try:
            db.session.delete(post)
            db.session.commit()
            os.remove((os.path.join(static_path,filename)))
            os.remove((os.path.join(static_path,f'{name}.png')))
        except:
            return make_response({
                'message':'unbable to delete post'
                }, 401)
        return make_response({
            'message':'post deleted successfully'
        },200)
    else:
        return make_response({
            'message':'unauthorised access!'
        },401)

@views.route('/profile/<string:username>')
def profile(username):
    
    user = User.query.filter_by(username=username).first()
    if user:
        posts = Post.query.filter_by(user_id=user.id)
        liked=user.liked
        return make_response(
            {
                'email': user.email,
                'username': user.username,
                'following': [
                    len(user.following), [[u.id, u.username] for u in user.following]
                    ],
                'followers': [
                    len(user.followers), [[u.id, u.username] for u in user.followers]
                    ],
                'posts':[
                    [post.id, post.filename] for post in posts
                ]
            }
        )



@check_token
@views.route('/like/<int:post_id>' , methods=['POST'])
def like(post_id):
    token = request.headers.get('token')
    data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
    
    user_id = data['id']
    post=Post.query.filter_by(id=post_id).first()
    if post:
        user = User.query.filter_by(id=user_id).first()
        user.liked.append(post)
        try:
            db.session.commit()
        except:
            return make_response({
                'message': 'couldn\'t like...'
            }, 401)
        return make_response({
            'message':'like succesful'
        }, 201)  
    else:
        return make_response({
            'message':'post doesn\'t exist'
        }, 404)


@check_token
@views.route('/remove-like/<int:post_id>' , methods=['POST'])
def dislike(post_id):
    token = request.headers.get('token')
    data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
    
    user_id = data['id']
    post=Post.query.filter_by(id=post_id).first()
    if post:
        user = User.query.filter_by(id=user_id).first()
        if post in user.liked:
            user.liked.remove(post)
        else:
            return make_response({
                'message':'not liked in the first place'
            },402)
        try:
            db.session.commit()
        except:
            return make_response({
                'message': 'couldn\'t dislike...'
            }, 401)
        return make_response({
            'message':'dislike succesful'
        }, 201)  
    else:
        return make_response({
            'message':'post doesn\'t exist'
        }, 404)


@check_token
@views.route('/post-comment/<int:post_id>', methods=['POST'])
def post_comment(post_id):
    token = request.headers.get('token')
    data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
    
    user_id = data['id']
    body = request.json
    post = Post.query.filter_by(id=post_id).first()
    if post:
        new_comment = Comment(user_id=user_id, post_id=post_id, comment_text=body['comment'])
        try:
            db.session.add(new_comment)
            db.session.commit()
        except:
            return make_response({
                'message': 'couldn\'t comment...'
            }, 401)
        return make_response({
            'message':'comment succesful'
        }, 201)
    else:
        return make_response({
            'message':'post doesn\'t exist'
        }, 404)


@check_token
@views.route('/like-comment/<int:comment_id>', methods=['POST'])
def like_comment(comment_id):
    token = request.headers.get('token')
    data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
    
    user_id = data['id']
    user = User.query.filter_by(id=user_id).first()
    comment = Comment.query.filter_by(id=comment_id).first()
    if comment:
        user.commented.append(comment)
        try:
            db.session.commit()
        except:
            return make_response({
                'message': 'couldn\'t like...'
            }, 401)
        return make_response({
            'message':'like succesful'
        }, 201)  
    else:
        return make_response({
            'message':'comment doesn\'t exist'
        }, 404)
        
    

@check_token
@views.route('/delete-comment/<int:comment_id>', methods=['POST'])
def delete_comment(comment_id):
    token = request.headers.get('token')
    data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])
    
    user_id = data['id']
    user = User.query.filter_by(id=user_id).first()
    
    comment = Comment.query.filter_by(id=comment_id).first()
    if comment:
        post = Post.query.filter_by(id=comment.post_id).first()

        if comment.user_id == user_id or post.user_id == user_id:
            
            try:
                db.session.delete(comment)
                db.session.commit()
            except:
                return make_response({
                    'message':'unbable to delete comment'
                    }, 401)
            return make_response({
                'message':'comment deleted successfully'
            },200)
        else:
            return make_response({
                'message':'unauthorised access!'
            },401)
    else:
        return make_response({
                'message':'unauthorised access!'
            },401)
        

