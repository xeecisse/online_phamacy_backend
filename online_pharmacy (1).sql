-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2022 at 05:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_pharmacy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pharmacy_registration` (IN `_id` INT(5), IN `_query_type` VARCHAR(50), IN `_bussiness_name` VARCHAR(50), IN `_address` VARCHAR(50), IN `_geolocation` VARCHAR(50), IN `_contact_no` VARCHAR(50), IN `_email` VARCHAR(50), IN `_username` VARCHAR(50), IN `_password` VARCHAR(50), IN `_registered_pharmacist` VARCHAR(50), IN `_pscn_no` VARCHAR(50))  BEGIN
IF _query_type = 'insert' THEN

	INSERT INTO `pharmacy_registration`(
        bussiness_name,
        address,
        geolocation,
        contact_no,
        email,
        username,
        password,
        registered_pharmacist,
        pscn_no
    ) VALUES(
        _bussiness_name,
        _address,
        _geolocation,
        _contact_no,
        _email,
        _username,
        _pasword,
        _registered_pharmacist,
        _pscn_no
    ) ;
    ELSEIF _query_type ='select' THEN
    SELECT * FROM `pharmacy_registration` ;
    
       ELSEIF _query_type ='update' THEN
   UPDATE `pharmacy_registration` SET  
   bussiness_name =_bussiness_name,
        address = _address,
        geolocation = _geolocation,
        contact_no = _contact_no,
        email = _email,
        username = _username,
        password = _password,
        registered_pharmacist = _registered_pharmacist,
        pscn_no = _pscn_no
        WHERE  id=_id;
    
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pharmacy_stock_table` (IN `_id` INT(5), IN `_query_type` VARCHAR(50), IN `_name_of_item` VARCHAR(50), IN `_description` VARCHAR(50), IN `_manufacture` VARCHAR(50), IN `_vendor` VARCHAR(50), IN `_location` VARCHAR(50), IN `_attribute` VARCHAR(50), IN `_size` FLOAT, IN `_quality` FLOAT, IN `_price` VARCHAR(50), IN `_margin` VARCHAR(50))  BEGIN
IF _query_type = 'insert' THEN 
    
	INSERT INTO `pharmacy_stock_table` (
   	 	name_of_item,
        description,
        manufacture,
        vendor,
        location,
        attribute,
        size,
        quality,
        price,
        margin
    ) VALUES(
  		_name_of_item,
        _description,
        _manufacture,
        _vendor,
        _location,
        _attribute,
        _size,
        _quality,
        _price,
        _margin
    ) ;
     ELSEIF _query_type ='select' THEN
    SELECT * FROM `pharmacy_stock_table` ;
    
       ELSEIF _query_type ='update' THEN
   UPDATE `pharmacy_stock_table` SET  
   name_of_item =_name_of_item,
        description =_description,
        manufacture =_manufacture,
        vendor =_vendor,
        location =_location,
        attribute =_attribute,
        size =_size,
        quality =_quality,
        price =_price,
        margin =_margin
        WHERE  id=_id;
    
    END IF;
   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search` (IN `searchterm` VARCHAR(200))  SELECT * FROM `pharmacy_stock_table` WHERE name_of_item LIKE searchterm OR description LIKE searchterm$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users` (IN `_id` INT(5), IN `_query_type` VARCHAR(50), IN `_first_name` VARCHAR(50), IN `_last_name` VARCHAR(50), IN `_email` VARCHAR(50), IN `_phone_no` VARCHAR(50), IN `_username` VARCHAR(50), IN `_password` VARCHAR(50), IN `_user_id` INT(11))  BEGIN
