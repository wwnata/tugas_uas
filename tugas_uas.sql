CREATE DATABASE tugas_uas;

USE tugas_uas;

#Membuat tabel users dan memasukkan data
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    role ENUM('Admin', 'User')
);

INSERT INTO users (username, password, role) VALUES
('Sandi', 'saringgan', 'Admin'),
('Openg', 'rinegan', 'User'),
('kiting', 'rasenggan', 'User');

#Membuat tabel profiles dan memasukkan data
CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    birthdate DATE,
    bio VARCHAR(500),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO profiles (user_id, full_name, birthdate, bio) VALUES
(1, 'Sandi Winata', '2005-03-31', 'Bergerak dan ciptakan motivasi.'),
(2, 'Openg Tempest', '2004-03-31', 'Raja Iblis.'),
(3, 'Uciha Kiting', '2003-03-31', 'Saya wibu dan saya bangga.');

#Membuat tabel posts dan memasukkan data
CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO posts (user_id, title, content) VALUES
(1, 'Kata-kata hari ini', 'Hidup setiap hari mati hanya sekali.'),
(2, 'Info hari ini', 'hujan deras di Jura-Tempest.'),
(3, 'Jadwal Boruto', 'Minggu ini tidak tayang.');

#Membuat tabel comments dan memasukkan data
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text VARCHAR(1000),
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO comments (post_id, user_id, comment_text) VALUES
(1, 3, 'kata kata yang keren.'),
(2, 1, 'terima kasih infonya.'),
(3, 2, 'wah sayang sekali.');

#Menampilkan data dari tabel users dan profiles
SELECT u.username, p.full_name, p.bio
FROM users u
JOIN profiles p ON u.id = p.user_id;

#Menampilkan data dari tabel posts dan comments
SELECT p.title, p.content, c.comment_text
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id;