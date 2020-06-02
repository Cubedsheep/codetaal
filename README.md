# codetaal
Deze repository bevat een verzameling scriptjes (in Julia) om tekst om te zetten in verschillende codetalen. Verder bevat ze info over hoe de codetalen werken, hoe ze te ontcijferen of ernaar te vertalen etc.

## Caesar code
Dit is een eenvoudige substitutiecode. Elke letter van het alfabet wordt een aantal letters doorgeschoven. Dit kan gezien worden als bij elke letter in een tekst, een letter "optellen": A is 0 letters opschuiven, B 1 letter, C 2 letters...

Bijvoorbeeld: 'C' + 'E' = 'G'. "hello world" coderen met "C", dus 2 letters opschuiven, geeft "Jgnnq yqtnf!".

## Vigenere code
Dit is een uitbreiding van de Caesar code. In plaats van bij elke letter van de tekst dezelfde sleutelletter op te tellen, wordt er nu een sleutelwoord gebruikt. Stel dat het sleutelwoord 5 letters heeft, dan wordt bij de eerste letter van de tekst de eerste letter van het sleutelwoord opgeteld, bij de tweede letter van de tekst de 2e letter van het sleutelwoord (net zoals bij de 7e, 12e, 17e...) enzovoort.

Bijvoorbeeld: "Hello world" versleutelen met het sleutelwoord "scouts" geeft: "Zgzfh ogtzx!".
