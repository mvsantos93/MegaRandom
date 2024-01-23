import random

classes = ['datafiles/images/class_null.png','datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png',
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 
           'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png', 'datafiles/images/class00.png']

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

rx_tracks = [
        "Ascurra RX", "Tikki RX", "Foz", "Barcelona RX", "Hockenheim Rallycross", "Spa RX", "Nurburgring RX", "Ascurra Dirt", "Tikki Tarmac", "Foz", "Tikki Dirt 2", "Spa RX"]

weather = []