use airportdb;

SELECT *
FROM flight
WHERE `from` = (
    SELECT airport_id
    FROM airport_geo
    WHERE name = 'BORG EL ARAB INTL'
)
AND `to` = (
    SELECT airport_id
    FROM airport_geo
    WHERE name = 'LABUAN'
);

SELECT AVG(price) AS average_price_per_seat
FROM booking
WHERE flight_id = 3863;

SELECT DISTINCT a.airlinename
FROM booking b
JOIN flight f ON b.flight_id = f.flight_id
JOIN airline a ON f.airline_id = a.airline_id
WHERE b.passenger_id = 16678;

SELECT COUNT(DISTINCT log_date) AS unsuitable_date_count
FROM weatherdata
WHERE airpressure > 1015 AND humidity >= 98;

SELECT DISTINCT log_date
FROM weatherdata
WHERE airpressure > 1015 AND humidity >= 98;

SELECT a.airlinename, SUM(b.price) AS total_revenue
FROM booking b
JOIN flight f ON b.flight_id = f.flight_id
JOIN airline a ON f.airline_id = a.airline_id
GROUP BY a.airlinename
ORDER BY total_revenue DESC
LIMIT 20;

