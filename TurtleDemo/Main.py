#/usr/bin/env python
# -*- coding: UTF-8 -*-

import turtle

import time


def draw():
    window = turtle.Screen()
    badge = turtle.Turtle()
    badge.color('green','black')
    badge.left(90)
    badge.forward(100)
    badge.right(90)
    badge.color('black','black')
    badge.begin_fill()
    badge.circle(10)
    badge.end_fill()

    for i in range(1,24):
        badge.left(15)
        badge.forward(50)
        badge.left(157)
        badge.forward(50)

    window.exitonclick()



boxsize = 200
caught = False
score = 0

window = turtle.Screen()
mouse = turtle.Turtle()
cat = turtle.Turtle()

def up():
    mouse.forward(10)
    checkbound()


def left():
    mouse.left(45)


def right():
    mouse.right(45)

def back():
    mouse.backward(10)
    checkbound()


def qiutTurles():
    window.bye()


def checkbound():
    global boxsize
    if mouse.xcor() > boxsize:
        mouse.goto(boxsize, mouse.ycor())
    if mouse.xcor() < - boxsize:
        mouse.goto(-boxsize, mouse.ycor())
    if mouse.ycor() > boxsize:
        mouse.goto(mouse.xcor(), boxsize)
    if mouse.ycor() < -boxsize:
        mouse.goto(mouse.xcor(), -boxsize)


mouse.penup()
cat.penup()
mouse.goto(100, 100)

window.onkeypress(up, 'Up')
window.onkeypress(left, 'Left')
window.onkeypress(right, 'Right')
window.onkeypress(back, 'Down')
window.onkeypress(qiutTurles, 'Escape')


difficulty = window.numinput('Difficulty', 'Enter a difficulty for easy(1) for hard(5)',minval=1, maxval=5)
window.listen()

while not caught:
    cat.setheading(cat.towards(mouse))
    cat.forward(8 + difficulty)
    score += 1
    if cat.distance(mouse) < 5:
        caught = True
    time.sleep(0.2 - (0.01 * difficulty))
window.textinput('Game Over', 'Well done, You scored:' + str(score * difficulty))
window.bye()




if __name__ == '__main__':
    pass
