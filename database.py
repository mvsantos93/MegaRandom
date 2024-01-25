import random

null = ['datafiles/images/class_null.png']

classes = ['datafiles/images/class01.png', 'datafiles/images/class02.png', 'datafiles/images/class03.png', 'datafiles/images/class04.png', 'datafiles/images/class05.png',
           'datafiles/images/class06.png', 'datafiles/images/class07.png', 'datafiles/images/class08.png', 'datafiles/images/class09.png', 'datafiles/images/class10.png', 'datafiles/images/class11.png', 
           'datafiles/images/class12.png', 'datafiles/images/class13.png', 'datafiles/images/class14.png', 'datafiles/images/class15.png', 'datafiles/images/class16.png', 'datafiles/images/class17.png', 
           'datafiles/images/class18.png', 'datafiles/images/class19.png', 'datafiles/images/class20.png', 'datafiles/images/class21.png', 'datafiles/images/class22.png', 'datafiles/images/class23.png', 
           'datafiles/images/class24.png', 'datafiles/images/class25.png', 'datafiles/images/class26.png', 'datafiles/images/class27.png', 'datafiles/images/class28.png', 'datafiles/images/class29.png', 
           'datafiles/images/class30.png', 'datafiles/images/class31.png', 'datafiles/images/class32.png', 'datafiles/images/class33.png', 'datafiles/images/class34.png', 'datafiles/images/class35.png', 
           'datafiles/images/class36.png', 'datafiles/images/class37.png', 'datafiles/images/class38.png', 'datafiles/images/class39.png', 'datafiles/images/class40.png', 'datafiles/images/class41.png', 
           'datafiles/images/class42.png', 'datafiles/images/class43.png', 'datafiles/images/class44.png', 'datafiles/images/class45.png', 'datafiles/images/class46.png', 'datafiles/images/class47.png', 
           'datafiles/images/class48.png', 'datafiles/images/class49.png', 'datafiles/images/class50.png', 'datafiles/images/class51.png', 'datafiles/images/class52.png', 'datafiles/images/class53.png', 
           'datafiles/images/class54.png', 'datafiles/images/class55.png', 'datafiles/images/class56.png', 'datafiles/images/class57.png', 'datafiles/images/class58.png', 'datafiles/images/class59.png', 
           'datafiles/images/class60.png', 'datafiles/images/class61.png', 'datafiles/images/class62.png', 'datafiles/images/class63.png', 'datafiles/images/class64.png', 'datafiles/images/class65.png', 
           'datafiles/images/class66.png', 'datafiles/images/class67.png', 'datafiles/images/class68.png', 'datafiles/images/class69.png', 'datafiles/images/class70.png', 'datafiles/images/class71.png', 
           'datafiles/images/class72.png', 'datafiles/images/class73.png', 'datafiles/images/class74.png', 'datafiles/images/class75.png']

kart_classes = ['datafiles/images/classk1.png', 'datafiles/images/classk2.png', 'datafiles/images/classk3.png', 'datafiles/images/classk4.png']

rx_classes = ['datafiles/images/classrx1.png', 'datafiles/images/classrx2.png', 'datafiles/images/classrx3.png']

