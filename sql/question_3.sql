SELECT
        genre_table.genre,
        AVG(sales_table.profit) AS average_profit
    FROM sales_table
    JOIN (
        SELECT
            genre_table_movie_table.movie_id,
            genre_table.genre
        FROM genre_table_movie_table
        JOIN genre_table
            ON genre_table_movie_table.genre_id = genre_table.genre_id
    ) AS genre_table
        ON sales_table.movie_id = genre_table.movie_id
    WHERE sales_table.total_revenue IS NOT NULL
      AND sales_table.production_budget IS NOT NULL
      AND sales_table.profit IS NOT NULL
    GROUP BY genre_table.genre
    ORDER BY average_profit ASC;