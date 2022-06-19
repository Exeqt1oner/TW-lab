-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 19 2022 г., 13:28
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kill_bill`
--

-- --------------------------------------------------------

--
-- Структура таблицы `arme`
--

CREATE TABLE `arme` (
  `id` int(11) NOT NULL,
  `nume_arme` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `arme`
--

INSERT INTO `arme` (`id`, `nume_arme`) VALUES
(1, 'pistol'),
(2, 'pusca automata'),
(3, 'pușca de vânătoare'),
(4, 'katana'),
(5, 'alta arma');

-- --------------------------------------------------------

--
-- Структура таблицы `atacator`
--

CREATE TABLE `atacator` (
  `id` int(11) NOT NULL,
  `nume` char(20) NOT NULL,
  `caracter` text NOT NULL,
  `viata` int(11) NOT NULL,
  `arma` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `atacator`
--

INSERT INTO `atacator` (`id`, `nume`, `caracter`, `viata`, `arma`) VALUES
(26, 'Beatrix Kiddo', 'agresiv', 100, 'katana'),
(32, 'Budd', 'neutru', 100, 'pusca automata'),
(30, 'Ellie Driver', 'agresiv', 100, 'pistol'),
(27, 'gogo yubari', 'agresiv', 80, 'alta arma'),
(28, 'O-Ren Ishii', 'agresiv', 90, 'katana'),
(29, 'Pei Mei', 'pasiv', 200, 'alta arma'),
(31, 'Vernita Green', 'neutru', 100, 'pistol');

-- --------------------------------------------------------

--
-- Структура таблицы `contact`
--

CREATE TABLE `contact` (
  `id_client` int(11) NOT NULL,
  `nume` varchar(30) NOT NULL,
  `prenume` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `parola` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `contact`
--

INSERT INTO `contact` (`id_client`, `nume`, `prenume`, `email`, `telefon`, `parola`) VALUES
(9, 'Ion', 'adadadadadadadadadadadadadadad', 'fake@gmail.com', '', ''),
(10, 'Alex', 'adsadadadaadsadadadaadsadadada', 'egjuice99@gmail.com', '', ''),
(11, 'Alexander', 'adadadadaadadadadaadadadadaada', 'egjuice99@gmail.com', '', ''),
(12, 'iuoyuoyo', 'iyoyuouogdfhdhfdhdjddddddddddd', 'yoyuouyo@mail.ru', '', ''),
(13, 'gdsgdsgds', 'fdsgsdfhdfhdfhdfhjfdjfdjfd', 'gdsgds@mail.ru', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `timeStamp` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `timeStamp`) VALUES
(2, 'alex123', 'egjuice99@gmail.com', '$2y$10$0sn76bpaCCjGU1nB5zmCJuM5WeqavAlJcSjed2xqQ3p83JpYE0tty', '2021-12-18 11:21:05'),
(3, 'magwaer', 'fake@gmail.com', '$2y$10$nTnrQGvVhzalndSJ19uAqOsR53G.49yffsR98TExixVSptESMtbPu', '2021-12-18 16:43:23'),
(4, 'Alex1234', 'egjuice99@gmail.com', '$2y$10$k9LuBmDZUs/C9N120PoQvuO4M8j0I4MpsOUpbnjH/EUarwF6mj3m.', '2021-12-19 13:26:13');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `arme`
--
ALTER TABLE `arme`
  ADD PRIMARY KEY (`nume_arme`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `atacator`
--
ALTER TABLE `atacator`
  ADD PRIMARY KEY (`nume`),
  ADD UNIQUE KEY `nume` (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `produs FK` (`arma`);

--
-- Индексы таблицы `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `arme`
--
ALTER TABLE `arme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `atacator`
--
ALTER TABLE `atacator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `contact`
--
ALTER TABLE `contact`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `atacator`
--
ALTER TABLE `atacator`
  ADD CONSTRAINT `produs FK` FOREIGN KEY (`arma`) REFERENCES `arme` (`nume_arme`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