IF _query_type = 'create' THEN
	INSERT INTO `users` (
    first_name,
        last_name,
        email,
        phone_no,
        username,
        password,
        user_id
    ) VALUES(
    _first_name,
        _last_name,
        _email,
        _phone_no,
        _username,
        _password,
        _user_id
    );
      ELSEIF _query_type ='select' THEN
    SELECT * FROM `users` ;
    
       ELSEIF _query_type ='update' THEN
   UPDATE `users` SET  
   first_namee =_first_name,
        last_name = _last_name,
        email = _email,
        phone_no = _phone_no,
        username = _username,
        password = _password,
        user_id = _user_id
        WHERE  id=_id;
        
         ELSEIF _query_type ='delete' THEN
   DELETE FROM `users`
   WHERE id=_id;
    
END IF;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `user_input` (IN `_id` INT(5), IN `_query_type` VARCHAR(50), IN `_user_id` INT(20), IN `_picture` BLOB, IN `_voice` VARCHAR(1000), IN `_text` VARCHAR(50), IN `_attended_by` VARCHAR(50), IN `_request_id` INT(11), IN `_status` VARCHAR(50), IN `_date_time` DATETIME)  BEGIN
IF _query_type = 'new' THEN
	INSERT INTO `user_input` (
    user_id,
        picture,
        voice,
        text,
        attended_by,
        request_id,
        status,
        date_time
    ) VALUES(
    _user_id,
        _picture,
        _voice,
        _text,
        _attended_by,
        _request_id,
        _status,
        _date_time
    );
          ELSEIF _query_type ='select' THEN
    SELECT * FROM `user_input` ;
    
       ELSEIF _query_type ='update' THEN
   UPDATE `user_input` SET  
   user_id =_user_id ,
        picture =_picture,
        voice = _voice,
        text = _text,
        attended_by = _attended_by,
        request_id = _request_id,
        status = _status,
        date_time =_date_time
        WHERE  id=_id;
        
         ELSEIF _query_type ='delete' THEN
   DELETE FROM `users`
   WHERE id=_id;
    
    
END IF;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_registration`
--

CREATE TABLE `pharmacy_registration` (
  `id` int(11) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `geolocation` varchar(50) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `registered_pharmacist` varchar(50) NOT NULL,
  `pscn_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_stock_table`
--

CREATE TABLE `pharmacy_stock_table` (
  `id` int(11) NOT NULL,
  `name_of_item` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `manufacture` varchar(50) NOT NULL,
  `vendor` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `size` float NOT NULL,
  `quality` float NOT NULL,
  `price` varchar(50) NOT NULL,
  `margin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacy_stock_table`
--

INSERT INTO `pharmacy_stock_table` (`id`, `name_of_item`, `description`, `manufacture`, `vendor`, `location`, `attribute`, `size`, `quality`, `price`, `margin`) VALUES
(1, 'paracetamol', 'paracetamol', 'mustapha pharm company', 'sadiq', 'kano', '200mg', 200, 10, '1000', '50'),
(2, 'panadol', 'panadol', 'mustapha pharm company', 'sadiq', 'kano', '100mg', 100, 20, '800', '50'),
(3, 'panadol extra', 'panadol extra', 'mustapha pharm company', 'sadiq', 'kano', '100mg', 100, 20, '800', '50'),
(4, 'paracetamol panadol', 'paracetamol panadol', 'mustapha pharm company', 'sadiq', 'kano', '200mg', 200, 10, '1000', '50'),
(5, 'boska', 'paracetamol panadol', 'mustapha pharm company', 'sadiq', 'kano', '200mg', 200, 10, '1000', '50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_input`
--

CREATE TABLE `user_input` (
  `user_id` int(11) NOT NULL,
  `picture` blob NOT NULL,
  `voice` varchar(200) NOT NULL,
  `text` varchar(50) NOT NULL,
  `attended_by` varchar(50) NOT NULL,
  `request_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pharmacy_registration`
--
ALTER TABLE `pharmacy_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy_stock_table`
--
ALTER TABLE `pharmacy_stock_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_input`
--
ALTER TABLE `user_input`
  ADD PRIMARY KEY (`request_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pharmacy_registration`
--
ALTER TABLE `pharmacy_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacy_stock_table`
--
ALTER TABLE `pharmacy_stock_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_input`
--
ALTER TABLE `user_input`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
