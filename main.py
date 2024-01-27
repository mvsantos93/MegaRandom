import os
import sys
if sys.__stdout__ is None or sys.__stderr__ is None:
    os.environ['KIVY_NO_CONSOLELOG'] = '1'

import kivy, random, json, webbrowser, database as db
kivy.require('2.1.0')

from kivy.app import App
from kivy.config import Config
Config.set('graphics', 'width', '1280')
Config.set('graphics', 'height', '700')
Config.set('graphics', 'resizable', '0')
Config.set('input', 'mouse', 'mouse,disable_multitouch')

from kivy.lang.builder import Builder
from kivy.uix.screenmanager import ScreenManager, Screen

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
        short_distances = ["5 minutes", "10 minutes"]
        medium_distances = ["15 minutes", "20 minutes", "25 minutes"]
        long_distances = ["30 minutes", "35 minutes", "40 minutes", "45 minutes", "50 minutes"]
        endurance_distances = ["01 hour", "01h20 minutes", "1h30 minutes", "02 hours", "2h20 minutes", "2h30 minutes", "03 hours"]
        time_progression = ["Real", "2x", "5x", "10x", "15x", "20x", "25x", "30x", "40x", "50x", "60x"]


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

            if class_type == 'normal': class_num = random.randint(2,5)
            elif class_type == 'kart': class_num = random.randint(2,4)
            elif class_type == 'rx': class_num = random.randint(2,3)

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

        self.ids.trackname.text = self.track_check(class_type)

        if race_length == 'short': self.ids.duration.text = f'{random.choice(short_distances)} + 1 lap'
        if race_length == 'medium': self.ids.duration.text = f'{random.choice(medium_distances)} + 1 lap'
        if race_length == 'long': self.ids.duration.text = f'{random.choice(long_distances)} + 1 lap'
        if race_length == 'endurance': self.ids.duration.text = f'{random.choice(endurance_distances)} + 1 lap'

        self.ids.starttime.text = f'{random.randint(0,23)}h - {random.choice(time_progression)} time progression'

        weather_num = random.randint(1,4)
        weather_count = 1
        while weather_count <= weather_num:
            if weather_count == 1:
                self.ids.weather1.source = self.weather_check(weather)
                weather_count += 1
                self.ids.weather2.source = db.null[1]
                self.ids.weather3.source = db.null[1]
                self.ids.weather4.source = db.null[1]
            elif weather_count == 2:
                weather2 = self.weather_check(weather)
                if weather2 == self.ids.weather1.source: pass
                else: 
                    self.ids.weather2.source = weather2
                    weather_count += 1
                    self.ids.weather3.source = db.null[1]
                    self.ids.weather4.source = db.null[1]
            elif weather_count == 3:
                weather3 = self.weather_check(weather)
                if weather3 == self.ids.weather2.source: pass
                else:
                    self.ids.weather3.source = weather3
                    weather_count += 1
                    self.ids.weather4.source = db.null[1]
            elif weather_count == 4:
                weather4 = self.weather_check(weather)
                if weather4 == self.ids.weather3.source: pass
                else:
                    self.ids.weather4.source = weather4
                    weather_count += 1

        self.ids.starttype.text = random.choice(["Standing", "Rolling"])

        if race_length == 'short': self.ids.pitstop.text = "No mandatory pitstop"
        else: self.ids.pitstop.text = random.choice(["No mandatory pitstop", "2x Tires", "4x Tires"])

        if race_length == 'short': self.ids.tracklimits.text = "3"
        else: self.ids.tracklimits.text = str(random.randint(3,10))

        if race_length == 'short': self.ids.sfcy.text = "OFF"
        else: self.ids.sfcy.text = random.choice(["Random", "25% Race", "50% Race", "75% Race", "OFF"])

        if race_length == 'short': self.ids.fcy.text = "NO"
        else: self.ids.fcy.text = random.choice(["YES", "NO"])

    def class_check(self, class_type):
        json_file = open("datafiles/dlcs.json", 'r')
        dlc_file = json.load(json_file)

        random.shuffle(db.classes)
        random.shuffle(db.kart_classes)
        random.shuffle(db.rx_classes)

        if dlc_file['Adrenaline pack pt1'] == False and class_type == 'rx':
            class_type = 'kart'

        if class_type == 'normal': choosen_class = random.choice(db.classes)
        elif class_type == 'kart': choosen_class = random.choice(db.kart_classes)
        elif class_type == 'rx': choosen_class = random.choice(db.rx_classes)
        

        if dlc_file["Endurance pt1"] == False:
            if 'class45' in choosen_class: return self.class_check(class_type)
            elif 'class53' in choosen_class: return self.class_check(class_type)
        
        if dlc_file["Formula Hitech"] == False:
            if 'class12' in choosen_class: return self.class_check(class_type)
            elif 'class13' in choosen_class: return self.class_check(class_type)

        if dlc_file["Racin'USA pt1"] == False:
            if 'class11' in choosen_class: return self.class_check(class_type)
            elif 'class48' in choosen_class: return self.class_check(class_type)

        if dlc_file["Super Cars pt1"] == False:
            if 'class52' in choosen_class: return self.class_check(class_type)

        json_file.close()
        return choosen_class
        
    def track_check(self, class_type):
        json_file = open("datafiles/dlcs.json", 'r')
        dlc_file = json.load(json_file)

        if dlc_file['Adrenaline pack pt1'] == False and class_type == 'rx':
            class_type = 'kart'

        if class_type == 'kart':
            random.shuffle(db.kart_tracks)
            return random.choice(db.kart_tracks)
        elif class_type == 'rx':
            random.shuffle(db.rx_tracks)
            track = random.choice(db.rx_tracks)
        else:
            random.shuffle(db.tracks)
            track = random.choice(db.tracks)

        if dlc_file["LeMans"] == False:
            if '24 Heures du Mans' in track or 'Le Mans Bugatti' in track: return self.track_check(class_type)
        if dlc_file["Historical Track Pack pt2"] == False:
            if 'Interlagos 1991' in track or 'Interlagos 1993' in track or 'Montreal 1991' in track: return self.track_check(class_type)
        if dlc_file['Barcelona-Catalunya'] == False:
            if 'Barcelona' in track: return self.track_check(class_type)
        if dlc_file["Historical Track Pack pt1"] == False:
            if 'Cascais 1988' in track or 'Jerez 1988' in track: return self.track_check(class_type)
        if dlc_file["Racin'USA pt1"] == False:
            if 'Daytona' in track or 'Long Beach' in track or 'Laguna' in track: return self.track_check(class_type)
        if dlc_file["Racin'USA pt2"] == False:
            if 'Cleveland' in track or 'Road America' in track or 'Watkins' in track: return self.track_check(class_type)
        if dlc_file["Racin'USA pt3"] == False:
            if 'Fontana' in track or 'Gateway' in track or 'Indianapolis' in track: return self.track_check(class_type)
        if dlc_file["Monza Pack"] == False:
            if 'Monza' in track: return self.track_check(class_type)
        if dlc_file["Nurburgring Pack"] == False:
            if 'Nurburgring' in track or 'Nordschleife' in track: return self.track_check(class_type)
        if dlc_file["Spa-Franchorchamps Pack"] == False:
            if 'Spa' in track: return self.track_check(class_type)
        if dlc_file["Silverstone Pack"] == False:
            if 'Silverstone' in track: return self.track_check(class_type)
        if dlc_file["Hockenheimring Pack"] == False:
            if 'Hockenheim' in track: return self.track_check(class_type)

        return track
    
    def weather_check(self, rain):
        if rain == 'raining':
            random.shuffle(db.weathers)
            return random.choice(db.weathers)
        else:
            random.shuffle(db.weathers)
            weather = random.choice(db.weathers)
            if '05' in weather or '06' in weather or '07' in weather or '08' in weather or '10' in weather or '12' in weather or '14' in weather: return self.weather_check(rain)
            else: return weather

    def dlc_button(self):
        self.manager.current = 'dlc'

    def about_button(self):
        self.manager.current = 'about'

