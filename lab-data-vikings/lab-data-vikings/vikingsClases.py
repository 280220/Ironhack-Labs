
# Soldier
from random import choice

class Soldier:
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
    def attack(self):
        return self.strength
    def receiveDamage(self, damage):
        self.health-=damage

# Viking


class Viking(Soldier):
    def __init__(self, name, health, strength):
        self.name = name
        self.health = health
        self.strength = strength
    def receiveDamage(self, damage):
        self.health-=damage
        if self.health > 0:
            return self.name+' has received '+str(damage)+' points of damage'
        else:
            return self.name+' has died in act of combat'
    def battleCry(self):
        return 'Odin Owns You All!'

# Saxon


class Saxon(Soldier):
        def receiveDamage(self, damage):
            self.health-=damage
            if self.health > 0:
                return 'A Saxon has received '+str(damage)+' points of damage'
            else:
                return 'A Saxon has died in combat'

# War


class War:
    def __init__(self):
        self.vikingArmy = []
        self.saxonArmy = []
    def addViking(self, viking):
        self.vikingArmy.append(viking)
    def addSaxon(self, saxon):
        self.saxonArmy.append(saxon)
    def vikingAttack(self):
        x=choice(self.saxonArmy).receiveDamage(choice(self.vikingArmy).attack())
        self.saxonArmy = [saxon for saxon in self.saxonArmy if saxon.health > 0]
        return x
    def saxonAttack(self):
        y=choice(self.vikingArmy).receiveDamage(choice(self.saxonArmy).attack())
        self.vikingArmy = [viking for viking in self.vikingArmy if viking.health > 0]
        return y
    def showStatus(self):
        if len(self.saxonArmy)==0:
            return "Vikings have won the war of the century!"
        elif len(self.vikingArmy)== 0:
            return "Saxons have fought for their lives and survive another day..."
        elif len(self.saxonArmy)>0 and len(self.vikingArmy)> 0:
            return "Vikings and Saxons are still in the thick of battle."