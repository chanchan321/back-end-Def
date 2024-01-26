-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2023 at 09:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtesting`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accountID` varchar(255) NOT NULL,
  `userType` varchar(45) DEFAULT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accountID`, `userType`, `username`, `password`) VALUES
('6b95fa2e46bdbead1065aa4d2ec53a94', 'student', '03216549870', '$2b$10$xk3weX92JhTBofAg6SG1.eKGca6a784.yNSOXYtPg9kBijxyrIWpa'),
('7f0fd417a95e902a61a421dbb7cd7519', 'student', '01234567890', '$2b$10$ujk4S4exfMnn9UdrEbRcvODTTtPvEWQUqD4kOtV8cxso1oZaJkVlu'),
('939879ce2e10e8dff65babfdfb493a0a', 'student', '01472583690', '$2b$10$5lM...LPVJWZ2EDSXzqu4OmztAj3LpZpJ5JSZNPp5aEyOP9Ngocbi'),
('a7a45ac2afe3b2633775998d038d4396', 'gc', 'gc', '$2b$10$MAktK.8tmUU9DBHm13qojOEO8vbnOZY26XPaLLQHZ.JQHp0rfOOea'),
('b19d742422327ecb859a35418dc54f8d', 'student', '03692581470', '$2b$10$p2cIxuHdysfUewDtrbsQbecATDULkvNgSnuKXjPsLRO6s2VcDgIhi');

-- --------------------------------------------------------

--
-- Table structure for table `appointmentrequestlist`
--

CREATE TABLE `appointmentrequestlist` (
  `requestID` varchar(55) NOT NULL,
  `dateOfRequest` varchar(25) DEFAULT NULL,
  `studLrn` varchar(55) NOT NULL,
  `timeRequested` varchar(55) NOT NULL,
  `dateRequested` varchar(55) NOT NULL,
  `reason` varchar(1000) NOT NULL,
  `status` varchar(55) NOT NULL,
  `reschedTime` varchar(25) DEFAULT NULL,
  `reschedDate` varchar(25) DEFAULT NULL,
  `response` varchar(525) DEFAULT NULL,
  `eventID` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointmentrequestlist`
--

INSERT INTO `appointmentrequestlist` (`requestID`, `dateOfRequest`, `studLrn`, `timeRequested`, `dateRequested`, `reason`, `status`, `reschedTime`, `reschedDate`, `response`, `eventID`) VALUES
('269993a403e08272473cb61673814c9e', '2023-07-13', '01234567890', '[\"9am-10am\"]', '2023-07-14', 'asdwa', 'canceled', NULL, NULL, NULL, NULL),
('3da53a4b33b6c33552aea1e0df1a432f', '2023-07-19', '01234567890', '[\"10am-11am\"]', '2023-07-21', 'awdawd', 'canceled', NULL, NULL, NULL, NULL),
('689ea489ef4a5eb14e23ec2e0adbf51a', '2023-07-11', '03692581470', '[\"10am-11am\"]', '2023-07-11', 'asdwa', 'ongoing', NULL, NULL, 'Your Appointment Request is Approved!', 'f20da9c45b219215'),
('b820db3c1dd116b017009c44bcea06ff', '2023-07-19', '01234567890', '[\"9am-10am\"]', '2023-07-21', '3', 'canceled', NULL, NULL, NULL, NULL),
('ee3120c28474955e98d594050bcf6922', '2023-07-11', '03216549870', '[\"4pm-5pm\"]', '2023-07-13', 'aadsdw', 'ongoing', '[\"4pm-5pm\"]', '2023-07-13', 'Your Appointment Request is Approved!', '4a31e03dfd515b10');

-- --------------------------------------------------------

--
-- Table structure for table `calendarevents`
--

