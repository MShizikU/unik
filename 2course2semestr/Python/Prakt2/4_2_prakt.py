import math
import tkinter as tk


def pyshader(func, w, h):
    scr = bytearray((0, 0, 0) * w * h)
    for y in range(h):
        for x in range(w):
            p = (w * y + x) * 3
            scr[p:p + 3] = [max(min(int(c * 255), 255), 0)
                            for c in func(x / w, y / h)]
    return bytes('P6\n%d %d\n255\n' % (w, h), 'ascii') + scr


# Ваш код здесь:
def func(x, y):
    r_squared = 0.335*0.335
    red_distance = 0.525
    green_distance = 0.475
    g = 1 - ((green_distance - x)**2 + (green_distance - y)**2) / r_squared
    r = 1 - ((red_distance - x)**2 + (red_distance - y)**2) / r_squared
    return r,g,0


label = tk.Label()
img = tk.PhotoImage(data=pyshader(func, 256, 256)).zoom(2, 2)
label.pack()
label.config(image=img)
tk.mainloop()
