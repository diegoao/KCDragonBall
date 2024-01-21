
# Práctica Fundamentos iOS 

Práctica realizada para el módulo de Fundamentos iOS por Diego Andrades.

**KeepCoding - Profesor Adrian.**

El proyecto trata de una App enfocada en DragonBall con la cual realizamos una conexión a una API y visualizamos sus datos.




## API Reference

#### Obtener todos los items

```http
  https://dragonball.keepcoding.education/api/heros/
```

## Información

La práctica consta de varias pantallas:
| ![Simulador1](https://github.com/diegoao/KCDragonBall/raw/main/KCDragonBall/Recursos%20Graficos/capturas%20app/Simulador1.png) | ![Simulador2](https://github.com/diegoao/KCDragonBall/raw/main/KCDragonBall/Recursos%20Graficos/capturas%20app/Simulador2.png) | ![Simulador3](https://github.com/diegoao/KCDragonBall/raw/main/KCDragonBall/Recursos%20Graficos/capturas%20app/Simulador3.png) | ![Simulador4](https://github.com/diegoao/KCDragonBall/raw/main/KCDragonBall/Recursos%20Graficos/capturas%20app/Simulador4.png) | ![Simulador5](https://github.com/diegoao/KCDragonBall/raw/main/KCDragonBall/Recursos%20Graficos/capturas%20app/Simulador5.png) | ![Simulador6](https://github.com/diegoao/KCDragonBall/raw/main/KCDragonBall/Recursos%20Graficos/capturas%20app/Simulador6.png) |
| --- | --- | --- | --- | --- | --- |
| 1 | 2 | 3 | 4 | 5 | 6 |

```
1. LaunchScreen -> Pantalla de inicio mientras se carga la
App.
```
```
2. Login -> Pantalla en la cual tenemos que logearnos.
Previamente tenemos que crearnos un usuario en la API. Si
obtenemos un error al ingresar el usuario o contraseña nos
saldrá un mensage de error.
```
```
3. Lista de héroes -> Al obtener el token con nuestro usuario
y contraseña accederemos a la lista de héroes donde podremos
ver todos los personajes incluidos en la Api. Al realizar clic
sobre ellos se nos abrirá la pantalla de Detalles.
```
```
4. Detalles -> Podemos ver la foto y una descripción del héroe.
Si este tiene transformaciones se visualizará el "botón" de 
transformaciones que nos llevará al listado de transformaciones
de este personaje.
```
```
5. Lista de transformaciones -> Se muestran todas las
transformaciones del héroe junto a una foto. Al pulsar sobre
ellas se nos abrirá una pantalla en la que podremos ver más
detalles.
```
```
6. Detalles de transformaciones -> Podremos ver en detalle
una foto y una breve descripción de la transformación.
```

## Autor

- [@Diego](https://github.com/diegoao)




