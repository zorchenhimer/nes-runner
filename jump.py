import math

speed = 6
offset = int("76", 16)
frames = 30
rate = 0.27

for i in range(frames):
    speed -= rate
    if speed <= 0:
        speed = 0
    offset -= math.floor(speed)
    print(hex(offset))
