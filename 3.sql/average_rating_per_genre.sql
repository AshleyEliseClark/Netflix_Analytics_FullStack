
SELECT 
    c.genre,
    ROUND(AVG(r.rating)::NUMERIC, 2) AS avg_rating
FROM 
    "Ratings" r
JOIN 
    "Content" c 
    ON r.content_id = c.content_id
GROUP BY 
    c.genre
ORDER BY 
    avg_rating DESC;