tracks = ['Adelaide', 'Adelaide Historic 1988', 'Azure Circuit', 'Barcelona GP (no chicane)', 'Barcelona GP', 'Barcelona GP National', 'Bathurst 2020', 'Brands Hatch', 'Brands Hatch Indy', 'Brasilia Full',
          'Brasilia Outer', 'Buenos Aires no.6 S', 'Buenos Aires no.6', 'Buenos Aires no.7', 'Buenos Aires no.8', 'Buenos Aires no.9', 'Buenos Aires no.12', 'Buenos Aires no.15', 'Cadwell Park', 'Campo Grande',
          'Cascais', 'Cascais Alternate', 'Cascavel', 'Cleveland GP', 'Curitiba', 'Curitiba Outer', 'Curvelo Long', 'Curvelo Short', 'Cordoba no.4', 'Cordoba TC', 'Cordoba no.2', 'Daytona Sports Car Course',
          'Daytona Nascar Road Course', 'Daytona Nascar Tri-Oval', 'Donington GP', 'Donington National', 'Fontana Speedway Oval', 'Fontana Sports Car Course', 'Galeao Airport', 'Gateway Raceway Oval',
          'Gateway Road Course (short)', 'Gateway Road Course (long)', 'Goiania', 'Goiania short', 'Goiania External', 'Guapore', 'Hockeinheim', 'Hockeinheim National', 'Hockeinheim Short A',
          'Hockeinheim Short B', 'Hockeinheim Historic 2001', 'Hockeinheim Historic 1988', "24 Heures du Mans", 'Hockeinheim Historic 1988 (short)', 'Hockeinheim Historic 1977', 'Ibarra Yahuarcocha',
          'Ibarra Yahuarcocha Reverse', 'Imola', 'Imola Historic 2001', 'Imola Historic 1988', 'Imola Historic 1972', 'Indianapolis Road Course', 'Indianapolis Oval', 'Interlagos GP', 'Interlagos Historic 1976',
          'Interlagos Historic 1978 Outer', 'Jacarepagua Historic 2005', 'Jacarepagua 1988', 'Jacarepagua Historic 2005 Oval', 'Jacarepagua Historic 2012 SCB', 'Jacarepagua Historic 2012 (short)',
          'Jerez Moto', 'Jerez Chicane', 'Kansai GP', 'Kansai West', 'Kansai Eest', 'Kansai Classic', 'Kyalami', 'Kyalami Historic 1976', 'Laguna Seca 2020', 'Londrina Short', 'Londrina Long', 'Long Beach',
          'Montreal', 'Montreal Historic 1988', 'Monza', 'Monza Junior', 'Monza Historic 1991', 'Monza Historic 1971', 'Monza 1971 Junior', 'Monza 1971 10k', 'Monza 1971 10k (no chicane)', 'Nordscheleife 2020',
          'Nordschleife 24h 2020', 'Nurburgring GP 2020', 'Nurburgring Veedol 2020', 'Nurburgring Sprint 2020', 'Nurburgring Sprint S 2020', 'Gesamtstrecke Historic 1971', 'Nordschleife Historic 1971',
          'Sudschelife Historic 1971', 'Oulton Park International', 'Oulton Park Island', 'Oulton Park Fosters', 'Oulton Park Classic', 'Road America', 'Road America (bend)', 'Salvador Street Circuit',
          'Santa Cruz do Sul', 'Silverstone', 'Silverstone International', 'Silverstone National', 'Silverstone Historic 2001', 'Silverstone Historic 2001', 'Silverstone International Historic 2001',
          'Silverstone National Historic 2001', 'Silverstone Historic 1991', 'Silverstone Historic 1975', 'Silverstone Historic 1975 (no chicane)', 'Snetterton 300', 'Snetterton 200', 'Snetterton 100',
          'Spa-Franchorchamps 2022', 'Spa-Franchorchamps 2020', 'Spa-Franchorchamps 1993', 'Spa-Franchorchamps 1970', 'Spa-Franchorchamps 1970 1000km', 'Spielberg', 'Spielberg short', 'Spielberg Historic 1974',
          'Spielberg Historic 1977', "Le Mans Bugatti", 'Taruma International', 'Taruma Chicane', 'Termas de Rio Hondo', 'Velo Citta', 'Velo Citta Track Day', 'Velo Citta Club Day', 'Velo park 2017',
          'Velopark 2010', 'VIRginia International Full', 'VIRginia International Grand', 'VIRginia International North', 'VIRginia International Patriot', 'Watkins Glen GP', 'Watkins Glen GP (inner loop)',
          'Watkins Glen short', 'Watkins Glen short (inner loop)']

kart_tracks = ['Buskerud Kart Long', 'Buskerud Kart Short', 'Granja Vianna Stage 2', 'Granja Viana Kart 101', 'Granja Viana Kart 102', 'Granja Viana Kart 121', 'Interlagos Kart One', 'Interlagos Kart Two',
               'Interlagos Kart Three', 'Londrina Kart One', 'Londrina Kart Two', 'Ortona Kart One', 'Ortona Kart Two', 'Ortona Kart Three', 'Ortona Kart Four', 'Speedland Kart 1', 'Speedland Kart 2',
               'Speedland Kart 3', 'Speedland Kart 4']

rx_tracks = ["Ascurra RX", "Tikki RX", "Foz", "Barcelona RX", "Hockenheim Rallycross", "Spa RX", "Nurburgring RX", "Ascurra Dirt", "Tikki Tarmac", "Foz", "Tikki Dirt 2", "Spa RX"]

weather = ['datafiles/images/weather_null.png', 'datafiles/images/weather00.png', 'datafiles/images/weather01.png', 'datafiles/images/weather02.png', 'datafiles/images/weather03.png', 
           'datafiles/images/weather04.png', 'datafiles/images/weather05.png', 'datafiles/images/weather06.png', 'datafiles/images/weather07.png', 'datafiles/images/weather08.png', 
           'datafiles/images/weather09.png', 'datafiles/images/weather10.png', 'datafiles/images/weather11.png', 'datafiles/images/weather12.png', 'datafiles/images/weather13.png', 
           'datafiles/images/weather14.png']