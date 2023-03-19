from datetime import datetime
import telebot
from mysql.connector import connect, Error
this_day = int(datetime.today().day)
current_diferience = 0
date_of_start=0
user_id=0
counter=0

bot = telebot.TeleBot("")
admin_id=374743214

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
    date_of_start=0
    try:
        with connect(
            host="MrShiz.mysql.pythonanywhere-services.com",
            user="MrShiz",
            password="Work632004",
            database="MrShiz$USERS",
        ) as connection:
            get_id_and_start_date="SELECT user_id, date_of_start FROM user"
            with connection.cursor() as cursor:
                cursor.execute(get_id_and_start_date)
                result = cursor.fetchall()
                for row in result[count-1]:
                    if user_id==0:
                        user_id=int(row)
                    else:
                        date_of_start=int(row)

    except Error as e:
        print(e)
    if this_day - date_of_start < 0:
        if (int(datetime.today().month) - 1) == 0 or (int(datetime.today().month) - 1) == 1 or (
                int(datetime.today().month) - 1) == 3 or (int(datetime.today().month) - 1) == 5 or (
                int(datetime.today().month) - 1) == 7 or (int(datetime.today().month) - 1) == 8 or (
                int(datetime.today().month) - 1) == 10:
            current_diferience = this_day - date_of_start + 31
        elif (int(datetime.today().month) - 1) == 2 and (int(datetime.today().year) % 4 == 0):
            current_diferience = this_day - date_of_start + 29
        elif (int(datetime.today().month) - 1) == 2 and (int(datetime.today().year) % 4 != 0):
            current_diferience = this_day - date_of_start + 28
        else:
            current_diferience = this_day - date_of_start + 30
    else:
        current_diferience = this_day - date_of_start
    if (current_diferience <= 24) and (current_diferience>0):
        print(current_diferience)
        if (current_diferience == 1):
            bot.send_message(user_id, 'https://telegra.ph/Den-1-CHto-takoe-tuberkulez-10-10')
            bot.send_photo(user_id, photo=open('/home/MrShiz/day_1.jpg','rb'))
        elif (current_diferience == 2):
            bot.send_message(user_id, 'https://telegra.ph/Den-2-Kak-peredaetsya-tuberkulez-10-10')
        elif (current_diferience == 3):
            bot.send_message(user_id, 'https://telegra.ph/Kak-stavitsya-diagnoz-Tuberkulez-10-10')
            bot.send_message(user_id,'https://youtu.be/Dxtqtvmmcgk')
            bot.send_photo(user_id,photo=open('/home/MrShiz/day_3.jpg','rb'))
        elif (current_diferience == 4):
            bot.send_message(user_id, 'https://telegra.ph/Den-4-Kak-iskat-informaciyu-o-TB-i-ne-navredit-sebe-10-10')
            bot.send_message(user_id, 'https://youtu.be/ociNGECabY8')
        elif (current_diferience == 5):
            bot.send_message(user_id,'https://telegra.ph/Den-5-Kak-lechitsya-tuberkulez-10-10')
            bot.send_message(user_id,'https://youtu.be/6YFmdh-zqLk')
            bot.send_message(user_id,'https://youtu.be/g8KirBkXPyc')
            bot.send_photo(user_id,photo=open('/home/MrShiz/day_5.jpg','rb'))
        elif (current_diferience == 6):
            bot.send_message(user_id,'https://telegra.ph/Den-6-Lechenie-v-stacionare-10-10')
            bot.send_message(user_id,'https://youtu.be/zdJI9WixRPo')
        elif (current_diferience == 7):
            bot.send_message(user_id,'https://telegra.ph/Den-7-Kak-ocenit-ehffekt-lecheniya-10-10')
            bot.send_message(user_id,'https://telegra.ph/Den-72-Pobochnye-ehffekty-10-21')
            bot.send_message(user_id,'https://youtu.be/v6fgXf_sVj0')
            bot.send_photo(user_id,photo=open('/home/MrShiz/day_7.jpg','rb'))
        elif (current_diferience == 8):
            bot.send_message(user_id,'https://telegra.ph/Den-8-Pobochnye-ehffekty-CHast-1-10-10-2')
            bot.send_message(user_id,'https://youtu.be/5y4gCfE1Ytw')
        elif (current_diferience == 9):
            bot.send_message(user_id,'https://telegra.ph/Den-8-Pobochnye-ehffekty-CHast-1-10-10')
            bot.send_message(user_id,'https://youtu.be/1EDKQ8pQOHE')
        elif (current_diferience == 10):
            bot.send_message(user_id,'https://telegra.ph/Den-10-Pereryvy-v-lechenii-10-10')
            bot.send_message(user_id,'https://youtu.be/0jDhZj2GNRY')
        elif (current_diferience == 11):
            bot.send_message(user_id,'https://telegra.ph/Den-11-Lechenie-vne-stacionara-10-10')
            bot.send_message(user_id,'https://youtu.be/gyEaTzzRshA')
        elif (current_diferience == 12):
            bot.send_message(user_id,'https://telegra.ph/Den-12-Samodiagnostika-trevozhnosti-i-depressii-10-10')
            bot.send_message(user_id,'https://telegra.ph/Vyjti-iz-zamknutogo-kruga-10-10')
        elif (current_diferience == 13):
            bot.send_message(user_id,'https://telegra.ph/Den-14-Obraz-zhizni-CHast-1-10-10')
            bot.send_photo(user_id,photo=open('/home/MrShiz/day_13.jpg','rb'))
        elif (current_diferience == 14):
            bot.send_message(user_id,'https://telegra.ph/Den-14-Obraz-zhizni-CHast-2-10-10')
        elif (current_diferience == 15):
            bot.send_message(user_id,'https://telegra.ph/Alkogol-prinyat-reshenie-10-10')
            bot.send_message(user_id,'https://youtu.be/_HH98tYnCFk')
        elif (current_diferience == 16):
            bot.send_message(user_id,'https://telegra.ph/Den-16-Zavisimost-situacii-vysokogo-riska-10-10')
        elif (current_diferience == 17):
            bot.send_message(user_id,'https://telegra.ph/Den-17-Kak-podgotovit-organizm-k-lecheniyu-10-10')
        elif (current_diferience == 18):
            bot.send_message(user_id,'https://telegra.ph/Den-18-Vnelegochnyj-tuberkulez-10-10')
        elif (current_diferience == 19):
            bot.send_message(user_id,'https://telegra.ph/Den-19-Hirurgicheskoe-lechenie-10-10')
        elif (current_diferience == 20):
            bot.send_message(user_id,'https://telegra.ph/Den-20-Narodnye-sredstva-10-10')
            bot.send_message(user_id,'https://youtu.be/jLjoEdihR_E')
        elif (current_diferience == 21):
            bot.send_message(user_id,'https://telegra.ph/Den-21-Tuberkulez-i-VICH-infekciya-10-10')
            bot.send_message(user_id,'https://youtu.be/plFJAF74OhM')
            bot.send_message(user_id,'https://youtu.be/346cTwR4SIE')
            bot.send_message(user_id,'https://youtu.be/VnlyQh_87hg')
            bot.send_message(user_id,'https://youtu.be/0uFS6l5clVc')
        elif (current_diferience == 22):
            bot.send_message(user_id,'https://telegra.ph/Den-22-Soputstvuyushchie-zabolevaniya-10-10')
            bot.send_photo(user_id, photo=open('/home/MrShiz/day_22.jpg','rb'))
        elif (current_diferience == 23):
            bot.send_message(user_id,'https://telegra.ph/Den-23-Pitanie-pri-tuberkuleze-10-10')
            bot.send_photo(user_id, photo=open('/home/MrShiz/day_23.jpg','rb'))
        else:
            bot.send_message(user_id,'https://telegra.ph/Den-24-Kak-zashchitit-blizkih-10-10')
            bot.send_message(user_id,'https://youtu.be/O6oTvZz50_M')
            bot.send_message(user_id,'https://youtu.be/iYuvkFs-Mm4')
            bot.send_photo(user_id, photo=open('/home/MrShiz/day_24.jpg','rb'))
    else:
        if(current_diferience !=0):
            bot.send_message(user_id,'На данный момент Вы получили все элементы нашей текущей рассылки, как только появится что-то новое мы обязательно Вам сообщим')
            with connect(
                host="MrShiz.mysql.pythonanywhere-services.com",
                user="MrShiz",
                password="Work632004",
                database="MrShiz$USERS",
                ) as connection:
                    delete_user="DELETE FROM user WHERE user_id =" +str(user_id)
                    with connection.cursor() as cursor:
                        cursor.execute(delete_user)
                        connection.commit()

@bot.callback_query_handler(func=lambda call:True)
def admin_sender(call):
    if call.data=="Read":
        bot.send_message(admin_id, '#'+str(call.message.from_user.id) +'#'+'\n'+str(call.message.from_user.first_name)+' '+str(call.message.from_user.last_name))
