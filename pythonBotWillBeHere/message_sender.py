from datetime import datetime
import telebot
from mysql.connector import connect, Error
this_day = int(datetime.today().day)
current_diferience = 0
date_of_start=0
user_id=0
counter=0

mhost="109.68.213.82"
muser="gen_user"
mpasswd="Work632004"
mdb="default_db"
mport = 3306

bot = telebot.TeleBot("5981846313:AAGwnJo06O5rhW0NbM6LoPvuJvNjFdWS7DI")
admin_id=374743214

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
    date_of_start=0
    try:
        with connect(
            host=mhost,
            user=muser,
            passwd=mpasswd,
            db=mdb,
            port=mport
        ) as connection:
            get_id_and_start_date="SELECT user_id, date_of_start FROM user"
            with connection.cursor() as cursor:
                cursor.execute(get_id_and_start_date)
                result = cursor.fetchall()
                for row in result[count-1]:
                    if user_id==0:
                        user_id=int(row)
                    else:
                        date_of_start=int(str((row))[-2:])

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
    if (current_diferience <= 27) and (current_diferience>0):
        print(current_diferience)
        if (current_diferience == 1):
            bot.send_message(user_id,'Как со всем справится')
            bot.send_message(user_id,'\nВот ваша первая рассылка: https://telegra.ph/Kak-so-vsem-ehtim-spravitsya-10-10')
            bot.send_message(user_id, 'Видео на YouTube:\nСтрахи, мифы и принятие диагноза\nhttps://youtu.be/JpHI6Ip3jNA')
        if (current_diferience == 2):
            bot.send_message(user_id, 'Что такое туберкулез?')
            bot.send_message(user_id, 'https://telegra.ph/Den-1-CHto-takoe-tuberkulez-10-10 ')
            bot.send_message(user_id, 'Туберкулез излечим https://www.youtube.com/watch?v=mm4TDn4L9q4')
            bot.send_photo(user_id, photo=open('1.jpg', 'rb'))
        elif (current_diferience == 3):
            bot.send_message(user_id, 'Как передается туберкулез?')
            bot.send_message(user_id, 'https://telegra.ph/Den-2-Kak-peredaetsya-tuberkulez-10-10')
        elif (current_diferience == 4):
            bot.send_message(user_id, 'Как защитить близких')
            bot.send_message(user_id, 'https://telegra.ph/Den-24-Kak-zashchitit-blizkih-10-10')
            bot.send_message(user_id,'1. Что могут предпринимать родственники https://youtu.be/3k_kQGDA1Fw')
            bot.send_message(user_id,'2. Правила использования СИЗ https://youtu.be/jt9jgWiCZbM')
            bot.send_message(user_id,'3. Профилактическое лечение латентной туберкулезной инфекции https://youtu.be/LtX8KtZ6Xys')
        elif (current_diferience == 5):
            bot.send_message(user_id, 'Как ставится диагноз "Туберкулез"')
            bot.send_message(user_id, 'https://telegra.ph/Kak-stavitsya-diagnoz-Tuberkulez-10-10')
            bot.send_message(user_id, 'Развитие заболевания, симптомы, диагностика https://youtu.be/Mjsw-Nv_dSc')
            bot.send_photo(user_id, photo=open('2.jpg', 'rb'))
        elif (current_diferience == 6):
            bot.send_message(user_id, 'Как искать информацию о ТБ и не навредить себе')
            bot.send_message(user_id,'https://telegra.ph/Den-4-Kak-iskat-informaciyu-o-TB-i-ne-navredit-sebe-10-10')
            bot.send_message(user_id,'Где искать информацию\nhttps://youtu.be/7MjvkavKEJI')
        elif (current_diferience == 7):
            bot.send_message(user_id, 'Как лечится туберкулез?')
            bot.send_message(user_id,'https://telegra.ph/Den-5-Kak-lechitsya-tuberkulez-10-10 ')
            bot.send_message(user_id,'Брошюра «Короткие курсы лечения ТБ» http://tbicvladimir.org/index.php/polezno-znat-2/157-kak-ne-dat-prosnutsya-tuberkulezu-v-vashem-organizme-2')
            bot.send_message(user_id,'Цель лечения, концентрация препаратов, формирование ЛУ \nhttps://youtu.be/8LC5ZoKvCFE')
            bot.send_message(user_id,'Лечение туберкулеза https://youtu.be/lOD2d7KX63c\n')
            bot.send_photo(user_id, photo=open('3.jpg', 'rb'))
            bot.send_photo(user_id, photo=open('4.jpg', 'rb'))
        elif (current_diferience == 8):
            bot.send_message(user_id, 'Как подготовить организм')
            bot.send_message(user_id,'https://telegra.ph/Den-17-Kak-podgotovit-organizm-k-lecheniyu-10-10')
        elif (current_diferience == 9):
            bot.send_message(user_id, 'Лечение в стационаре')
            bot.send_message(user_id,'https://telegra.ph/Den-6-Lechenie-v-stacionare-10-10')
            bot.send_message(user_id,'Жизнь в стационаре\nhttps://youtu.be/41IUYO_rdJI')
        elif (current_diferience == 10):
            bot.send_message(user_id, 'Как оценить эффект лечения')
            bot.send_message(user_id,'https://telegra.ph/Den-7-Kak-ocenit-ehffekt-lecheniya-10-10')
            bot.send_message(user_id,'Залог эффективного лечения\nhttps://youtu.be/MYf48ZHG5J4')
            bot.send_photo(user_id, photo=open('5.jpg', 'rb'))
            bot.send_message(user_id, 'https://telegra.ph/Den-72-Pobochnye-ehffekty-10-21')
        elif (current_diferience == 11):
            bot.send_message(user_id, 'Побочные эффекты. Часть 1')
            bot.send_message(user_id,'https://telegra.ph/Den-8-Pobochnye-ehffekty-CHast-1-10-10-2')
            bot.send_message(user_id,'Побочные эффекты лечения взгляд пациентов и советы\nhttps://youtu.be/Di8KoDe4sNo')
        elif (current_diferience == 12):
            bot.send_message(user_id, 'Побочные эффекты. Часть 2')
            bot.send_message(user_id,'https://telegra.ph/Den-8-Pobochnye-ehffekty-CHast-1-10-10')
            bot.send_message(user_id,'Побочные эффекты, взгляд медицинской сестры https://youtu.be/YnBezcVXXd8')
        elif (current_diferience == 13):
            bot.send_message(user_id, 'Лечение вне стационара')
            bot.send_message(user_id,'https://telegra.ph/Den-11-Lechenie-vne-stacionara-10-10')
            bot.send_message(user_id, '1. Формы организации лечения: стационар, стационар на дому https://youtu.be/0j7BLNS7cE8')
            bot.send_message(user_id, '2. Лечение туберкулеза во Владимирской области https://youtu.be/mmMD72G1Sdg')
        elif (current_diferience == 14):
            bot.send_message(user_id, 'Перерывы в лечении')
            bot.send_message(user_id,'https://telegra.ph/Den-10-Pereryvy-v-lechenii-10-10 ')
            bot.send_message(user_id,'Приверженность https://youtu.be/bB6CImRnqNU')
        elif (current_diferience == 15):
            bot.send_message(user_id, 'Питания при туберкулезе')
            bot.send_message(user_id,'https://telegra.ph/Den-23-Pitanie-pri-tuberkuleze-10-10')
            bot.send_photo(user_id, photo=open('6.jpg', 'rb'))
        elif (current_diferience == 16):
            bot.send_message(user_id, 'Народные средства')
            bot.send_message(user_id,'https://telegra.ph/Den-20-Narodnye-sredstva-10-10')
            bot.send_message(user_id, 'Народные средства https://youtu.be/bjTRFMhxjJg')
        elif (current_diferience == 17):
            bot.send_message(user_id, 'Образ жизни. Часть 1')
            bot.send_message(user_id,'https://telegra.ph/Den-14-Obraz-zhizni-CHast-1-10-10')
            bot.send_photo(user_id, photo=open('7.jpg', 'rb'))
        elif (current_diferience == 18):
            bot.send_message(user_id, 'Образ жизни. Часть 2')
            bot.send_message(user_id,'https://telegra.ph/Den-14-Obraz-zhizni-CHast-2-10-10')
        elif (current_diferience == 19):
            bot.send_message(user_id, 'Зависимость: принять решение. Две части, высыпать разными сообщениями')
            bot.send_message(user_id,'https://telegra.ph/Alkogol-prinyat-reshenie-10-10')
            bot.send_message(user_id,'Употребление алкоголя и наркотиков https://youtu.be/VxAy3D7DSXY')
            bot.send_message(user_id, 'https://telegra.ph/Den-16-Zavisimost-situacii-vysokogo-riska-10-10')
        elif (current_diferience == 20):
            bot.send_message(user_id, 'Внелегочный туберкулез')
            bot.send_message(user_id,'https://telegra.ph/Den-18-Vnelegochnyj-tuberkulez-10-10')
            bot.send_photo(user_id, photo=open('8.jpg', 'rb'))
        elif (current_diferience == 21):
            bot.send_message(user_id, 'Хирургическое лечение')
            bot.send_message(user_id, 'https://telegra.ph/Den-19-Hirurgicheskoe-lechenie-10-10')
        elif (current_diferience == 22):
            bot.send_message(user_id, 'Туберкулез и ВИЧ')
            bot.send_message(user_id, 'https://telegra.ph/Den-21-Tuberkulez-i-VICH-infekciya-10-10')
            bot.send_message(user_id, '1. Пациенты о туберкулезе и ВИЧ https://youtu.be/gukTvyGsESQ')
            bot.send_message(user_id, '2. ВИЧ и ТБ: Личный опыт пациентки  https://youtu.be/346cTwR4SIE')
            bot.send_message(user_id, '3. Влияние АРТ на риск развития туберкулеза https://youtu.be/_EUHg2cDDcU')
            bot.send_message(user_id, '4. Выздоровление от Тб при ВИЧ https://youtu.be/0uFS6l5clVc')
        elif (current_diferience == 23):
            bot.send_message(user_id, 'Сопутствующие заболевания')
            bot.send_message(user_id, 'https://telegra.ph/Den-22-Soputstvuyushchie-zabolevaniya-10-10')
            bot.send_photo(user_id, photo=open('9.jpg', 'rb'))
        elif (current_diferience == 24):
            bot.send_message(user_id, 'Самодиагностика тревожности и депресии. Часть 1')
            bot.send_message(user_id, 'https://telegra.ph/Den-12-Samodiagnostika-trevozhnosti-i-depressii-10-10')
            bot.send_message(user_id, 'Самодиагностика тревожности и депресии. Часть 2')
            bot.send_message(user_id, 'https://telegra.ph/Vyjti-iz-zamknutogo-kruga-10-10')
        elif (current_diferience == 25):
            bot.send_message(user_id, 'О платфоре "Мне легче"')
            bot.send_message(user_id, 'https://telegra.ph/Mne-legche-07-09')
        elif (current_diferience == 26):
            bot.send_message(user_id, 'Латентная туберкулезная инфекция')
            bot.send_message(user_id, 'Ссылка на брошюру  «Как не дать туберкулезу проснуться в вашем организме» \nhttp://tbicvladimir.org/index.php/polezno-znat-2/155-kak-ne-dat-prosnutsya-tuberkulezu-v-vashem-organizme')
            bot.send_photo(user_id, photo=open('10.jpg', 'rb'))
        elif (current_diferience == 27):
            bot.send_message(user_id, 'Будущее')
            bot.send_message(user_id, '1. Будущее \nhttps://youtu.be/pkx76mzY16k')
            bot.send_message(user_id, '2. Применение пациент-ориентированных технологий на амбулаторном этапе\nhttps://www.youtube.com/watch?v=rBNqbrHQfDo')

    else:
        if(current_diferience !=0):
            bot.send_message(user_id,'На данный момент Вы получили все элементы нашей текущей рассылки, как только появится что-то новое мы обязательно Вам сообщим')
            with connect(
                host=mhost,
                user=muser,
                passwd=mpasswd,
                db=mdb,
                port=mport
                ) as connection:
                    delete_user="DELETE FROM user WHERE user_id =" +str(user_id)
                    with connection.cursor() as cursor:
                        cursor.execute(delete_user)
                        connection.commit()

@bot.callback_query_handler(func=lambda call:True)
def admin_sender(call):
    if call.data=="Read":
        bot.send_message(admin_id, '#'+str(call.message.from_user.id) +'#'+'\n'+str(call.message.from_user.first_name)+' '+str(call.message.from_user.last_name))
