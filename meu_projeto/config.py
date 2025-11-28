import os
from dotenv import load_dotenv


load_dotenv()


SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/code_quest'
SQLALCHEMY_TRACK_MODIFICATIONS = False

# Configurações para envio de email via Gmail
MAIL_SERVER = 'smtp.gmail.com'
MAIL_PORT = 587
MAIL_USE_TLS = True
MAIL_USERNAME = 'fesouza18032005@gmail.com'
MAIL_PASSWORD = 'cijxcxldintygtxt'  # Cole a senha de app SEM ESPAÇOS

MAIL_DEFAULT_SENDER = ('TCC', 'fesouza18032005@gmail.com') 