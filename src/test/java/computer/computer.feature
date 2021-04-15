@computer
Feature: Manejo de PCs en DB

Background:
  * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe' }
@pc
Scenario: tratar de dar de alta una nueva PC en la DB

  Given driver baseUrl + '/computers'
  Then waitForUrl(baseUrl + '/computers')
  And waitFor("#add")
  When submit().click("#add")
  Then waitForUrl(baseUrl + '/computers/new')
  Then waitFor('/html/body/section/form/div/input')
  And input('#name','mipcChristian')
  And input('#introduced','2021-04-14')
  And input('#discontinued','2021-04-15')
  And select('#company',1)
  When submit().click("/html/body/section/form/div/input")
  Then match text('/html/body/section/div[1]') contains 'has been created'

@pcoutline
Scenario Outline: tratar de dar de alta varias nuevas PCs en la DB

  * def nombre = <Nombre>
  Given driver baseUrl + '/computers'
  Then waitForUrl(baseUrl + '/computers')
  And waitFor("#add")
  When submit().click("#add")
  Then waitForUrl(baseUrl + '/computers/new')
  Then waitFor('/html/body/section/form/div/input')
  And input('#name', <Nombre>)
  And input('#introduced','2021-04-14')
  And input('#discontinued','2021-04-15')
  And select('#company',1)
  When submit().click("/html/body/section/form/div/input")
  Then match text('/html/body/section/div[1]') contains 'has been created'
  
  Examples:
  |Nombre |
  |'MyPc' |
  |'Pc1'  |
  |'Pc2'  |

@pokemonoutline
Scenario Outline: Crear un entrenador en PokemonApp

  * def nombre = <Nombre>
  * def apellido = <Apellido>
  * def usuario = <User>
  * def pass = <Pwd>
  * def fecNac = <FecN>
  Given driver pokeUrl
  Then waitForUrl(pokeUrl)
  And waitFor(pokeRegistroBtn)
  When submit().click(pokeRegistroBtn)
  Then waitForUrl(pokeUrl + '/Entrenador/Registro')
  Then waitFor(pokeRegSubmit)
  And input(pokeUserInput, <User>)
  And input(pokePwdInput, <Pwd>)
  And input(pokeNomInput, <Nombre>)
  And input(pokeApeInput, <Apellido>)
  And input(pokeNacInput, <FecN>)
  And select(pokePuebSelect, 1)
  When submit().click(pokeRegSubmit)
  Then waitForUrl(pokeUrl + '/Entrenador/Login')
  And input(pokeUserInput, <User>)
  And input(pokePwdInput, <Pwd>)
  When submit().click('/html/body/div/main/div/div/form/div[3]/button')
  Then waitForUrl(pokeUrl + '/Entrenador')
  Then match text('/html/body/div/main/div/div/h1') contains 'Bienvenid'

  Examples:
  |Nombre       |Apellido   |User         |Pwd            |FecN     |
  |'Axcel'      |'Carpio'   |'generico10'  |'Servidores5!' |01022000 |
  |'Christian'  |'Carpio'   |'generico11'  |'Servidores5!' |23121997 |
  |'Maria'      |'Jimenez'  |'generico12'  |'Servidores5!' |01021995 |