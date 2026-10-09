# MDDB Database Project

A relational database project developed for the MSc Digital Driven Business programme. The project uses movie industry data to investigate factors associated with box-office revenue performance.

## Research Objective

The objective is to structure movie-related data in a relational database and provide SQL queries and Python database encapsulators that support analysis of box-office revenue, profitability, review scores, genres, and other movie characteristics.

## Research Questions

### Main Research Question

What factors determine the box-office revenue performance of a movie?

### Sub-questions

1. **Production budget and profitability:** How does production budget relate to box-office revenue and profitability?
2. **Review scores:** How does review score relate to box-office revenue?
3. **Characteristics of low-performing movies:** Which genres and other movie characteristics are most common among low-performing movies?

## Project Components

### 1. Data Preparation

The project uses movie-related datasets containing information about movies, sales, genres, actors, directors, studios, awards, consumer reviews, and expert reviews.

The data is organized into raw and cleaned datasets to separate source data from processed data.

### 2. Relational Database

PostgreSQL is used to store and query the structured movie data. The database design is documented through an Entity Relationship Diagram (ERD), which represents the entities and their relationships.

The database tables are defined using SQL scripts.

### 3. SQL Queries

Separate SQL files address the three research sub-questions:

- `sql/question_1.sql` — production budget, box-office revenue, and profitability.
- `sql/question_2.sql` — review scores and box-office revenue.
- `sql/question_3.sql` — genres and other characteristics of low-performing movies.

The table-creation script is available in `sql/create_tables_query.sql`.

### 4. Python Database Encapsulators

Jupyter notebooks contain Python database encapsulators for the three research questions. These provide an interface for accessing the database and retrieving query results as Pandas DataFrames for further analysis.

## Project Structure

```text
database project/
├── data/
│   ├── raw/                  # Raw source data (excluded from Git)
│   └── cleaned/              # Cleaned datasets
│
├── erd/                    
│
├── notebooks/
│   ├── db_interaction.ipynb
│   ├── movie_genre_reviews_tables.ipynb
│   ├── actors_table.ipynb
│   ├── awards_table.ipynb
│   ├── directors_table.ipynb
│   ├── studios_table.ipynb
│   ├── movie_actor_table.ipynb
│   ├── movie_award_table.ipynb
│   ├── movie_director_table.ipynb
│   ├── movie_studio_table.ipynb
│   ├── sales_table.ipynb
│   ├── research_question_1_encapsulator.ipynb
│   ├── research_question_2_encapsulation.ipynb
│   └── research_question_3_encapsulation.ipynb
│
├── sql/
│   ├── create_tables_query.sql
│   ├── question_1.sql
│   ├── question_2.sql
│   └── question_3.sql
│
├── src/                      
├── .gitignore
└── README.md
```

## Technologies

- **PostgreSQL** — relational database management
- **SQL** — table creation, joins, aggregations, and research queries
- **Python** — database interaction and encapsulation
- **Pandas** — tabular data processing and DataFrames
- **Jupyter Notebook** — development and testing
- **Git and GitHub** — version control and project hosting

## Repository Data Policy

The `data/raw/` directory is excluded from Git to avoid committing large source datasets. The cleaned datasets and project code are maintained in the repository where appropriate.

## Purpose

This project demonstrates the application of relational database design, SQL querying, and Python database encapsulation to a business research problem. It provides a structured basis for investigating factors associated with movie box-office performance.

## Acknowledgements

This project was completed collaboratively as part of the MSc Digital Driven Business programme.

I would like to acknowledge my project teammates for their contributions to the research and development work:

- Emma Hoghová 
- Bernadine Marcella Kristi Habsari
- Fred Osazuwa Oboh