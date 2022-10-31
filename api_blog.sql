CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "comments" varchar
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "content" varchar
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "comment" varchar,
  "user_id" int NOT NULL
);

CREATE TABLE "comment_in_posts" (
  "id" SERIAL PRIMARY KEY,
  "comment_id" int NOT NULL,
  "post_id" int NOT NULL
);

ALTER TABLE "comment_in_posts" ADD FOREIGN KEY ("comment_id") REFERENCES "comments" ("id");

ALTER TABLE "comment_in_posts" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

insert into "users" ("name", "email", "password", "comments") values ('Jose', 'jose@email.com', '1234', 'The first comment');

insert into "users" ("name", "email", "password", "comments") values ('Jesus', 'jesus@email.com', '4321', 'The second comment');

insert into "posts" ("title", "content") values ('Primer post', 'Este es el primer post');

insert into "posts" ("title", "content") values ('Segundo post', 'Este es el segundo post');

insert into "comments" ("comment", "user_id") values ('Este es el primer comentario en el primer post', 1), ('Este es el segundo comentario en el primer post', 2);

insert into "comments" ("comment", "user_id") values ('Este es el primer comentario en el segundo post', 1), ('Este es el segundo comentario en el segundo post', 2);

insert into "comment_in_posts" ("comment_id", "post_id") values (1, 1), (2, 1), (2, 1), (2, 2);