# 🌱 Semillas al viento 🌱

<img src="images/huerta.jpg" width="500px" />

A raíz de la [polémica](https://www.elancasti.com.ar/opinion/2018/11/27/ley-cuestionada-389812.html) reciente sobre la posibilidad de que se modifique la [Ley de semillas y creaciones fitogenéticas, Nº 20.247](http://servicios.infoleg.gob.ar/infolegInternet/anexos/30000-34999/34822/texact.htm), una organización de pequeños productores nos pidió crear una aplicación para poder medir mejor el desempeño de sus huertas.

## 1. Plantas

Comenzaremos modelando a cada una de las plantas que hay en la huerta, de las cuales necesitamos trabajar los siguientes aspectos:

* el **año de cosecha** de la semilla. Es decir, en qué año la semilla que le dio origen se sacó de su planta "madre";
* la **altura** que tiene, medida en metros;
* cuántas **horas de sol tolera**;
* si **es fuerte** o no;
* si **da nuevas semillas** o no;
* cuánto **espacio** ocupa una vez plantada.

De todos ellos, el año de cosecha y la altura se configuran para cada planta; el resto se calcula en función de la especia y de características generales.

Se dice que una planta **es fuerte** si tolera más de 10 horas de sol al día; el cálculo de las **horas de sol que tolera** depende exclusivamente de cada especie (ver más abajo).

Otro aspecto que nos interesa es saber si **da nuevas semillas**, para lo cual se tiene que cumplir que la planta sea fuerte _o bien_ un aspecto adicional, que define cada especie. En cuanto al **espacio que ocupa**, depende pura y exclusivamente de características de la especie.

Contemplaremos las especies que se detallan a continuación.

### Menta
Tolera seis horas de sol al día. Como condición adicional para saber si da semillas, hay que mirar si su `altura` es mayor a 4 metros. Como crece al ras del suelo, diremos que el espacio que ocupa es su altura multiplicada por 3.

### Soja
La tolerancia al sol depende de su altura:
* menor a 0.5 metros: 6 horas;
* entre 0.5 y 1 metro: 7 horas;
* más de 1 metro: 9 horas;

La condición adicional para que de semillas es que sea de cosecha reciente (posterior al 2007) y además mida más de 1 metro. El espacio que ocupa es la mitad de su altura.

### Quinoa
Existen muchas cepas de esta nutritiva planta andina y es por eso que la cantidad de horas de sol que tolera la configuraremos para cada planta. Ocupa siempre 0.5 metros cuadrados y la condición adicional para saber si da semillas es que su año de cosecha sea anterior a 2005.

## 2. Variedades

Agregar al modelo la soja transgénica y la hierbabuena, que son similares a la soja y a la menta respectivamente, pero con algunas diferencias.

La **soja transgénica** nunca da nuevas semillas, porque las empresas que las comercializan las someten adrede a un proceso de esterilización (que les asegura no perder nunca a su clientes). _Ojo_: la consulta siempre tiene que dar falso, incluso si se cumple la condición general.

La **hierbabuena** se diferencia de la menta en que se esparce más rápido y por eso diremos que el espacio que ocupa es el doble del que ocupa la menta.

## 3. Parcelas

De cada parcela se conoce:
* Su _ancho_ y su _largo_, medidos en metros. (Para evacuar dudas: sí, van en dos atributos distintos.)
* Cuántas _horas de sol_ recibe por día.
* Los _cultivos_ que tiene, representados por una lista de plantas.

Se pide:
* La _superficie_ de la parcela, calculada por... la multiplicación entre `ancho` y `largo`.
* La _cantidad máxima_ de cultivos que tolera, que se calcula de la siguiente manera: si el `ancho` es mayor que el `largo`, la cuenta es `superficie / 5`; si no `superficie / 3 + largo`.
* Saber si algún cultivo **está complicado**, lo cual es así si la parcela recibe más sol del que la planta tolera.
* Poder _plantar una planta_ que se recibe por parámetro. El efecto que produce es que se agregue a la lista de cultivos. Esto debe arrojar un error si al plantar se supera la cantidad máxima _o bien_ si la parcela recibe al menos 2 horas más de sol que los que la planta tolera.


## 4. Asociación de cultivos
