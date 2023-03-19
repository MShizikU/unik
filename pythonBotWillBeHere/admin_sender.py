import telebot
from mysql.connector import connect, Error

bot = telebot.TeleBot("2035258275:AAE8-VLoxdy57jCPVHm5E6TXCgEaaFgE8Nw")
admin_id=374743214
user_id=0
user_name=''
counter=0

bot.send_message(admin_id,'Список пользователей,которые получают рассылку на данный момент')
try:
        with connect(
            host="MrShiz.mysql.pythonanywhere-services.com",
            user="MrShiz",
            password="Work632004",
            database="MrShiz$USERS",
        ) as connection:
            show_db_query="SELECT id FROM user"
            with connection.cursor() as cursor:
                cursor.execute(show_db_query)
                result = cursor.fetchall()
                counter=len(result)

except Error as e:
        print(e)

for count in range(1,counter+1):
    user_id=0
    user_name=''
    try:
        with connect(
            host="MrShiz.mysql.pythonanywhere-services.com",
            user="MrShiz",
            password="Work632004",
            database="MrShiz$USERS",
        ) as connection:
            get_id_and_start_date="SELECT user_id, username FROM user"
            with connection.cursor() as cursor:
                cursor.execute(get_id_and_start_date)
                result = cursor.fetchall()
                for row in result[count-1]:
                    if user_id==0:
                        user_id=int(row)
                    else:
                        user_name=str(row)

    except Error as e:
        print(e)
    bot.send_message(admin_id, '#'+str(user_id) +'#'+"\n"+str(user_name))