import telebot
from mysql.connector import connect, Error

bot = telebot.TeleBot("5981846313:AAGwnJo06O5rhW0NbM6LoPvuJvNjFdWS7DI")
admin_id=374743214
user_id=0
user_name=''
counter=0

mhost="109.68.213.82"
muser="gen_user"
mpasswd="Work632004"
mdb="default_db"
mport = 3306

bot.send_message(admin_id,'Список пользователей,которые получают рассылку на данный момент')
try:
        with connect(
            host=mhost,
            user=muser,
            passwd=mpasswd,
            db=mdb,
            port=mport
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
    date_of_start = ''
    try:
        with connect(
            host=mhost,
            user=muser,
            passwd=mpasswd,
            db=mdb,
            port=mport
        ) as connection:
            get_id_and_start_date="SELECT user_id, username,date_of_start FROM user"
            with connection.cursor() as cursor:
                cursor.execute(get_id_and_start_date)
                result = cursor.fetchall()
                for row in result[count-1]:
                    if user_id==0:
                        user_id=int(row)
                    else if user_name == '':
                        user_name=str(row)
                    else:
                        date_of_start = str(row)

    except Error as e:
        print(e)
    bot.send_message(admin_id, 'ID: '+str(user_id) + "\n" +'Name: '+str(user_name) + "\n" + "Date: " + str(date_of_start))