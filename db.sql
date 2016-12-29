SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinebanking`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` bigint(20) NOT NULL,
  `confirmed` bit(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `confirmed`, `date`, `description`, `location`, `user_id`) VALUES
(1, b'1', '2016-12-28 20:12:00', 'Test', 'New York', 1);

-- --------------------------------------------------------

--
-- Table structure for table `primary_account`
--

CREATE TABLE `primary_account` (
  `id` bigint(20) NOT NULL,
  `account_balance` decimal(19,2) DEFAULT NULL,
  `account_number` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `primary_account`
--

INSERT INTO `primary_account` (`id`, `account_balance`, `account_number`) VALUES
(1, '49189.00', 11223146);

-- --------------------------------------------------------

--
-- Table structure for table `primary_transaction`
--

CREATE TABLE `primary_transaction` (
  `id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `available_balance` decimal(19,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `primary_account_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `primary_transaction`
--

INSERT INTO `primary_transaction` (`id`, `amount`, `available_balance`, `date`, `description`, `status`, `type`, `primary_account_id`) VALUES
(1, 90000, '98000.00', '2016-12-28 20:02:27', 'Deposit to Primary Account', 'Finished', 'Account', 1),
(2, 400, '98400.00', '2016-12-28 20:11:41', 'Deposit to Primary Account', 'Finished', 'Account', 1),
(3, 789, '99189.00', '2016-12-28 20:11:47', 'Deposit to Primary Account', 'Finished', 'Account', 1),
(4, -50000, '49189.00', '2016-12-28 20:12:07', 'Deposit to Primary Account', 'Finished', 'Account', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `id` bigint(20) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `savings_account`
--

CREATE TABLE `savings_account` (
  `id` bigint(20) NOT NULL,
  `account_balance` decimal(19,2) DEFAULT NULL,
  `account_number` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `savings_account`
--

INSERT INTO `savings_account` (`id`, `account_balance`, `account_number`) VALUES
(1, '4500.00', 11223147);

-- --------------------------------------------------------

--
-- Table structure for table `savings_transaction`
--

CREATE TABLE `savings_transaction` (
  `id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `available_balance` decimal(19,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `savings_transaction`
--

INSERT INTO `savings_transaction` (`id`, `amount`, `available_balance`, `date`, `description`, `status`, `type`, `savings_account_id`) VALUES
(1, 4500, '4500.00', '2016-12-28 20:11:33', 'Deposit to savings Account', 'Finished', 'Account', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `primary_account_id` bigint(20) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `enabled`, `first_name`, `last_name`, `password`, `phone`, `username`, `primary_account_id`, `savings_account_id`) VALUES
(1, 'samdahal2@gmail.com', b'1', 'Sam', 'Dahal', '$2a$12$DWCryEwHwbTYCegib92tk.nQkzifO0TM5lQVe5Ztx5swRhC4Odx1O', '5134840611', 'sdahal', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_role_id` bigint(20) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_role_id`, `role_id`, `user_id`) VALUES
(1, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa8m1smlfsc8kkjn2t6wpdmysk` (`user_id`);

--
-- Indexes for table `primary_account`
--
ALTER TABLE `primary_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `primary_transaction`
--
ALTER TABLE `primary_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK643wtfdx6y0e093wlc09csehn` (`primary_account_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3041ks22uyyuuw441k5671ah9` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `savings_account`
--
ALTER TABLE `savings_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_transaction`
--
ALTER TABLE `savings_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4bt1l2090882974glyn79q2s9` (`savings_account_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  ADD KEY `FKbj0uoj9i40dory8w4t5ojyb9n` (`primary_account_id`),
  ADD KEY `FKihums7d3g5cv9ehminfs1539e` (`savings_account_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `primary_account`
--
ALTER TABLE `primary_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `primary_transaction`
--
ALTER TABLE `primary_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `savings_account`
--
ALTER TABLE `savings_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `savings_transaction`
--
ALTER TABLE `savings_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
