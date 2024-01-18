import os
import sys
if sys.__stdout__ is None or sys.__stderr__ is None:
    os.environ['KIVY_NO_CONSOLELOG'] = '1'

import kivy, random, json, importlib, webbrowser
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

        if self.ids.singleclass.active == True: opponent_class = 'singleclass'
        elif self.ids.multiclass.active == True: opponent_class = 'multiclass'

        if self.ids.shortlength.active == True: race_length = 'short'
        elif self.ids.mediumlength.active == True: race_length = 'medium'
        elif self.ids.longlength.active == True: race_length = 'long'
        elif self.ids.endurancelength.active == True: race_length = 'endurance'

        if self.ids.raining.active == True: weather = 'raining'
        elif self.ids.norain.active == True: weather = 'norain'

        print(opponent_class)
        print(race_length)
        print(weather)
        

class WindowManager(ScreenManager):
    pass

kv = Builder.load_file('datafiles/main.kv')

class MegaRandom_AMS2(App):
    def build(self):
        #self.icon = 'datafiles/images/icon.jpeg'
        return kv

if __name__ == '__main__':
    MegaRandom_AMS2().run()