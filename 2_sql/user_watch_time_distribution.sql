-- Total Watch Time per User
SELECT
   v. "user_id",
    SUM(v."watch_duration_min") AS total_watch_time
FROM
    "View History" v
GROUP BY
    v."user_id"
ORDER BY
    total_watch_time DESC;
