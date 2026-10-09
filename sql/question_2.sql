SELECT
            mt.movie_id,
            mt.movie_name,

            COALESCE(
                sat.total_revenue,
                (SELECT AVG(total_revenue)
                 FROM sales_table
                 WHERE total_revenue IS NOT NULL)
            ) AS total_revenue,

            COALESCE(
                sat.production_budget,
                (SELECT AVG(production_budget)
                 FROM sales_table
                 WHERE production_budget IS NOT NULL)
            ) AS production_budget,

            ur.avg_user_score,
            er.avg_expert_score

        FROM movie_table mt

        LEFT JOIN sales_table sat
            ON mt.movie_id = sat.movie_id

        LEFT JOIN (
            SELECT
                movie_id,
                AVG(indv_score) AS avg_user_score
            FROM user_reviews_table
            GROUP BY movie_id
        ) ur
            ON mt.movie_id = ur.movie_id

        LEFT JOIN (
            SELECT
                movie_id,
                AVG(score) AS avg_expert_score
            FROM expert_reviews_table
            GROUP BY movie_id
        ) er
            ON mt.movie_id = er.movie_id

        WHERE ur.avg_user_score IS NOT NULL
          AND er.avg_expert_score IS NOT NULL

        ORDER BY total_revenue DESC;