CREATE TABLE `calendarevents` (
  `eventID` varchar(55) NOT NULL,
  `eventName` varchar(25) NOT NULL,
  `setDate` varchar(15) NOT NULL,
  `setTime` varchar(55) NOT NULL,
  `description` varchar(555) NOT NULL,
  `place` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calendarevents`
--

INSERT INTO `calendarevents` (`eventID`, `eventName`, `setDate`, `setTime`, `description`, `place`, `status`) VALUES
('1bb2cf86cfe24343', 'Referral', '2023-07-12', '[\"10am-11am\"]', ' ', ' ', 'ongoing'),
('2d531cb2af8353af', 'Referral', '2023-07-13', '[\"3pm-4pm\"]', ' ', ' ', 'ongoing'),
('4a31e03dfd515b10', 'Appointment', '2023-07-13', '[\"4pm-5pm\"]', ' ', ' ', 'ongoing'),
('54538e6245091d0d', 'Referral', '2023-07-12', '[\"3pm-4pm\"]', ' ', ' ', 'ongoing'),
('83b12bf956e7fcce', 'Meeting', '2023-07-13', '[\"9am-10am\"]', 'xccx', 'scx', 'ongoing'),
('9120d4f11843ae06', 'Meeting', '2023-07-04', '[\"10am-11am\"]', 'sssssssssssss', 'sssssssss', 'ongoing'),
('9144030999ce8583', 'Meeting', '2023-07-07', '[\"4pm-5pm\"]', 'ssssssssssssssss', 'ssssssssf', 'ongoing'),
('92492006902ef567', 'Counseling', '2023-07-20', '[\"9am-10am\"]', 'awda', 'awd', 'ongoing'),
('a5869b9ba0b5d7f0', 'Referral', '2023-07-13', '[\"2pm-3pm\"]', ' ', ' ', 'ongoing'),
('f20da9c45b219215', 'Appointment', '2023-07-11', '[\"10am-11am\"]', ' ', ' ', 'ongoing'),
('f8004aec640b41a6', 'Meeting', '2023-07-17', '[\"9am-10am\"]', 'asdwasd', 'asdw', 'ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `guidancecdetails`
--

CREATE TABLE `guidancecdetails` (
  `accountID` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `middlename` varchar(55) NOT NULL,
  `contactNumber` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guidancecdetails`
--

INSERT INTO `guidancecdetails` (`accountID`, `lastname`, `firstname`, `middlename`, `contactNumber`) VALUES
('a7a45ac2afe3b2633775998d038d4396', 'lastname', 'firstname', 'middlename', '+639275911190');

-- --------------------------------------------------------

--
-- Table structure for table `longevents`
--

CREATE TABLE `longevents` (
  `eventID` varchar(45) NOT NULL,
  `title` varchar(125) NOT NULL,
  `start` varchar(125) NOT NULL,
  `end` varchar(125) NOT NULL,
  `description` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `longevents`
--

INSERT INTO `longevents` (`eventID`, `title`, `start`, `end`, `description`) VALUES
('4e3e40d3d4d44c00ad92a8cb', 'Meeting', '2023-07-17', '2023-07-21', 'bffsdewf');

-- --------------------------------------------------------

--
-- Table structure for table `notificationgc`
--

CREATE TABLE `notificationgc` (
  `id` int(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` varchar(245) NOT NULL,
  `timeStamp` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notificationgc`
--

INSERT INTO `notificationgc` (`id`, `type`, `message`, `timeStamp`, `status`) VALUES
(26, 'Counseling', 'A student w/ 01234567890 LRN Request an Appointment on July 14 2023', '2023-07-13 14:56:59', 'unread'),
(27, 'Counseling', 'A student w/ 01234567890 LRN canceled his/her appointment', '2023-07-16 09:47:25', 'unread'),
(28, 'Counseling', 'A student w/ 01234567890 LRN Request an Appointment on July 21 2023', '2023-07-19 08:51:05', 'unread'),
(29, 'Counseling', 'A student w/ 01234567890 LRN canceled his/her appointment', '2023-07-19 08:51:09', 'unread'),
(30, 'Counseling', 'A student w/ 01234567890 LRN Request an Appointment on July 21 2023', '2023-07-19 17:28:24', 'unread'),
(31, 'Counseling', 'A student w/ 01234567890 LRN canceled his/her appointment', '2023-07-19 17:45:48', 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `piscontent`
--

CREATE TABLE `piscontent` (
  `pisID` varchar(55) NOT NULL,
  `personalBackground` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`personalBackground`)),
  `familyBackground` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`familyBackground`)),
  `siblings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`siblings`)),
  `maritalStatus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`maritalStatus`)),
  `educationalInformation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`educationalInformation`)),
  `educbg2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`educbg2`)),
  `uniqueHealthCosult` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `homeSketch` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`homeSketch`)),
  `dateComplete` varchar(25) DEFAULT NULL,
  `statusComp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piscontent`
