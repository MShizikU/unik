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
    inner_body = (x - 0.5) ** 2 + (y - 0.5) ** 2 < 0.2
    tangens = math.tan(math.pi / 6)
    inner_mouth = (y < ((x - 0.5) * tangens + 0.5)) & (y > (-(x - 0.5) * tangens + 0.5))
    inner_eye = (x - 0.65) ** 2 + (y - 0.2) ** 2 < 0.005

    yellow = inner_body and (not inner_mouth) and (not inner_eye)
    return yellow, yellow, 0


label = tk.Label()
img = tk.PhotoImage(data=pyshader(func, 256, 256)).zoom(2, 2)
label.pack()
label.config(image=img)
tk.mainloop()
