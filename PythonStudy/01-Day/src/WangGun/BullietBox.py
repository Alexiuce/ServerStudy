

class BulletBox(object):

    def __init__(self):
        self.bullets = []

    def add_bullet(self, bullet):
        self.bullets.append(bullet)

    def __str__(self):
        return "bullet box info %d" % len(self.bullets)

