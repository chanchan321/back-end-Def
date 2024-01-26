/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: accounts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `accounts` (
  `accountID` varchar(255) NOT NULL,
  `userType` varchar(45) DEFAULT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: appointmentrequestlist
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `appointmentrequestlist` (
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
  `eventID` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: calendarevents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `calendarevents` (
  `eventID` varchar(55) NOT NULL,
  `eventName` varchar(25) NOT NULL,
  `setDate` varchar(15) NOT NULL,
  `setTime` varchar(55) NOT NULL,
  `description` varchar(555) NOT NULL,
  `place` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: guidancecdetails
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `guidancecdetails` (
  `accountID` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `middlename` varchar(55) NOT NULL,
  `contactNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: longevents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `longevents` (
  `eventID` varchar(45) NOT NULL,
  `title` varchar(125) NOT NULL,
  `start` varchar(125) NOT NULL,
  `end` varchar(125) NOT NULL,
  `description` varchar(125) NOT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: notificationgc
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `notificationgc` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `message` varchar(245) NOT NULL,
  `timeStamp` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 30 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: piscontent
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `piscontent` (
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
  `statusComp` varchar(25) NOT NULL,
  PRIMARY KEY (`pisID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: refferralrequest
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `refferralrequest` (
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
  `eventID` varchar(25) NOT NULL,
  PRIMARY KEY (`referralID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: studpis
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `studpis` (
  `LRN` varchar(25) NOT NULL,
  `accountID` varchar(255) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  `gradeLevel` varchar(255) DEFAULT NULL,
  `pisID` varchar(55) NOT NULL,
  `counsellingRec` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`LRN`),
  KEY `pisCont` (`pisID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: accounts
# ------------------------------------------------------------

INSERT INTO
  `accounts` (`accountID`, `userType`, `username`, `password`)
VALUES
  (
    '6b95fa2e46bdbead1065aa4d2ec53a94',
    'student',
    '03216549870',
    '$2b$10$xk3weX92JhTBofAg6SG1.eKGca6a784.yNSOXYtPg9kBijxyrIWpa'
  );
INSERT INTO
  `accounts` (`accountID`, `userType`, `username`, `password`)
VALUES
  (
    '7f0fd417a95e902a61a421dbb7cd7519',
    'student',
    '01234567890',
    '$2b$10$ujk4S4exfMnn9UdrEbRcvODTTtPvEWQUqD4kOtV8cxso1oZaJkVlu'
  );
INSERT INTO
  `accounts` (`accountID`, `userType`, `username`, `password`)
VALUES
  (
    '939879ce2e10e8dff65babfdfb493a0a',
    'student',
    '01472583690',
    '$2b$10$5lM...LPVJWZ2EDSXzqu4OmztAj3LpZpJ5JSZNPp5aEyOP9Ngocbi'
  );
INSERT INTO
  `accounts` (`accountID`, `userType`, `username`, `password`)
VALUES
  (
    'a7a45ac2afe3b2633775998d038d4396',
    'gc',
    'gc',
    '$2b$10$88IwJwZpA0c/Lmq8VMEuPOlhCZI2EmuR.SiKyhgFQ26Uv/UL2Dgau'
  );
INSERT INTO
  `accounts` (`accountID`, `userType`, `username`, `password`)
VALUES
  (
    'b19d742422327ecb859a35418dc54f8d',
    'student',
    '03692581470',
    '$2b$10$p2cIxuHdysfUewDtrbsQbecATDULkvNgSnuKXjPsLRO6s2VcDgIhi'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: appointmentrequestlist
# ------------------------------------------------------------

INSERT INTO
  `appointmentrequestlist` (
    `requestID`,
    `dateOfRequest`,
    `studLrn`,
    `timeRequested`,
    `dateRequested`,
    `reason`,
    `status`,
    `reschedTime`,
    `reschedDate`,
    `response`,
    `eventID`
  )
VALUES
  (
    '269993a403e08272473cb61673814c9e',
    '2023-07-13',
    '01234567890',
    '[\"9am-10am\"]',
    '2023-07-14',
    'asdwa',
    'canceled',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `appointmentrequestlist` (
    `requestID`,
    `dateOfRequest`,
    `studLrn`,
    `timeRequested`,
    `dateRequested`,
    `reason`,
    `status`,
    `reschedTime`,
    `reschedDate`,
    `response`,
    `eventID`
  )
VALUES
  (
    '3da53a4b33b6c33552aea1e0df1a432f',
    '2023-07-19',
    '01234567890',
    '[\"10am-11am\"]',
    '2023-07-21',
    'awdawd',
    'canceled',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `appointmentrequestlist` (
    `requestID`,
    `dateOfRequest`,
    `studLrn`,
    `timeRequested`,
    `dateRequested`,
    `reason`,
    `status`,
    `reschedTime`,
    `reschedDate`,
    `response`,
    `eventID`
  )
VALUES
  (
    '689ea489ef4a5eb14e23ec2e0adbf51a',
    '2023-07-11',
    '03692581470',
    '[\"10am-11am\"]',
    '2023-07-11',
    'asdwa',
    'ongoing',
    NULL,
    NULL,
    'Your Appointment Request is Approved!',
    'f20da9c45b219215'
  );
INSERT INTO
  `appointmentrequestlist` (
    `requestID`,
    `dateOfRequest`,
    `studLrn`,
    `timeRequested`,
    `dateRequested`,
    `reason`,
    `status`,
    `reschedTime`,
    `reschedDate`,
    `response`,
    `eventID`
  )
VALUES
  (
    'ee3120c28474955e98d594050bcf6922',
    '2023-07-11',
    '03216549870',
    '[\"4pm-5pm\"]',
    '2023-07-13',
    'aadsdw',
    'ongoing',
    '[\"4pm-5pm\"]',
    '2023-07-13',
    'Your Appointment Request is Approved!',
    '4a31e03dfd515b10'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: calendarevents
# ------------------------------------------------------------

INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '1bb2cf86cfe24343',
    'Referral',
    '2023-07-12',
    '[\"10am-11am\"]',
    ' ',
    ' ',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '2d531cb2af8353af',
    'Referral',
    '2023-07-13',
    '[\"3pm-4pm\"]',
    ' ',
    ' ',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '4a31e03dfd515b10',
    'Appointment',
    '2023-07-13',
    '[\"4pm-5pm\"]',
    ' ',
    ' ',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '54538e6245091d0d',
    'Referral',
    '2023-07-12',
    '[\"3pm-4pm\"]',
    ' ',
    ' ',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '83b12bf956e7fcce',
    'Meeting',
    '2023-07-13',
    '[\"9am-10am\"]',
    'xccx',
    'scx',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '9120d4f11843ae06',
    'Meeting',
    '2023-07-04',
    '[\"10am-11am\"]',
    'sssssssssssss',
    'sssssssss',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '9144030999ce8583',
    'Meeting',
    '2023-07-07',
    '[\"4pm-5pm\"]',
    'ssssssssssssssss',
    'ssssssssf',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    '92492006902ef567',
    'Counseling',
    '2023-07-20',
    '[\"9am-10am\"]',
    'awda',
    'awd',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    'a5869b9ba0b5d7f0',
    'Referral',
    '2023-07-13',
    '[\"2pm-3pm\"]',
    ' ',
    ' ',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    'f20da9c45b219215',
    'Appointment',
    '2023-07-11',
    '[\"10am-11am\"]',
    ' ',
    ' ',
    'ongoing'
  );
INSERT INTO
  `calendarevents` (
    `eventID`,
    `eventName`,
    `setDate`,
    `setTime`,
    `description`,
    `place`,
    `status`
  )
VALUES
  (
    'f8004aec640b41a6',
    'Meeting',
    '2023-07-17',
    '[\"9am-10am\"]',
    'asdwasd',
    'asdw',
    'ongoing'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: guidancecdetails
# ------------------------------------------------------------

INSERT INTO
  `guidancecdetails` (
    `accountID`,
    `lastname`,
    `firstname`,
    `middlename`,
    `contactNumber`
  )
VALUES
  (
    'a7a45ac2afe3b2633775998d038d4396',
    'lastname',
    'firstname',
    'middlename',
    '+639275911190'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: longevents
# ------------------------------------------------------------

INSERT INTO
  `longevents` (`eventID`, `title`, `start`, `end`, `description`)
VALUES
  (
    '4e3e40d3d4d44c00ad92a8cb',
    'Meeting',
    '2023-07-17',
    '2023-07-21',
    'bffsdewf'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: notificationgc
# ------------------------------------------------------------

INSERT INTO
  `notificationgc` (`id`, `type`, `message`, `timeStamp`, `status`)
VALUES
  (
    26,
    'Counseling',
    'A student w/ 01234567890 LRN Request an Appointment on July 14 2023',
    '2023-07-13 14:56:59',
    'unread'
  );
INSERT INTO
  `notificationgc` (`id`, `type`, `message`, `timeStamp`, `status`)
VALUES
  (
    27,
    'Counseling',
    'A student w/ 01234567890 LRN canceled his/her appointment',
    '2023-07-16 09:47:25',
    'unread'
  );
INSERT INTO
  `notificationgc` (`id`, `type`, `message`, `timeStamp`, `status`)
VALUES
  (
    28,
    'Counseling',
    'A student w/ 01234567890 LRN Request an Appointment on July 21 2023',
    '2023-07-19 08:51:05',
    'unread'
  );
INSERT INTO
  `notificationgc` (`id`, `type`, `message`, `timeStamp`, `status`)
VALUES
  (
    29,
    'Counseling',
    'A student w/ 01234567890 LRN canceled his/her appointment',
    '2023-07-19 08:51:09',
    'unread'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: piscontent
# ------------------------------------------------------------

INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    '584784',
    '{\"lrn\":\"01234567890\",\"lastname\":\"babasa\",\"firstname\":\"christian\",\"middlename\":\"bigtas\",\"age\":\"18\",\"dateOfBirth\":\"2023-05-04\",\"placeOfBirth\":\"awdawdaw\",\"gender\":\"male\",\"birthAmongSib\":\"eldest\",\"citizenship\":\"awdawdawd\",\"religion\":\"dawda\",\"civilStatus\":\"single\",\"currentAddress\":\"sfsdfsdfs\",\"permanentAddress\":\"fsdfsdfsd\",\"landline\":\"23222-222-2222\",\"cellphoneNo\":\"+639461991211\",\"eMail\":\"cbabasañ2@gmail.com\",\"languageSpoken\":\"fsdffsfsf\"}',
    '{\"father\":{\"status\":\"living\",\"name\":\"awdawdawd\",\"age\":\"51\",\"religion\":\"adawda\",\"nationality\":\"dawdawd\",\"educationalAttainment\":\"awdawd\",\"occupation\":\"awdawda\",\"positionEmployer\":\"dawda\",\"officeBusinessAddress\":\"wdawd\",\"contactNumber\":\"+639123456789\"},\"mother\":{\"status\":\"living\",\"name\":\"awdawd\",\"age\":\"53\",\"religion\":\"dwd\",\"nationality\":\"awd\",\"educationalAttainment\":\"awdaw\",\"occupation\":\"adawd\",\"positionEmployer\":\"awdawdaw\",\"officeBusinessAddress\":\"awdad\",\"contactNumber\":\"+639123456789\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\"\",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"\",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[{\"name\":\"51565\",\"age\":20,\"occupation\":\"65\",\"school_placeWorkL\":\"654\"}]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[{\"gradeLevel\":\"6\",\"schoolAttended\":\"adawd\",\"inclusiveYearsAttended\":\"awdawd\"}]',
    '{\"subjectWithLowestGrade\":\"a\",\"subjectWithHighestGrade\":\"a\",\"awards\":\"a\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"aaaaaaa\",\"outsideInschool\":\"aaaaaaaa\",\"specialInterest\":\"aaaaaaa\",\"hobbies\":\"aaaaaa\",\"characteristicsThatDescibeU\":\"aaaaaaa\",\"presentFears\":\"aaaaaa\",\"disabilities\":\"aaaaaaa\",\"chronicIllness\":\"aaaaaaaa\",\"medicinesRegTaken\":\"aaaaaaaa\",\"accidentsExperienced\":\"aaaaaaaaaa\",\"operationsExp\":\"aaaaaaaa\",\"immunizations\":\"aaaaaaaa\",\"consultedPsy\":\"a\",\"howmanysessionPsy\":\"a\",\"forwhatPsy\":\"a\",\"consultedCoun\":\"a\",\"howmanysessionCoun\":\"aaa\",\"forwhatCoun\":\"aaa\",\"emerContact\":\"jjjjaaa\",\"address\":\"aaa\",\"contactNumber\":\"+639123456789\"}',
    '[\"1481e7ce.jpg\",\"40b7f6c7be66c099.jpg\",\"935a7abf288489ca.jpg\",\"19b3ec24deb168d4.jpg\"]',
    '2023-07-03',
    'complete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    '791771ac',
    '{\"lrn\":\"01472583690\",\"lastname\":\"castillio\",\"firstname\":\"john\",\"middlename\":\"ededzon\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    '92d192ab',
    '{\"lrn\":\"03216549870\",\"lastname\":\"abad\",\"firstname\":\"daniela\",\"middlename\":\"dani\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    'ff8a0160',
    '{\"lrn\":\"03692581470\",\"lastname\":\"guerero\",\"firstname\":\"ryan\",\"middlename\":\"jay\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    'LRN00014PIS',
    '{\"lrn\":\"LRN00014\",\"lastname\":\"dhthtdhdft\",\"firstname\":\"tdtddgfhfghd\",\"middlename\":\"trdhtghddghf\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    'LRN00015PIS',
    '{\"lrn\":\"LRN00015\",\"lastname\":\"fdbfdghdgtd\",\"firstname\":\"hdhtdhghdgf\",\"middlename\":\"trhtdrjydyng\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    'LRN00016PIS',
    '{\"lrn\":\"LRN00016\",\"lastname\":\"hdhfdhtdfg\",\"firstname\":\"hgdftrdhdtdgfh\",\"middlename\":\"hnmhmfghfg\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    'LRN00017PIS',
    '{\"lrn\":\"LRN00017\",\"lastname\":\"tddthd\",\"firstname\":\"hfdggtrdtrdtr\",\"middlename\":\"trsshhffg\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    'LRN00018PIS',
    '{\"lrn\":\"LRN00018\",\"lastname\":\"gfhchdgtd\",\"firstname\":\"ddfhthdt\",\"middlename\":\"drrtrtdhdh\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );
INSERT INTO
  `piscontent` (
    `pisID`,
    `personalBackground`,
    `familyBackground`,
    `siblings`,
    `maritalStatus`,
    `educationalInformation`,
    `educbg2`,
    `uniqueHealthCosult`,
    `homeSketch`,
    `dateComplete`,
    `statusComp`
  )
VALUES
  (
    'LRN00019PIS',
    '{\"lrn\":\"LRN00019\",\"lastname\":\"hdgdhgtd\",\"firstname\":\"dtddtrdttd\",\"middlename\":\"ddthtdfdhg\",\"age\":\"\",\"dateOfBirth\":\"\",\"placeOfBirth\":\"\",\"gender\":\"\",\"birthAmongSib\":\"\",\"citizenship\":\" \",\"religion\":\"\",\"civilStatus\":\"\",\"currentAddress\":\"\",\"permanentAddress\":\"\",\"landline\":\"\",\"cellphoneNo\":\"\",\"eMail\":\"\",\"languageSpoken\":\"\"}',
    '{\"father\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"tagaBanay\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"mother\":{\"status\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\"},\"guardian\":{\"relationshipW\":\"\",\"name\":\" \",\"age\":\"\",\"religion\":\"\",\"nationality\":\"\",\"educationalAttainment\":\"\",\"occupation\":\"  \",\"positionEmployer\":\"\",\"officeBusinessAddress\":\"\",\"contactNumber\":\"\",\"monthStayed\":\"\"}}',
    '[]',
    '{\"married\":\"\",\"livingTogether\":\"\",\"singleParent\":false,\"widow\":\"\",\"temporarySeperated\":\"\",\"permanentlySeperated\":\"\",\"marriedAnnulled\":\"\",\"fatherOfw\":\"\",\"motherOfw\":\"\",\"fatherWpartner\":\"\",\"motherWpartner\":\"\"}',
    '[]',
    '{\"subjectWithLowestGrade\":\"\",\"subjectWithHighestGrade\":\"\",\"awards\":\"\",\"newscholarship\":{\"fourpis\":false,\"cibi\":false,\"sistersCharity\":false,\"others\":\"\"}}',
    '{\"friendsInschool\":\"\",\"outsideInschool\":\"\",\"specialInterest\":\"\",\"hobbies\":\"\",\"characteristicsThatDescibeU\":\"\",\"presentFears\":\"\",\"disabilities\":\"\",\"chronicIllness\":\"\",\"medicinesRegTaken\":\"\",\"accidentsExperienced\":\"\",\"operationsExp\":\"\",\"immunizations\":\"\",\"consultedPsy\":\"\",\"howmanysessionPsy\":\"\",\"forwhatPsy\":\"\",\"consultedCoun\":\"\",\"howmanysessionCoun\":\"\",\"forwhatCoun\":\"\",\"emerContact\":\"\",\"address\":\"\",\"contactNumber\":\"\"}',
    '[]',
    '[]',
    'incomplete'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: refferralrequest
# ------------------------------------------------------------

INSERT INTO
  `refferralrequest` (
    `referralID`,
    `dateOfReferral`,
    `status`,
    `employeeID`,
    `teacherName`,
    `teacherContactNum`,
    `designation`,
    `nameOfStudent`,
    `studLrn`,
    `gradeLevel`,
    `gender`,
    `parentName`,
    `parentContactNum`,
    `agreeToCounsel`,
    `reasonforReferral`,
    `initialActions`,
    `acknowledgementContent`,
    `timeSTAMP`,
    `eventID`
  )
VALUES
  (
    '472eca845c4495437722c8c6dac94c18',
    '2023-07-12',
    'ongoing',
    'ccccccccccccccccccccc',
    'cccccccccc',
    'cccccccccc',
    'ccccccccccccccc',
    'babasa christian bigtass',
    '01234567890',
    '7',
    'male',
    'awdawdawd',
    '+639123456789',
    'yes',
    'ccccccccccccccccc',
    'cccccccccccccc',
    '{}',
    '2023-07-12 14:49:43',
    '2d531cb2af8353af'
  );
INSERT INTO
  `refferralrequest` (
    `referralID`,
    `dateOfReferral`,
    `status`,
    `employeeID`,
    `teacherName`,
    `teacherContactNum`,
    `designation`,
    `nameOfStudent`,
    `studLrn`,
    `gradeLevel`,
    `gender`,
    `parentName`,
    `parentContactNum`,
    `agreeToCounsel`,
    `reasonforReferral`,
    `initialActions`,
    `acknowledgementContent`,
    `timeSTAMP`,
    `eventID`
  )
VALUES
  (
    '78ee24d5764d0d004eba7a7ae5d3e62c',
    '2023-07-10',
    'ongoing',
    'bhgjjjjjjjjjj',
    'jjjjjjjjjjjjjjjjjjjjj',
    '+639461991211',
    'hgjjjjjjjjjjjjjjjj',
    'castillio john ededzon',
    '01472583690',
    '9',
    'male',
    'hfgfgfgfgfgfgfgfgfgfgfgfg',
    'fgfgfgfgfghhhhhh',
    'yes',
    'gfhfhfhfhfhfhfhfhfghffhgfhg',
    'ffffffffghfhghghghghghghghg',
    '{}',
    '2023-07-11 21:59:32',
    '54538e6245091d0d'
  );
INSERT INTO
  `refferralrequest` (
    `referralID`,
    `dateOfReferral`,
    `status`,
    `employeeID`,
    `teacherName`,
    `teacherContactNum`,
    `designation`,
    `nameOfStudent`,
    `studLrn`,
    `gradeLevel`,
    `gender`,
    `parentName`,
    `parentContactNum`,
    `agreeToCounsel`,
    `reasonforReferral`,
    `initialActions`,
    `acknowledgementContent`,
    `timeSTAMP`,
    `eventID`
  )
VALUES
  (
    '7b0504ef4597eb996df48aedbdc512c9',
    '2023-07-10',
    'ongoing',
    'sssssssssssssss',
    'sssssssssssssssss',
    '+639461991211',
    'ssssssssssssssss',
    'guerero ryan jay',
    '03692581470',
    '7',
    'male',
    'ssssssssssss',
    'ssssssssssss',
    'yes',
    'ssssssssssss',
    'ssssssssssssssss',
    '{}',
    '2023-07-11 21:59:18',
    'a5869b9ba0b5d7f0'
  );
INSERT INTO
  `refferralrequest` (
    `referralID`,
    `dateOfReferral`,
    `status`,
    `employeeID`,
    `teacherName`,
    `teacherContactNum`,
    `designation`,
    `nameOfStudent`,
    `studLrn`,
    `gradeLevel`,
    `gender`,
    `parentName`,
    `parentContactNum`,
    `agreeToCounsel`,
    `reasonforReferral`,
    `initialActions`,
    `acknowledgementContent`,
    `timeSTAMP`,
    `eventID`
  )
VALUES
  (
    'd81afe2699747bd9612101f351f81a48',
    '2023-07-12',
    'ongoing',
    'sssssssss',
    'sssssssssssss',
    'sssssssssss',
    'ssssssssssssss',
    'abad daniela dani',
    '03216549870',
    '10',
    'female',
    'sssssssssss',
    'sssssssssss',
    'yes',
    'sssssssssssss',
    'ssssssssssssssss',
    '{}',
    '2023-07-12 14:49:58',
    '1bb2cf86cfe24343'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: studpis
# ------------------------------------------------------------

INSERT INTO
  `studpis` (
    `LRN`,
    `accountID`,
    `lastname`,
    `firstname`,
    `middlename`,
    `contactNumber`,
    `gradeLevel`,
    `pisID`,
    `counsellingRec`
  )
VALUES
  (
    '01234567890',
    '7f0fd417a95e902a61a421dbb7cd7519',
    'babasa',
    'christian',
    'bigtass',
    '+639461991211',
    '7',
    '584784',
    '[]'
  );
INSERT INTO
  `studpis` (
    `LRN`,
    `accountID`,
    `lastname`,
    `firstname`,
    `middlename`,
    `contactNumber`,
    `gradeLevel`,
    `pisID`,
    `counsellingRec`
  )
VALUES
  (
    '01472583690',
    '939879ce2e10e8dff65babfdfb493a0a',
    'castillio',
    'john',
    'ededzon',
    '+639461991211',
    '9',
    '791771ac',
    '[]'
  );
INSERT INTO
  `studpis` (
    `LRN`,
    `accountID`,
    `lastname`,
    `firstname`,
    `middlename`,
    `contactNumber`,
    `gradeLevel`,
    `pisID`,
    `counsellingRec`
  )
VALUES
  (
    '03216549870',
    '6b95fa2e46bdbead1065aa4d2ec53a94',
    'abad',
    'daniela',
    'dani',
    '+639461991211',
    '10',
    '92d192ab',
    '[]'
  );
INSERT INTO
  `studpis` (
    `LRN`,
    `accountID`,
    `lastname`,
    `firstname`,
    `middlename`,
    `contactNumber`,
    `gradeLevel`,
    `pisID`,
    `counsellingRec`
  )
VALUES
  (
    '03692581470',
    'b19d742422327ecb859a35418dc54f8d',
    'guerero',
    'ryan',
    'jay',
    '+639275911190',
    '8',
    'ff8a0160',
    '[]'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
