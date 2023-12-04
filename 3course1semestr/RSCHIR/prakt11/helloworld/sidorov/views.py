from django.http import HttpResponse

def hello_world(request):
    name = request.GET.get('name', '')
    if name:
        return HttpResponse(f'Hello, {name}!')
    else:
        return HttpResponse('Hello, Anonymous!')
