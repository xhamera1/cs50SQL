CREATE VIEW frequently_reviewed AS
SELECT listings.id, listings.property_type, listings.host_name, COUNT(reviews.id) AS reviews
FROM listings
JOIN reviews on listings.id=reviews.listing_id
GROUP BY reviews.listing_id
ORDER BY COUNT(reviews.id) DESC, listings.property_type ASC, listings.host_name ASC
LIMIT 100;
