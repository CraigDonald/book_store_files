TRUNCATE TABLE "public"."recipes" RESTART IDENTITY;

INSERT INTO "public"."recipes" ("name", "cooking_time", "rating") VALUES
('Spaghetti', '15', '5'),
('A pie', '10', '4'),
('Salad', '5', '1');