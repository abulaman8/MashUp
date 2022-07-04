
from . import db
from sqlalchemy.sql import func


post_tag_rel = db.Table('post_tag_rel', 
    db.Column('post', db.Integer, db.ForeignKey('post.id')),
    db.Column('tag', db.Integer, db.ForeignKey('tag.id'))
    )

user_user_rel = db.Table('user_user_rel',
    db.Column('user', db.Integer, db.ForeignKey('user.id')),
    db.Column('user', db.Integer, db.ForeignKey('user.id'))
)

user_like_rel=db.Table('user_like_rel',
    db.Column('post', db.Integer, db.ForeignKey('post.id')),
    db.Column('user', db.Integer, db.ForeignKey('user.id'))
    )



user_comment_like_rel = db.Table(
    'user_comment_like_rel',
    db.Column('user', db.Integer, db.ForeignKey('user.id')),
    db.Column('comment', db.Integer, db.ForeignKey('comment.id'))
)

class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key = True)
    email = db.Column(db.String(60), unique=True, nullable = False)
    username = db.Column(db.String(30), unique=True, nullable = False)
    password = db.Column(db.String(300), nullable=False)
    dp = db.Column(db.String(100), unique=True, default='default_dp.png')
    following = db.relationship('User', secondary=user_user_rel, backref='followers')
    post_rel = db.relationship('Post', cascade='all, delete-orphan', backref='user')
    liked = db.relationship('Post', secondary=user_like_rel, backref='likers')
    comment_rel = db.relationship('Comment', cascade='all, delete-orphan', backref='user')
    commented = db.relationship('Comment', secondary=user_comment_like_rel, backref='liked_by')


class Post(db.Model):
    __tablename__ = 'post'
    id = db.Column(db.Integer, primary_key = True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    filename = db.Column(db.String(100), unique=True, nullable=False)
    thumbnail = db.Column(db.String(100), unique=True, nullable=False)
    caption = db.Column(db.String(200))
    veiws = db.Column(db.Integer, default=0)
    date_created = db.Column(db.DateTime(timezone=True), default=func.now())
    tags = db.relationship('Tag', secondary=post_tag_rel, backref='posts')
    comment_rel = db.relationship('Comment', cascade='all, delete-orphan', backref='post')
    


class Comment(db.Model):
    __tablename__ = 'comment'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.String, db.ForeignKey('user.id'))
    comment_text = db.Column(db.String(280))
    post_id = db.Column(db.Integer, db.ForeignKey('post.id'))



class Tag(db.Model):
    __tablename__ = 'tag'
    id = db.Column(db.Integer, primary_key=True)
    tag_text = db.Column(db.String(100))

    def __repr__(self) -> str:
        return f'<tag: {self.tag_text}>'
    