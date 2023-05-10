<?php

class Alfa
{
    /**
     * Статус подключения
     *
     * @var boolean
     */
    public static $alfa_auth = false;

    /**
     * Текст ошибки
     *
     * @var string
     */
    private static $alfa_error = "";
    private static $token;
    private static $adomain;
    private static $curl;

    /**
     * Аутентификация
     *
     * @param array $data
     * @return void
     */
    public static function Auth($data)
    {
        $adomain = $data['domain'];
        self::$adomain = $adomain;
        $alogin = $data['login'];
        $akey = $data['key'];

        $host = 'https://' . $adomain .'.s20.online';

        

        $data    = ['email' => $alogin, 'api_key' => $akey];

        $headers = ['Accept: application/json', 'Content-Type: application/json'];

        $curl = curl::app($host)
            ->transfer(true)
            ->add_headers($headers)
            ->imethod('POST')
            ->data($data);
        $result = $curl->getResultArray('/v2api/auth/login');

        $code = $curl->getInfoCode();

        if ($curl->getError()) {
            self::$alfa_error = "curl error";
            self::$alfa_auth = false;
            return false;
        }

        if ($code !== 200) {
            self::$alfa_error = "auth error";
            self::$alfa_auth = false;
            return false;
        }

        self::$token = $result['token'];
        self::$alfa_auth = true;
    }

    /**
     * Получение Филлиалов
     *
     * @param array $array
     * @return void
     */
    public static function getBranch($array = array())
    {
        $url = 'https://' . self::$adomain . '/v2api/branch/index';
        return self::requestCurl($url, $array);
    }

    /**
     * Получение типов лекций
     *
     * @param void $branch
     * @param array $array
     * @return void
     */
    public static function getLessonType($branch, $array = array())
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/lesson-type/index';
        return self::requestCurl($url, $array);
    }

    /**
     * Получение предметов обучения
     *
     * @param void $branch
     * @param array $array
     * @return void
     */
    public static function getSubjectLesson($branch, $array = array())
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/subject/index';
        return self::requestCurl($url, $array);
    }

    /**
     * Получить учеников
     *
     * @param integer $branch
     * @param array $array
     * @return void
     */
    public static function getCustomers($branch = 1, $array = array())
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/customer/index';
        return self::requestCurl($url, $array);
    }

    /**
     * Создать ученика
     *
     * @param integer $branch
     * @param array $array
     * @param string $id
     * @return void
     */
    public static function createCustomers($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/customer/create';
        return self::requestCurl($url, $array);
    }

    /**
     * Обновить ученика
     *
     * @param integer $branch
     * @param array $array
     * @param string $id
     * @return void
     */
    public static function updateCustomers($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/customer/update?id=' . $id;
        return self::requestCurl($url, $array);
    }

    /**
     * Получить локации/комнаты
     *
     * @param integer $branch
     * @param array $array
     * @param string $id
     * @return void
     */
    public static function getRoom($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/room/index';
        return self::requestCurl($url, $array);
    }

    /**
     * Получить учителей
     *
     * @param integer $branch
     * @param array $array
     * @param string $id
     * @return void
     */
    public static function getTeachers($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/teacher/index';
        return self::requestCurl($url, $array);
    }

    public static function getLessions($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/lesson/index';
        if (!empty($id)) $url = $url . "?id=" . $id;
        return self::requestCurl($url, $array);
    }
    public static function updateLessions($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/lesson/update';
        if (!empty($id)) $url = $url . "?id=" . $id;
        return self::requestCurl($url, $array);
    }
    public static function getGroup($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/group/index';
        return self::requestCurl($url, $array);
    }

    public static function getGroupCustomer($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/cgi/index?group_id=' . $id;
        return self::requestCurl($url, $array);
    }

    public static function addGroupCustomer($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/cgi/create?group_id=' . $id;
        return self::requestCurl($url, $array);
    }

    public static function getLog($branch = 1, $array = array(), $id = '')
    {
        $url = 'https://' . self::$adomain . '/v2api/' . $branch . '/log/index';
        return self::requestCurl($url, $array);
    }

    /**
     * Запрос api в Альфу
     *
     * @param [type] $url
     * @param [type] $array
     * @return void
     */
    private static function requestCurl($url, $array)
    {
        if (!self::$alfa_auth) {
            self::$alfa_error = "auth error";
            return false;
        }

        sleep(1);
        $data_json = json_encode($array);

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_HTTPHEADER, ['X-ALFACRM-TOKEN: ' . self::$token, 'Accept: application/json', 'Content-Type: application/json']);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_json);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $result = json_decode(curl_exec($ch), true);
        $code   = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if (curl_errno($ch)) {
            self::$alfa_error = "curl error";
            return false;
        }

        curl_close($ch);

        if ($code !== 200) {
            self::$alfa_error = "request  error";
            return false;
        }

        return $result;
    }

    /**
     * Вывести ошибку
     *
     * @return void
     */
    public static function getError()
    {
        return self::$alfa_error;
    }
}
