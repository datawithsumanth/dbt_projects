Welcome:
Overview of the course

Who is an analytics engineer?
Traditional data teams have data analysts and data engineers
Analytics engineer takes care of the T in ELT
ETL vs ELT -> With new DW memory and compute can be scaled easily so ELT is preferred
as the transaction time is reduced
https://courses.getdbt.com/courses/take/fundamentals/texts/27962300-review

--------------------------------------------------------------------------------------------------------------------------

## Models

Models are select statements which take source data and transform them
dbt takes care dml/ddl. dev focuses on logic
1-1 relation with tables in DB

Modularity:
Instead of building the entire table at once we can break them down into pieces which can be reused to build other tables
Ex: Car parts

Models are denormalized -> ad hoc analytics, does not follow the kimball model

Types of Models:
1. Source - Raw Data
2. Staging - one to one with source with minor tweaks like renaming/casting
3. Intermediate - btw staging and final, built on staging
4. Fact - Things that are occuring/ have occured Ex: events, clicks, votes
5. Dim - Things that don't change often. Person, place or Things

--------------------------------------------------------------------------------------------------------------------------

## Source

Configured in yml file
Advantages
1. Changes need to be made in 1 place
2. Can track lineage

