select m.movie_id,
        m.movie_name,
        s.production_budget,
        s.total_revenue,
        s.total_revenue - s.production_budget as profit
    from movie_table m
    left join sales_table s
    on m.movie_id = s.movie_id
    where s is not null
    order by s.total_revenue desc