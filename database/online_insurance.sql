create database online_insurance;

use online_insurance;

CREATE TABLE `admin` (
  `uid` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `policy` (
  `policy_id` varchar(255) NOT NULL,
  `policy_name` varchar(255) NOT NULL,
  `weekly_interest` varchar(255) NOT NULL,
  `monthly_interest` varchar(255) NOT NULL,
  `quarter_interest` varchar(255) NOT NULL,
  `half_interest` varchar(255) NOT NULL,
  `year_interest` varchar(255) NOT NULL,
  `details` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `agent` (
  `ac_no` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `working_details` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `authorize` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `holder` (
  `ac_no` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `policy_type` varchar(255) NOT NULL,
  `policy_sch` varchar(255) NOT NULL,
  `agent_id` varchar(255) NOT NULL,
  `register_date` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `authorize` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` VALUES ('admin', 'admin');
INSERT INTO `policy` VALUES ('PO1', 'Life Insurance', '1', '3', '5', '7', '9', 'Life insurance policies provide beneficiaries with lump-sum payments when the insured party passes away or after a specific period of time has passed. Life insurance provides financial security by replacing lost income and covering expenses.');
INSERT INTO `policy` VALUES ('PO2', 'Home Insurance', '2', '4', '6', '8', '10', 'Homeowners insurance is a form of property insurance that covers losses and damages to an individual\'s residence, along with furnishings and other assets in the home. Homeowners insurance also provides liability coverage against accidents in the home or on the property.');
INSERT INTO `policy` VALUES ('PO3', 'Auto Insurance', '2', '4', '6', '8', '10', 'Auto insurance is a contract between you and the insurance company that protects you against financial loss in the event of an accident or theft. In exchange for your paying a premium, the insurance company agrees to pay your losses as outlined in your policy. Auto insurance provides coverage for: Property – such as damage to or theft of your car. Liability – your legal responsibility to others for bodily injury or property damage. Medical – the cost of treating injuries, rehabilitation and sometimes lost wages and funeral expenses.');

INSERT INTO `agent` VALUES ('AG1', 'AG1', 'Adam Jones', 'BOA', 'Software Engineer', '37', 'Male', '22 Pat St, Boston, MA, 02457','781-000-0000', 'adamj@gmail.com', '07/04/2020', 'Registered');
INSERT INTO `agent` VALUES ('AG2', 'AG2', 'Adam Jones2', 'BOA', 'Software Engineer', '37', 'Male', '22 Pat St, Boston, MA, 02457','781-000-0000', 'adamj@gmail.com', '07/04/2020', 'Unregistered');

INSERT INTO `holder` VALUES ('PH1', 'PH1', 'Lucy Brown', 'Auto Insurance', 'Monthly', 'AG1', '07/05/2020', 'Teacher', '29', 'Female', 'Window St, Waltham, MA, 02451', '781-999-9999', 'lucyb@gmail.com', 'Registered');
INSERT INTO `holder` VALUES ('PH2', 'PH2', 'Lucy Brown2', 'Auto Insurance', 'Monthly', 'undecided', '07/05/2020', 'Teacher', '29', 'Female', 'Window St, Waltham, MA, 02451', '781-999-9999', 'lucyb@gmail.com', 'Unregistered');
