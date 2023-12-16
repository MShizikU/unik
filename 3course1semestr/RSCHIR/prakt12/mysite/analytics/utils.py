import matplotlib.pyplot as plt
import numpy as np

def generate_chart(data, chart_path):
    names = [item['name'] for item in data]
    values = [item['price'] for item in data]

    plt.figure(figsize=(10, 5))
    plt.bar(names, values)
    plt.savefig(chart_path)
    plt.close()
