# TRABAJO FINAL DE BASES DE DATOS 2
En un call center de una empresa de telecomunicaciones se atienden los reclamos de sus clientes y prospectos (cuando aún no son clientes y llaman por una consulta o tienen asociada una oportunidad de venta).
Se guardan los siguientes datos de los clientes:
- Nombre y Apellido
- Tipo y número de documento
- e-mail (no se requiere para prospectos). Debe ser un mail válido
- fecha de nacimiento (No se requiere para prospectos). La edad debe ser mayor a 18 años
Se mantiene además un estado que toma los valores de acuerdo con las siguientes reglas:
- Activo: si tiene algún servicio vigente
- Inactivo: si alguna vez fue cliente y no posee servicios actualmente
- Prospecto: si nunca fue cliente y llamó por alguna consulta).
Por cada uno de los servicios brindados (Telefonía fija, Internet y VOIP) se guardan los siguientes datos:
- Número de Servicio
- Teléfono (en el caso que no sea Internet)
- Dirección (calle, número, piso y depto)
- fecha de inicio del servicio
- estado (Activo e Inactivo)
Los tickets se pueden asociar a:
- Un servicio de un cliente existente o
- Un cliente por una consulta o queja no asociada directamente a un servicio de este o
- Una persona la cual es un prospecto. Puede ser que exista en la base de datos o que no. En
el caso que no exista se debe crear con el tipo ‘Prospecto’
A los tickets se les asocia una tipología la cual indica parámetros tales como el SLA asociado (tiempo dentro del cual debe ser resuelto). Cada servicio posee distintas tipologías posibles. También se tiene un conjunto de tipologías disponibles cuando no se asocia ningún producto al ticket.
El ticket posee además un estado (Abierto, En Progreso, Pendiente Cliente, Resuelto y Cerrado) con las siguientes transiciones posibles
Se debe grabar asociado al ticket la fecha de resolución (última vez que pasa a Resuelto). Se desea saber qué tickets cumplieron con el SLA y cuáles no.
Se crean actividades para reglejar los pasos de resolución de los tickets
Se debe poder calcular el tiempo de resolución de acuerdo con las siguientes reglas:
- El tiempo de resolución se calcula desde que el mismo es abierto hasta que llega a resuelto.
- Se le debe descontar el tiempo que se encuentra Pendiente Cliente.
Un cliente está activo cuando tiene al menos un servicio activo.
Cuando se cambia el estado de un ticket se deben generar registros en una tabla de mensajes que es tomada por un software que envía automáticamente los e-mails al cliente notificando el cambio.
Consignas que debe cumplir el trabajo práctico
1. Armar el modelo relacional de la base de datos
2. Definir todas las tablas participantes del mismo. Enriquecer el modelo de datos si fuera
necesario
3. Normalizar todo el modelo a tercera forma normal
4. Definir las relaciones de integridad entre las tablas para que el modelo sea consistente
5. Definir la lista de store procedures / funciones / triggers que se necesitaría para
implementar toda la solución de acuerdo con las mejores prácticas. Definir nombres de las
mismas, parámetros recibidos y valores devueltos
6. Cargar el modelo creado con datos que permitan ver su correcto funcionamiento para
cada una de las tablas intervinientes en el mismo. Se debe entregar un script que cree el modelo automáticamente desde la creación de la base en adelante (DDL), otro que cargue los datos iniciales (DML) y para finalizar uno que muestre las distintas operaciones que reflejen las necesidades de negocio
7. Crear como mínimo tres stored procedures y dos funciones que representen a las funcionalidades más importantes.
8. Implementar al menos un trigger
9. Implementar al menos una transacción
10. Crear como mínimo tres vistas para acceder a los datos de la base de datos de manera protegida y resguardada ocultando información que sea sensible.