--

INSERT INTO `piscontent` (`pisID`, `personalBackground`, `familyBackground`, `siblings`, `maritalStatus`, `educationalInformation`, `educbg2`, `uniqueHealthCosult`, `homeSketch`, `dateComplete`, `statusComp`) VALUES
('584784', '{\"lrn\":\"01234567890\",\"lastname\":\"babasa\",\"firstname\":\"christian\",\"middlename\":\"bigtas\",\"age\":\"18\",\"dateOfBirth\":\"2023-05-04\",\"placeOfBirth\":\"awdawdaw\",\"gender\":\"male\",\"birthAmongSib\":\"eldest\",\"citizenship\":\"awdawdawd\",\"religion\":\"dawda\",\"civilStatus\":\"single\",\"currentAddress\":\"sfsdfsdfs\",\"permanentAddress\":\"fsdfsdfsd\",\"landline\":\"23222-222-2222\",\"cellphoneNo\":\"+639461991211\",\"eMail\":\"cbabasañ2@gmail.com\",\"languageSpoken\":\"fsdffsfsf\"}', '{\"father\":{\"status\":\"living\",\"name\":\"awdawdawd\",\"age\":\"51\",\"religion\":\"adawda\",\"nationality\":\"dawdawd\",\"educationalAttainment\":\"awdawd\",\"occupation\":\"awdawda\",\"positionEmployer\":\"dawda\",\"officeBusinessAddress\":\"wdawd\",\"contactNumber\":\"+639123456789\"},\"mother\":{\"status\":\"living\",\"name\":\"awdawd\",\"age\":\"53\",\"religion\":\"dwd\",\"nationality\":\"awd\",\"educationalAttainment\":\"awdaw\",\"occupation\":\"adawd\",\"positionEmployer\":\"awdawdaw\",\"officeBusinessAddress\":\"awdad\",\"contactNumber\":\"+639123456789\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\"\",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"\",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[{\"name\":\"51565\",\"age\":20,\"occupation\":\"65\",\"school_placeWorkL\":\"654\"}]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[{\"gradeLevel\":\"6\",\"schoolAttended\":\"adawd\",\"inclusiveYearsAttended\":\"awdawd\"}]', '{\"subjectWithLowestGrade\":\"a\",\"subjectWithHighestGrade\":\"a\",\"awards\":\"a\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"aaaaaaa\",\"outsideInschool\":\"aaaaaaaa\",\"specialInterest\":\"aaaaaaa\",\"hobbies\":\"aaaaaa\",\"characteristicsThatDescibeU\":\"aaaaaaa\",\"presentFears\":\"aaaaaa\",\"disabilities\":\"aaaaaaa\",\"chronicIllness\":\"aaaaaaaa\",\"medicinesRegTaken\":\"aaaaaaaa\",\"accidentsExperienced\":\"aaaaaaaaaa\",\"operationsExp\":\"aaaaaaaa\",\"immunizations\":\"aaaaaaaa\",\"consultedPsy\":\"a\",\"howmanysessionPsy\":\"a\",\"forwhatPsy\":\"a\",\"consultedCoun\":\"a\",\"howmanysessionCoun\":\"aaa\",\"forwhatCoun\":\"aaa\",\"emerContact\":\"jjjjaaa\",\"address\":\"aaa\",\"contactNumber\":\"+639123456789\"}', '[\"1481e7ce.jpg\",\"40b7f6c7be66c099.jpg\",\"935a7abf288489ca.jpg\",\"19b3ec24deb168d4.jpg\"]', '2023-07-03', 'complete'),
('791771ac', '{\"lrn\":\"01472583690\",\"lastname\":\"castillio\",\"firstname\":\"john\",\"middlename\":\"ededzon\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('92d192ab', '{\"lrn\":\"03216549870\",\"lastname\":\"abad\",\"firstname\":\"daniela\",\"middlename\":\"dani\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('ff8a0160', '{\"lrn\":\"03692581470\",\"lastname\":\"guerero\",\"firstname\":\"ryan\",\"middlename\":\"jay\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('LRN00014PIS', '{\"lrn\":\"LRN00014\",\"lastname\":\"dhthtdhdft\",\"firstname\":\"tdtddgfhfghd\",\"middlename\":\"trdhtghddghf\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('LRN00015PIS', '{\"lrn\":\"LRN00015\",\"lastname\":\"fdbfdghdgtd\",\"firstname\":\"hdhtdhghdgf\",\"middlename\":\"trhtdrjydyng\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('LRN00016PIS', '{\"lrn\":\"LRN00016\",\"lastname\":\"hdhfdhtdfg\",\"firstname\":\"hgdftrdhdtdgfh\",\"middlename\":\"hnmhmfghfg\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('LRN00017PIS', '{\"lrn\":\"LRN00017\",\"lastname\":\"tddthd\",\"firstname\":\"hfdggtrdtrdtr\",\"middlename\":\"trsshhffg\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('LRN00018PIS', '{\"lrn\":\"LRN00018\",\"lastname\":\"gfhchdgtd\",\"firstname\":\"ddfhthdt\",\"middlename\":\"drrtrtdhdh\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete'),
('LRN00019PIS', '{\"lrn\":\"LRN00019\",\"lastname\":\"hdgdhgtd\",\"firstname\":\"dtddtrdttd\",\"middlename\":\"ddthtdfdhg\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}', '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}', '[]', '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}', '[]', '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}', '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}', '[]', '[]', 'incomplete');

-- --------------------------------------------------------

--
-- Table structure for table `refferralrequest`
--

CREATE TABLE `refferralrequest` (
  `referralID` varchar(55) NOT NULL,
  `dateOfReferral` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `employeeID` varchar(55) NOT NULL,
  `teacherName` varchar(555) NOT NULL,
  `teacherContactNum` varchar(55) NOT NULL,
  `designation` varchar(55) NOT NULL,
  `nameOfStudent` varchar(55) NOT NULL,
  `studLrn` varchar(45) NOT NULL,
  `gradeLevel` varchar(55) NOT NULL,
  `gender` varchar(55) NOT NULL,
  `parentName` varchar(55) NOT NULL,
  `parentContactNum` varchar(55) NOT NULL,
  `agreeToCounsel` varchar(55) NOT NULL,
  `reasonforReferral` varchar(525) NOT NULL,
  `initialActions` varchar(525) NOT NULL,
  `acknowledgementContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`acknowledgementContent`)),
  `timeSTAMP` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `eventID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refferralrequest`
--

INSERT INTO `refferralrequest` (`referralID`, `dateOfReferral`, `status`, `employeeID`, `teacherName`, `teacherContactNum`, `designation`, `nameOfStudent`, `studLrn`, `gradeLevel`, `gender`, `parentName`, `parentContactNum`, `agreeToCounsel`, `reasonforReferral`, `initialActions`, `acknowledgementContent`, `timeSTAMP`, `eventID`) VALUES
('472eca845c4495437722c8c6dac94c18', '2023-07-12', 'ongoing', 'ccccccccccccccccccccc', 'cccccccccc', 'cccccccccc', 'ccccccccccccccc', 'babasa christian bigtass', '01234567890', '7', 'male', 'awdawdawd', '+639123456789', 'yes', 'ccccccccccccccccc', 'cccccccccccccc', '{}', '2023-07-12 06:49:43', '2d531cb2af8353af'),
('78ee24d5764d0d004eba7a7ae5d3e62c', '2023-07-10', 'ongoing', 'bhgjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjjjjj', '+639461991211', 'hgjjjjjjjjjjjjjjjj', 'castillio john ededzon', '01472583690', '9', 'male', 'hfgfgfgfgfgfgfgfgfgfgfgfg', 'fgfgfgfgfghhhhhh', 'yes', 'gfhfhfhfhfhfhfhfhfghffhgfhg', 'ffffffffghfhghghghghghghghg', '{}', '2023-07-11 13:59:32', '54538e6245091d0d'),
('7b0504ef4597eb996df48aedbdc512c9', '2023-07-10', 'ongoing', 'sssssssssssssss', 'sssssssssssssssss', '+639461991211', 'ssssssssssssssss', 'guerero ryan jay', '03692581470', '7', 'male', 'ssssssssssss', 'ssssssssssss', 'yes', 'ssssssssssss', 'ssssssssssssssss', '{}', '2023-07-11 13:59:18', 'a5869b9ba0b5d7f0'),
('d81afe2699747bd9612101f351f81a48', '2023-07-12', 'ongoing', 'sssssssss', 'sssssssssssss', 'sssssssssss', 'ssssssssssssss', 'abad daniela dani', '03216549870', '10', 'female', 'sssssssssss', 'sssssssssss', 'yes', 'sssssssssssss', 'ssssssssssssssss', '{}', '2023-07-12 06:49:58', '1bb2cf86cfe24343');

-- --------------------------------------------------------

--
-- Table structure for table `studpis`
--

CREATE TABLE `studpis` (
  `LRN` varchar(25) NOT NULL,
  `accountID` varchar(255) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  `gradeLevel` varchar(255) DEFAULT NULL,
  `pisID` varchar(55) NOT NULL,
  `counsellingRec` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studpis`
--

INSERT INTO `studpis` (`LRN`, `accountID`, `lastname`, `firstname`, `middlename`, `contactNumber`, `gradeLevel`, `pisID`, `counsellingRec`) VALUES
('01234567890', '7f0fd417a95e902a61a421dbb7cd7519', 'babasa', 'christian', 'bigtass', '+639461991211', '7', '584784', '[]'),
('01472583690', '939879ce2e10e8dff65babfdfb493a0a', 'castillio', 'john', 'ededzon', '+639461991211', '9', '791771ac', '[]'),
('03216549870', '6b95fa2e46bdbead1065aa4d2ec53a94', 'abad', 'daniela', 'dani', '+639461991211', '10', '92d192ab', '[]'),
('03692581470', 'b19d742422327ecb859a35418dc54f8d', 'guerero', 'ryan', 'jay', '+639275911190', '8', 'ff8a0160', '[]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accountID`);

--
-- Indexes for table `appointmentrequestlist`
--
ALTER TABLE `appointmentrequestlist`
  ADD PRIMARY KEY (`requestID`);

--
-- Indexes for table `calendarevents`
--
ALTER TABLE `calendarevents`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `guidancecdetails`
--
ALTER TABLE `guidancecdetails`
  ADD PRIMARY KEY (`accountID`);

--
-- Indexes for table `longevents`
--
ALTER TABLE `longevents`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `notificationgc`
--
ALTER TABLE `notificationgc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piscontent`
--
ALTER TABLE `piscontent`
  ADD PRIMARY KEY (`pisID`);

--
-- Indexes for table `refferralrequest`
--
ALTER TABLE `refferralrequest`
  ADD PRIMARY KEY (`referralID`);

--
-- Indexes for table `studpis`
--
ALTER TABLE `studpis`
  ADD PRIMARY KEY (`LRN`),
  ADD KEY `pisCont` (`pisID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notificationgc`
--
ALTER TABLE `notificationgc`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
