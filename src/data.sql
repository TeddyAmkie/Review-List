CREATE TABLE users (
  id serial PRIMARY KEY,
  username TEXT NOT NULL UNIQUE
);

CREATE TABLE review_list (
  id serial PRIMARY KEY,
  owner INTEGER NOT NULL REFERENCES users ON DELETE SET NULL,
  title TEXT,
  description TEXT
);

CREATE TABLE users_review_lists (
  id serial PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
  review_list INTEGER NOT NULL REFERENCES review_list ON DELETE CASCADE,
  admin boolean DEFAULT false
);

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  review_list INTEGER NOT NULL REFERENCES review_list ON DELETE CASCADE,
  reviewer INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
  reviewee TEXT NOT NULL,
  score INTEGER,
  review TEXT
);

--------                Seed data                -------- 


---       users       ---

INSERT INTO users (username)
VALUES ('testuser1');

INSERT INTO users (username)
VALUES ('testuser2');

INSERT INTO users (username)
VALUES ('testuser3');

INSERT INTO users (username)
VALUES ('testuser4');

INSERT INTO users (username)
VALUES ('testuser5');

---       review_list       ---

INSERT INTO review_list(owner,title,description)
VALUES ('1', 'Test whitelist 1', 'This is a test for a whitelist');

INSERT INTO review_list(owner,title,description)
VALUES ('1', 'Test blacklist 1', 'This is a test for a blacklist');

INSERT INTO review_list(owner,title,description)
VALUES ('1', 'Test mixed list', 'This is a test for a mixed white and black list.');

INSERT INTO review_list(owner,title,description)
VALUES ('2', 'Test review list owned by user 2', 'This is a test for a second user creating a list');

---       users_review_lists       ---

INSERT INTO users_review_lists(user_id, review_list)
VALUES ('2', '1');

INSERT INTO users_review_lists(user_id, review_list)
VALUES ('2', '2');

INSERT INTO users_review_lists(user_id, review_list)
VALUES ('1', '4');

---       reviews       ---

INSERT INTO reviews(review_list, reviewer, reviewee, score, review)
VALUES (
  '1',
  '1',
  'test_reviewed_user',
  '20',
  'This is a great user.'
);

INSERT INTO reviews(review_list, reviewer, reviewee, score, review)
VALUES (
  '1',
  '1',
  'test_reviewed_user',
  '-45',
  'This is a horrible user.'
);

INSERT INTO reviews(review_list, reviewer, reviewee, score, review)
VALUES (
  '1',
  '2',
  'test_reviewed_user',
  '10',
  'This is an ok user.'
);
