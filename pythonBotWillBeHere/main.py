from mysql.connector import connect, Error
import telebot
import datetime
import time
bot = telebot.TeleBot("5981846313:AAGwnJo06O5rhW0NbM6LoPvuJvNjFdWS7DI")
user_id=1
date_of_start=0

admin_id=374743214

mhost="109.68.213.82"
muser="gen_user"
mpasswd="Work632004"
mdb="default_db"
mport = 3306

@bot.message_handler(commands=['start'])
def start_every_day_message(message):
    user_id = message.from_user.id
    date_of_start = datetime.date.today()
    checker=0
    try:
        with connect(
            host = mhost,
            user = muser,
            passwd = mpasswd,
            db = mdb,
            port = mport
        ) as connection:
            find_in_db_if_exist = "SELECT id FROM user WHERE user_id="+str(user_id)
            with connection.cursor() as cursor:
                with connection.cursor() as cursor:
                    cursor.execute(find_in_db_if_exist)
                    result = cursor.fetchall()
                if len(result)!=0:
                    checker=0
                else:
                    checker=1
        if checker==0:
            bot.send_message(user_id,'Вы уже подписаны на рассылку, если хотите начать заново, введите команду /stop, а затем заново введите /start')
            print(result)
        else:
            bot.send_message(user_id, 'Здравствуйте, Вы подписались на рассылку о туберкулезе, его лечении и жизни с ним. \nhttps://telegra.ph/Znakomstvo-02-27-6')
            
            try:
                with connect(
                    host=mhost,
                    user=muser,
                    passwd=mpasswd,
                    db=mdb,
                    port=mport
                ) as connection:
                    show_row_query = "INSERT INTO user (user_id,date_of_start,username) VALUES('"+str(user_id)+"', '"+str(date_of_start)+"','"+str(message.from_user.first_name)+" "+str(message.from_user.last_name)+"')"
                    with connection.cursor() as cursor:
                        cursor.execute(show_row_query)
                        connection.commit()

            except Error as e:
                print(e)
    except Error as e:
                print(e)

@bot.message_handler(commands=['stop'])
def stop_every_day_message(message):
    user_id = message.from_user.id
    date_of_start = int(datetime.date.today().day)
    checker=0
    try:
        with connect(
            host = mhost,
            user = muser,
            passwd = mpasswd,
            db = mdb,
            port = mport
        ) as connection:
            find_in_db_if_exist = "SELECT id FROM user WHERE user_id="+str(user_id)
            with connection.cursor() as cursor:
                with connection.cursor() as cursor:
                    cursor.execute(find_in_db_if_exist)
                    result = cursor.fetchall()
                if len(result):
                    checker=0
                else:
                    checker=1
    except Error as e:
            print(e)
    if checker==0:
        bot.send_message(user_id, "Вы остановили ежедневную рассылку, что бы возобновить получение каждодневных сообщений, пожалуйста введите /start")
        print(date_of_start, user_id)
        date_of_start = 0
        try:
            with connect(
                host=mhost,
                user=muser,
                passwd=mpasswd,
                db=mdb,
                port=mport
            ) as connection:
                delete_row_query = "DELETE FROM user WHERE user_id =" +str(message.from_user.id)
                with connection.cursor() as cursor:
                    cursor.execute(delete_row_query)
                    connection.commit()

        except Error as e:
            print(e)
    else:
        bot.send_message(user_id,"Вы еще не начали получать ежедневную рассылку, если Вы хотите получать от нас ежедневные сообщения введите /start")


@bot.message_handler(func =lambda message :True, content_types=['text'])
def admin_message(message):
    if (message.from_user.id!=admin_id):
        bot.send_message(admin_id,'#'+str(message.from_user.id) +'#'+'\n'+str(message.from_user.first_name)+' '+str(message.from_user.last_name)+'\n'+message.text)
    if (message.from_user.id==admin_id):
        to_user_id=int(message.reply_to_message.text[1:10])
        bot.send_message(to_user_id,message.text)


while True:
    try:
        bot.polling(none_stop=True, interval=0, timeout=20)
    except Exception as E:
        time.sleep(1)
