# MDDB Database Project

Database project for the MSc Digital Driven Business programme.

## Project Overview

This project investigates the determinants of movie sales (box office performance).

The project uses movie, sales, consumer review, and expert critic data to investigate how different characteristics of movies and their reviews may relate to box office performance.

The database is designed around the project's research questions and hypotheses and provides a structured foundation for further data analysis.

## Research Question



## Research Sub-questions


## Hypotheses

The project develops hypotheses based on relevant theories concerning movie characteristics, consumer reviews, expert reviews, and movie performance.

The database and ERD are designed to support the testing of these hypotheses.

## Database

The database is implemented using PostgreSQL.

The database contains structured tables representing entities and relationships derived from the supplied movie, sales, review, actor, director, studio, genre, and award data.

The ERD defines the relationships between these entities and provides the basis for the database implementation.

## Database Encapsulator

A Python database encapsulator is used to hide the complexity of the underlying database from future analysis.

The encapsulator:

- Establishes a connection to PostgreSQL.
- Executes SQL queries.
- Handles database interactions.
- Returns query results as Pandas DataFrames.
- Provides a simpler interface for future data analysis.

## Project Structure

```text
database project/
├── data/
│   ├── raw/              # Raw source data (not tracked by Git)
│   └── cleaned/          # Cleaned and processed datasets
│
├── erd/
│   ├── movie_erd.pgerd
│   └── movie_erd.pgerd.png
│
├── notebooks/
│   ├── db_interaction.ipynb
│   └── movie_genre_reviews_tables.ipynb
│
├── sql/
│   └── create_tables_query.sql
│
├── src/
│
├── .gitignore
└── README.md