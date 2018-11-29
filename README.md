# Semillas al viento 🌱

## Etapa 1: plantas

* **Es fuerte:** si tolera más de 10 horas de sol al día.
* **Da nuevas semillas:** algo general y algo de cada semilla.
* **Horas de sol que tolera:** se calcula para cada planta.
* **Espacio que ocupa:** se calcula para cada planta.

### Quinoa
### Zapallo
### Soja
### Tomate

## Etapa 2: lo transgénico

Agregar al modelo la soja transgénica, que es similar a la soja que ya teníamos programada excepto por lo siguiente:

* **Da nuevas semillas:** siempre es `falso`, porque las empresas que las comercializan las someten adrede a un proceso de esterilización que les asegura no perder nunca a su clientes.
* **Es fuerte:** super y algo más.

## Etapa 3: parcelas

De cada parcela se conoce:
* Su _ancho_ y su _largo_, medidos en metros. (Para evacuar dudas: sí, van en dos atributos distintos.)
* Cuántas _horas de sol_ recibe por día.
* Los _cultivos_ que tiene, representados por una lista de plantas.

Se pide:
* La _superficie_ de la parcela, calculada por... la multiplicación entre `ancho` y `largo`.
* La _cantidad máxima_ de cultivos que tolera, que se calcula de la siguiente manera: si el `ancho` es mayor que el `largo`, la cuenta es `superficie / 5`; si no `superficie / 3 + largo`.
* Poder _plantar una planta_ que se recibe por parámetro. El efecto que produce es que se agregue a la lista de cultivos. Esto debe arrojar un error si al plantar se supera la cantidad máxima **o bien** si la parcela recibe más horas de sol que la que tolera la planta.

## Etapa 4: asociación de cultivos
