## Задания (часть 1)

### 1. Вывести всю информацию из таблицы ticket_flights
SELECT* 
FROM ticket_flights;

### 2. Вывести номера билетов и их стоимость из таблицы ticket_flights, где класс бронирования Business
SELECT
ticket_no,
amount
FROM ticket_flights
WHERE
fare_conditions = 'Business';

### 3. Вывести коды аэропортов, которые находятся во временной зоне Europe/Moscow
SELECT 
airport_code
FROM airports_data
WHERE 
timezone = 'Europe/Moscow';

### 4. Вывести всю информацию из таблицы flights, где номер полета является «PG0216»
SELECT*
FROM flights
WHERE 
flight_no = 'PG0216';

### 5. Вывести из таблицы flights все рейсы из Домодедово в Пулково
SELECT*
FROM flights 
WHERE 
departure_airport = 'DME' and arrival_airport = 'LED';

### 6. Вывести из таблицы flights рейсы, вылет которых был запланирован в интервале с 10 февраля 2017 по 10 апреля 2017
SELECT DISTINCT 
flight_no 
FROM flights
WHERE 
scheduled_departure between '2017-02-10' and '2017-04-10';

### 7. Вывести названия моделей самолётов на английском языке, дальность полета которых менее 5000 км
SELECT
model ->>'en' AS model_en
FROM aircrafts_data
WHERE range < 5000;

### 8. Вывести всю информацию из таблицы tickets, отсортированную по колонке passenger_name в обратном порядке и ограничением выборки в 100 записей
SELECT*
FROM 
tickets
ORDER BY 
passenger_name DESC
LIMIT 100;

### 9. Вывести из таблицы tickets поля ticket_no и passenger_name, где имя пассажира VIKTORIYA SMIRNOVA
SELECT ticket_no, passenger_name
FROM tickets
WHERE passenger_name = 'VIKTORIYA SMIRNOVA';

### 10. Вывести из таблицы tickets идентификаторы, имена и фамилии всех пассажиров, фамилии которых заканчиваются на «NOV» или «OVA», отсортировав их сначала по номеру билета, а затем по имени пассажира в обратном порядке
SELECT 
passenger_id, 
passenger_name 
FROM tickets
WHERE 
passenger_name LIKE '%NOV' OR passenger_name LIKE '%OVA' 
ORDER BY 
ticket_no, 
passenger_name DESC;
  
  
## Задания (часть 2)
  
### 1. Подсчитать общее количество самолетов в таблице aircrafts_data
SELECT COUNT(*) AS total_aircrafts 
FROM aircrafts_data;
  
### 2. Вычислить среднюю дальность полета самолетов
SELECT avg(range) AS average_flight_range 
FROM aircrafts_data;

### 3. Найти максимальную дальность полета среди всех самолетов
SELECT max(range) AS max_flight_range
FROM aircrafts_data;

### 4. Подсчитать общее количество аэропортов в таблице airports_data
SELECT count(airport_name) AS total_airports
FROM airports_data;

### 5. Вычислить среднюю, медиану и моду стоимости бронирования
SELECT 
AVG(total_amount) AS average_cost,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_amount) AS median_cost,
MODE() WITHIN GROUP (ORDER BY total_amount) AS mode_cost
FROM bookings;

### 6. Найти первые пять самых дорогих бронирований
SELECT*
FROM bookings
ORDER BY total_amount DESC
LIMIT 5;

### 7. Подсчитать общее количество посадочных талонов
SELECT COUNT(*) AS total_boarding_passes
FROM boarding_passes; 

### 8. Вычислить суммарную стоимость всех билетов класса комфорт
SELECT SUM(amount) AS total_comfort_ticket_cost
FROM ticket_flights
WHERE fare_conditions = 'Comfort'; 

### 9. Найти первый и последний рейсы
SELECT *
FROM flights
WHERE scheduled_departure IN (SELECT MIN(scheduled_departure) FROM flights
UNION ALL SELECT MAX(scheduled_departure) FROM flights);

### 10. Найти среднюю стоимость билетов по классам обслуживания
SELECT 
fare_conditions,
AVG(amount) AS average_ticket_cost
FROM 
ticket_flights
GROUP BY 
fare_conditions; 

	
