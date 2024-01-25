import os
import sys
if sys.__stdout__ is None or sys.__stderr__ is None:
    os.environ['KIVY_NO_CONSOLELOG'] = '1'

import kivy, random, json, importlib, webbrowser, database as db
kivy.require('2.1.0')

from kivy.app import App
from kivy.config import Config
Config.set('graphics', 'width', '1280')
Config.set('graphics', 'height', '700')
Config.set('graphics', 'resizable', '0')
Config.set('input', 'mouse', 'mouse,disable_multitouch')

from kivy.lang.builder import Builder
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.relativelayout import RelativeLayout
from kivy.uix.textinput import TextInput
from kivy.uix.label import Label
from kivy.properties import StringProperty as SP
from kivy.uix.popup import Popup
from kivy.uix.button import Button
from kivy.uix.image import Image
from kivy.uix.checkbox import CheckBox

class MainScreen(Screen):
    def generate(self):
        opponent_class = 'singleclass'
        race_length = 'short'
        weather = 'raining'
        car_class1 = 'datafiles/images/class_null.png'
        car_class2 = 'datafiles/images/class_null.png'
        car_class3 = 'datafiles/images/class_null.png'
        car_class4 = 'datafiles/images/class_null.png'
        car_class5 = 'datafiles/images/class_null.png'

        if self.ids.singleclass.active == True: opponent_class = 'singleclass'
        elif self.ids.multiclass.active == True: opponent_class = 'multiclass'

        if self.ids.shortlength.active == True: race_length = 'short'
        elif self.ids.mediumlength.active == True: race_length = 'medium'
        elif self.ids.longlength.active == True: race_length = 'long'
        elif self.ids.endurancelength.active == True: race_length = 'endurance'

        if self.ids.raining.active == True: weather = 'raining'
        elif self.ids.norain.active == True: weather = 'norain'

        if opponent_class == 'singleclass':
            class_type = random.choice(['normal', 'normal', 'normal', 'kart', 'normal', 'normal', 'normal', 'rx', 'normal', 'normal'])
            car_class1 = self.class_check(class_type)
            self.ids.class1.source = car_class1
            self.ids.class2.source = db.null[0]
            self.ids.class3.source = db.null[0]
            self.ids.class4.source = db.null[0]
            self.ids.class5.source = db.null[0]

        if opponent_class == 'multiclass':
            class_type = random.choice(['normal', 'normal', 'normal', 'kart', 'normal', 'normal', 'normal', 'rx', 'normal', 'normal'])

            if class_type == 'normal': class_num = random.randint(1,5)
            elif class_type == 'kart': class_num = random.randint(1,4)
            elif class_type == 'rx': class_num = random.randint(1,3)

            car_class_count = 0

            while car_class_count < class_num:
                if car_class_count == 0:
                    car_class1 = self.class_check(class_type)
                    self.ids.class1.source = car_class1
                    car_class_count +=1
                elif car_class_count == 1:
                    car_class2 = self.class_check(class_type)
                    if car_class2 != car_class1:
                        self.ids.class2.source = car_class2
                        car_class_count +=1
                    else: pass
                elif car_class_count == 2:
                    car_class3 = self.class_check(class_type)
                    if car_class3 != car_class2 and car_class3 != car_class1:
                        self.ids.class3.source = car_class3
                        car_class_count +=1
                    else: pass
                elif car_class_count == 3:
                    car_class4 = self.class_check(class_type)
                    if car_class4 != car_class3 and car_class4 != car_class2 and car_class4 != car_class1:
                        self.ids.class4.source = car_class4
                        car_class_count +=1
                    else: pass
                elif car_class_count == 4:
                    car_class5 = self.class_check(class_type)
                    if car_class5 != car_class4 and car_class5 != car_class3 and car_class5 != car_class2 and car_class5 != car_class1:
                        self.ids.class5.source = car_class5
                        car_class_count +=1
                        break
                    else: pass

            if class_num == 1:
                self.ids.class2.source = db.null[0]
                self.ids.class3.source = db.null[0]
                self.ids.class4.source = db.null[0]
                self.ids.class5.source = db.null[0]
            elif class_num == 2:
                self.ids.class3.source = db.null[0]
                self.ids.class4.source = db.null[0]
                self.ids.class5.source = db.null[0]
            elif class_num == 3:
                self.ids.class4.source = db.null[0]
                self.ids.class5.source = db.null[0]
            elif class_num == 4:
                self.ids.class5.source = db.null[0]

        #poha

    def class_check(self, class_type):
        json_file = open("datafiles/dlcs.json", 'r')
        dlc_file = json.load(json_file)

        random.shuffle(db.classes)
        random.shuffle(db.kart_classes)
        random.shuffle(db.rx_classes)

        if dlc_file['Adrenaline pack pt1'] == False:
            class_type = 'kart'


        if class_type == 'normal': choosen_class = random.choice(db.classes)
        elif class_type == 'kart': choosen_class = random.choice(db.kart_classes)
        elif class_type == 'rx': choosen_class = random.choice(db.rx_classes)
        

        if dlc_file["Endurance pt1"] == False:
            if 'class45' in choosen_class: return self.class_check()
            elif 'class53' in choosen_class: return self.class_check()
        
        if dlc_file["Formula Hitech"] == False:
            if 'class12' in choosen_class: return self.class_check()
            elif 'class13' in choosen_class: return self.class_check()

        if dlc_file["Racin'USA pt1"] == False:
            if 'class11' in choosen_class: return self.class_check()
            elif 'class48' in choosen_class: return self.class_check()

        if dlc_file["Super Cars pt1"] == False:
            if 'class52' in choosen_class: return self.class_check()

        return choosen_class
        

class WindowManager(ScreenManager):
    pass

kv = Builder.load_file('datafiles/main.kv')

class MegaRandom_AMS2(App):
    def build(self):
        #self.icon = 'datafiles/images/icon.jpeg'
        return kv

if __name__ == '__main__':
    MegaRandom_AMS2().run()