class DlcScreen(Screen):
    def confirm(self):
        json_file = open("datafiles/dlcs.json", 'r+')
        dlc_file = json.load(json_file)

        if self.ids.dlc1.active == True: dlc_file["Historical Track Pack pt1"] = True
        else: dlc_file["Historical Track Pack pt1"] = False
        if self.ids.dlc2.active == True: dlc_file["Super Cars pt1"] = True
        else: dlc_file["Super Cars pt1"] = False
        if self.ids.dlc3.active == True: dlc_file["Racin'USA pt1"] = True
        else: dlc_file["Racin'USA pt1"] = False
        if self.ids.dlc4.active == True: dlc_file["Racin'USA pt2"] = True
        else: dlc_file["Racin'USA pt2"] = False
        if self.ids.dlc5.active == True: dlc_file["Racin'USA pt3"] = True
        else: dlc_file["Racin'USA pt3"] = False
        if self.ids.dlc6.active == True: dlc_file["Monza Pack"] = True
        else: dlc_file["Monza Pack"] = False
        if self.ids.dlc7.active == True: dlc_file["Spa-Franchorchamps Pack"] = True
        else: dlc_file["Spa-Franchorchamps Pack"] = False
        if self.ids.dlc8.active == True: dlc_file["Nurburgring Pack"] = True
        else: dlc_file["Nurburgring Pack"] = False
        if self.ids.dlc9.active == True: dlc_file["Silverstone Pack"] = True
        else: dlc_file["Silverstone Pack"] = False
        if self.ids.dlc10.active == True: dlc_file["Hockenheimring Pack"] = True
        else: dlc_file["Hockenheimring Pack"] = False
        if self.ids.dlc11.active == True: dlc_file["Barcelona-Catalunya"] = True
        else: dlc_file["Barcelona-Catalunya"] = False
        if self.ids.dlc12.active == True: dlc_file["Historical Track Pack pt2"] = True
        else: dlc_file["Historical Track Pack pt2"] = False
        if self.ids.dlc13.active == True: dlc_file["Formula Hitech"] = True
        else: dlc_file["Formula Hitech"] = False
        if self.ids.dlc14.active == True: dlc_file["Adrenaline pack pt1"] = True
        else: dlc_file["Adrenaline pack pt1"] = False
        if self.ids.dlc15.active == True: dlc_file["LeMans"] = True
        else: dlc_file["LeMans"] = False
        if self.ids.dlc16.active == True: dlc_file["Endurance pt1"] = True
        else: dlc_file["Endurance pt1"] = False

        json_file.seek(0)
        json_file.truncate()
        json.dump(dlc_file, json_file, indent=4)
        json_file.close()
        self.manager.current = 'main'

    def exit(self): self.manager.current = 'main'

class AboutScreen(Screen):
    def career(self): webbrowser.open("https://www.racedepartment.com/downloads/for-the-win-career-mode-for-ams-2.63157/")
    def skin(self): webbrowser.open("https://www.racedepartment.com/downloads/fantasy-f1-2026-skinpack.65829/")
    def donate(self): webbrowser.open("https://ko-fi.com/marcosvsantos93")
    def exit(self): self.manager.current = 'main'

class WindowManager(ScreenManager):
    pass

kv = Builder.load_file('datafiles/main.kv')

class MegaRandom_AMS2(App):
    def build(self):
        #self.icon = 'datafiles/images/icon.jpeg'
        return kv

if __name__ == '__main__':
    MegaRandom_AMS2().run()