CREATE DATABASE TASK2

CREATE TABLE MOVIE (
mov_id int primary key ,
mov_title varchar(50),
mov_year int ,
mov_time int ,
mov_lang varchar(50) ,
mov_dt_rel date ,
mov_rel_country varchar(5)
)

CREATE TABLE ACTOR (
act_id int primary key ,
act_fname varchar(20) ,
act_lname varchar(20) ,
act_gender varchar(1) 
)
CREATE TABLE director (
dir_id int primary key ,
act_fname varchar(20) ,
act_lname varchar(20) ,
)
CREATE TABLE reviewer (
rev_id int primary key ,
rev_name varchar(20) ,
)
CREATE TABLE genres (
gen_id int primary key ,
gen_title varchar(20) ,
)
----------------------------------------------------------------------------------------
CREATE TABLE rating (
mov_id int CONSTRAINT fk_rating_movie FOREIGN  KEY (mov_id) REFERENCES MOVIE (mov_id) ,
rev_id int CONSTRAINT fk_reviewer FOREIGN  KEY (rev_id) REFERENCES reviewer (rev_id) ,
rev_stars int ,
num_of_rating int ,
)

CREATE TABLE movie_director (
 dir_id int CONSTRAINT fk_director FOREIGN  KEY (dir_id) REFERENCES director (dir_id) ,
 mov_id int CONSTRAINT fk_movie FOREIGN  KEY (mov_id) REFERENCES MOVIE (mov_id)
)
CREATE TABLE movie_genres (
gen_id int CONSTRAINT fk_genres FOREIGN  KEY (gen_id) REFERENCES genres (gen_id) ,
mov_id int CONSTRAINT fk_genres_movie FOREIGN  KEY (mov_id) REFERENCES MOVIE (mov_id)
)
CREATE TABLE movie_cast (
act_id int CONSTRAINT fk_act FOREIGN  KEY (act_id) REFERENCES ACTOR (act_id) ,
mov_id int CONSTRAINT fk_cast_movie FOREIGN  KEY (mov_id) REFERENCES MOVIE (mov_id)  ,
role varchar(30) 
)
