from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from .utils import generate_chart
import json
from hashlib import md5
import requests

@csrf_exempt
def upload_data(request):
    data = request

    hash_key = md5(str(data).encode()).hexdigest()

    chart_path = f'media/charts/{hash_key}.png'
    try:
        with open(chart_path, 'rb') as f:
            return HttpResponse(f.read(), content_type="image/png")
    except FileNotFoundError:
        pass
    except IOError:
        pass

    generate_chart(data, chart_path)

    return HttpResponse(open(chart_path, 'rb').read(), content_type="image/png")


@csrf_exempt
def books(request):
    response = requests.get('http://app-prac6:8080/books')
    data = response.json()
    converted_data = []
    for item in data:
        converted_data.append(item)
    
    return upload_data(converted_data)


@csrf_exempt
def telephones(request):
    response = requests.get('http://app-prac6:8080/telephones')
    data = response.json()
    converted_data = []
    for item in data: 
        converted_data.append(item)
    return upload_data(converted_data)
