#
# TABLE STRUCTURE FOR: acc_coa
#

DROP TABLE IF EXISTS `acc_coa`;

CREATE TABLE `acc_coa` (
  `HeadCode` varchar(50) NOT NULL,
  `HeadName` varchar(100) NOT NULL,
  `PHeadName` varchar(50) NOT NULL,
  `HeadLevel` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsTransaction` tinyint(1) NOT NULL,
  `IsGL` tinyint(1) NOT NULL,
  `HeadType` char(1) NOT NULL,
  `IsBudget` tinyint(1) NOT NULL,
  `IsDepreciation` tinyint(1) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `DepreciationRate` decimal(18,2) NOT NULL,
  `CreateBy` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateDate` datetime NOT NULL,
  PRIMARY KEY (`HeadName`),
  KEY `HeadCode` (`HeadCode`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: acc_transaction
#

DROP TABLE IF EXISTS `acc_transaction`;

CREATE TABLE `acc_transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VNo` varchar(50) DEFAULT NULL,
  `Vtype` varchar(50) DEFAULT NULL,
  `VDate` date DEFAULT NULL,
  `COAID` varchar(50) NOT NULL,
  `Narration` text,
  `Debit` decimal(18,2) DEFAULT NULL,
  `Credit` decimal(18,2) DEFAULT NULL,
  `IsPosted` char(10) DEFAULT NULL,
  `is_opening` int(11) NOT NULL DEFAULT '0',
  `CreateBy` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `IsAppove` char(10) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`),
  KEY `COAID` (`COAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: app_setting
#

DROP TABLE IF EXISTS `app_setting`;

CREATE TABLE `app_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localhserver` varchar(250) DEFAULT NULL,
  `onlineserver` varchar(250) DEFAULT NULL,
  `hotspot` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `app_setting` (`id`, `localhserver`, `onlineserver`, `hotspot`) VALUES ('1', 'localhost/url', 'https://yoururl', '192.12.12');


#
# TABLE STRUCTURE FOR: attendance
#

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sign_in` varchar(30) NOT NULL,
  `sign_out` varchar(30) NOT NULL,
  `staytime` varchar(30) NOT NULL,
  PRIMARY KEY (`att_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: bank_add
#

DROP TABLE IF EXISTS `bank_add`;

CREATE TABLE `bank_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ac_name` varchar(250) DEFAULT NULL,
  `ac_number` varchar(250) DEFAULT NULL,
  `branch` varchar(250) DEFAULT NULL,
  `signature_pic` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: company_information
#

DROP TABLE IF EXISTS `company_information`;

CREATE TABLE `company_information` (
  `company_id` varchar(250) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `company_information` (`company_id`, `company_name`, `email`, `address`, `mobile`, `website`, `status`) VALUES ('1', 'Boolisoft', 'boolisoftdev@gmail.com', '51 Avenue Pierre Point Lieusaint, France', '234234/90067039', 'boolisoft.com', '1');


#
# TABLE STRUCTURE FOR: currency_tbl
#

DROP TABLE IF EXISTS `currency_tbl`;

CREATE TABLE `currency_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) NOT NULL,
  `icon` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES ('1', 'Dollars', '$');
INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES ('2', 'Fr', 'FCFA');
INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES ('3', 'euro', '£');


#
# TABLE STRUCTURE FOR: customer_information
#

DROP TABLE IF EXISTS `customer_information`;

CREATE TABLE `customer_information` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `address2` text NOT NULL,
  `customer_mobile` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `city` text,
  `state` text,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `status` int(2) NOT NULL COMMENT '1=paid,2=credit',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: daily_banking_add
#

DROP TABLE IF EXISTS `daily_banking_add`;

CREATE TABLE `daily_banking_add` (
  `banking_id` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `bank_id` varchar(100) DEFAULT NULL,
  `deposit_type` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `description` text,
  `amount` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: daily_closing
#

DROP TABLE IF EXISTS `daily_closing`;

CREATE TABLE `daily_closing` (
  `closing_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_day_closing` float NOT NULL,
  `cash_in` float NOT NULL,
  `cash_out` float NOT NULL,
  `date` varchar(250) NOT NULL,
  `amount` float NOT NULL,
  `adjustment` float DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`closing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: designation
#

DROP TABLE IF EXISTS `designation`;

CREATE TABLE `designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(150) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` text NOT NULL,
  `smtp_host` text NOT NULL,
  `smtp_port` text NOT NULL,
  `smtp_user` varchar(35) NOT NULL,
  `smtp_pass` varchar(35) NOT NULL,
  `mailtype` varchar(30) DEFAULT NULL,
  `isinvoice` tinyint(4) NOT NULL,
  `isservice` tinyint(4) NOT NULL,
  `isquotation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `email_config` (`id`, `protocol`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `mailtype`, `isinvoice`, `isservice`, `isquotation`) VALUES ('1', 'ssmtp', 'ssl://ssmtp.gmail.com', '25', 'demo@gmail.coms', 'demo123456', 'html', '0', '0', '0');


#
# TABLE STRUCTURE FOR: employee_history
#

DROP TABLE IF EXISTS `employee_history`;

CREATE TABLE `employee_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `rate_type` int(11) NOT NULL,
  `hrate` float NOT NULL,
  `email` varchar(50) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `address_line_1` text NOT NULL,
  `address_line_2` text NOT NULL,
  `image` text,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: employee_salary_payment
#

DROP TABLE IF EXISTS `employee_salary_payment`;

CREATE TABLE `employee_salary_payment` (
  `emp_sal_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `generate_id` int(11) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `total_salary` decimal(18,2) NOT NULL DEFAULT '0.00',
  `total_working_minutes` varchar(50) NOT NULL,
  `working_period` varchar(50) NOT NULL,
  `payment_due` varchar(50) NOT NULL,
  `payment_date` varchar(50) NOT NULL,
  `paid_by` varchar(50) NOT NULL,
  `salary_month` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`emp_sal_pay_id`),
  KEY `employee_id` (`employee_id`),
  KEY `generate_id` (`generate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: employee_salary_setup
#

DROP TABLE IF EXISTS `employee_salary_setup`;

CREATE TABLE `employee_salary_setup` (
  `e_s_s_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(30) NOT NULL,
  `sal_type` varchar(30) NOT NULL,
  `salary_type_id` varchar(30) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `create_date` date DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_id` varchar(30) NOT NULL,
  `gross_salary` float NOT NULL,
  PRIMARY KEY (`e_s_s_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: expense
#

DROP TABLE IF EXISTS `expense`;

CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  `voucher_no` varchar(50) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: expense_item
#

DROP TABLE IF EXISTS `expense_item`;

CREATE TABLE `expense_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_item_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: invoice
#

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prevous_due` decimal(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `invoice` bigint(20) NOT NULL,
  `offline_invoice_no` bigint(20) DEFAULT NULL,
  `invoice_discount` decimal(10,2) DEFAULT '0.00' COMMENT 'invoice discount',
  `total_discount` decimal(10,2) DEFAULT '0.00' COMMENT 'total invoice discount',
  `total_tax` decimal(10,2) DEFAULT '0.00',
  `sales_by` varchar(50) NOT NULL,
  `invoice_details` text NOT NULL,
  `status` int(2) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `is_online` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: invoice_details
#

DROP TABLE IF EXISTS `invoice_details`;

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_details_id` varchar(100) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(12,0) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: language
#

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text,
  `french` text,
  `w` text,
  `kaby` text,
  `kotokoli` text,
  `losso` text,
  `moba` text,
  `tchamana` text,
  `espagnol` text,
  `atchanti` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=978 DEFAULT CHARSET=utf8;

INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('1', 'user_profile', 'User Profile', 'profile utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('2', 'setting', 'Setting', 'paramètre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('3', 'language', 'Language', 'Langue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('4', 'manage_users', 'Manage Users', 'Gérer les utilisateurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('5', 'add_user', 'Add User', 'Ajouter un utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('6', 'manage_company', 'Manage Company', 'Gérer la compagnie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('7', 'web_settings', 'Software Settings', 'Paramètres du logiciel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('8', 'manage_accounts', 'Manage Accounts', 'Gérer les comptes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('9', 'create_accounts', 'Create Account', 'Créer les comptes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('10', 'manage_bank', 'Manage Bank', 'Gérer les banques', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('11', 'add_new_bank', 'Add New Bank', 'Ajouter une nouvelle banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('12', 'settings', 'Settings', 'Paramètres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('13', 'closing_report', 'Closing Report', 'Rapport de fermeture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('14', 'closing', 'Closing', 'Fermeture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('15', 'cheque_manager', 'Cheque Manager', 'Gestionaire de chèque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('16', 'accounts_summary', 'Accounts Summary', 'Resumé des comptes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('17', 'expense', 'Expense', 'frais', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('18', 'income', 'Income', 'Revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('19', 'accounts', 'Accounts', 'Comptes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('20', 'stock_report', 'Stock Report', 'Rapport de stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('21', 'stock', 'Stock', 'Stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('22', 'pos_invoice', 'POS Sale', 'Vente(POS)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('23', 'manage_invoice', 'Manage Sale', 'Sortir une facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('24', 'new_invoice', 'New Sale', 'Vente ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('25', 'invoice', 'Sale', 'Vendeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('26', 'manage_purchase', 'Manage Purchase', 'Gérer les achats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('27', 'add_purchase', 'Add Purchase', 'Ajouter un achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('28', 'purchase', 'Purchase', 'Achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('29', 'paid_customer', 'Paid Customer', 'Clients(payé)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('30', 'manage_customer', 'Manage Customer', 'Gérer les clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('31', 'add_customer', 'Add Customer', 'Ajouter un client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('32', 'customer', 'Customer', 'Client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('33', 'supplier_payment_actual', 'Supplier Payment Ledger', 'paiment actuel du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('34', 'supplier_sales_summary', 'Supplier Sales Summary', 'Resumé des ventes  fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('35', 'supplier_sales_details', 'Supplier Sales Details', 'détails des ventes fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('36', 'supplier_ledger', 'Supplier Ledger', 'Registre fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('37', 'manage_supplier', 'Manage Supplier', 'Gérer les fournisseurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('38', 'add_supplier', 'Add Supplier', 'Ajouter un fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('39', 'supplier', 'Supplier', 'Fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('40', 'product_statement', 'Product Statement', 'Intitulé du produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('41', 'manage_product', 'Manage Product', 'Gérer les produits', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('42', 'add_product', 'Add Product', 'Ajouter un produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('43', 'product', 'Product', 'produits', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('44', 'manage_category', 'Manage Category', 'Gérer les catégories', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('45', 'add_category', 'Add Category', 'Ajouter une catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('46', 'category', 'Category', 'Catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('47', 'sales_report_product_wise', 'Sales Report (Product Wise)', 'Rapport des ventes par produits', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('48', 'purchase_report', 'Purchase Report', 'Rapport d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('49', 'sales_report', 'Sales Report', 'Rapport des ventes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('50', 'todays_report', 'Todays Report', 'Rapport d\'aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('51', 'report', 'Report', 'Rapport', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('52', 'dashboard', 'Dashboard', 'Tableau de bord', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('53', 'online', 'Online', 'en ligne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('54', 'logout', 'Logout', 'deconnexion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('55', 'change_password', 'Change Password', 'Modifier le mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('56', 'total_purchase', 'Total Purchase', 'achat total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('57', 'total_amount', 'Total Amount', 'montant total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('58', 'supplier_name', 'Supplier Name', 'nom du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('59', 'invoice_no', 'Invoice No', 'N° de la facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('60', 'purchase_date', 'Purchase Date', 'date d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('61', 'todays_purchase_report', 'Todays Purchase Report', 'Rapport d\'achat d\'aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('62', 'total_sales', 'Total Sales', 'ventes totales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('63', 'customer_name', 'Customer Name', 'Nom du client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('64', 'sales_date', 'Sales Date', 'date des ventes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('65', 'todays_sales_report', 'Todays Sales Report', 'Rapport des ventes d\'aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('66', 'home', 'Home', 'Accueil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('67', 'todays_sales_and_purchase_report', 'Todays sales and purchase report', 'Rapport des ventes et d\'achat d\'aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('68', 'total_ammount', 'Total Amount', 'montant total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('69', 'rate', 'Rate', 'PRIX U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('70', 'product_model', 'Product Model', 'modèle du produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('71', 'product_name', 'Product Name', 'DESIGNATION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('72', 'search', 'Search', 'Rechercher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('73', 'end_date', 'End Date', 'date de fin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('74', 'start_date', 'Start Date', 'Début', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('75', 'total_purchase_report', 'Total Purchase Report', 'rapport total d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('76', 'total_sales_report', 'Total Sales Report', 'rapport des ventes totales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('77', 'total_seles', 'Total Sales', 'Ventes total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('78', 'all_stock_report', 'All Stock Report', 'Rapport de tous le stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('79', 'search_by_product', 'Search By Product', 'Rechercher par produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('80', 'date', 'Date', 'Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('81', 'print', 'Print', 'imp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('82', 'stock_date', 'Stock Date', 'date de l\'entrée', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('83', 'print_date', 'Print Date', 'date d\'impression', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('84', 'sales', 'Sales', 'ventes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('85', 'price', 'Price', 'prix', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('86', 'sl', 'SL.', 'N°', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('87', 'add_new_category', 'Add new category', 'Ajouter une nouvelle catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('88', 'category_name', 'Category Name', 'Nom de la catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('89', 'save', 'Save', 'Enregistrer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('90', 'delete', 'Delete', 'Supprimer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('91', 'update', 'Update', 'mettre à jour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('92', 'action', 'Action', 'Action', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('93', 'manage_your_category', 'Manage your category ', 'Gérer vos catégories', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('94', 'category_edit', 'Category Edit', 'Création d\'une catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('95', 'status', 'Status', 'status', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('96', 'active', 'Active', 'Activer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('97', 'inactive', 'Inactive', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('98', 'save_changes', 'Save Changes', 'Enregistrer les changements', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('99', 'save_and_add_another', 'Save And Add Another', 'Enregistrer et ajouter un autre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('100', 'model', 'Model', 'modèle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('101', 'supplier_price', 'Supplier Price', 'prix fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('102', 'sell_price', 'Sale Price', 'prix de vente', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('103', 'image', 'Image', 'image', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('104', 'select_one', 'Select One', 'selectionner un', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('105', 'details', 'Details', 'Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('106', 'new_product', 'New Product', 'nouveau produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('107', 'add_new_product', 'Add new product', 'Ajouter un nouveau produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('108', 'barcode', 'Barcode', 'Barcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('109', 'qr_code', 'Qr-Code', 'qr code', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('110', 'product_details', 'Product Details', 'détails du produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('111', 'manage_your_product', 'Manage your product', 'Gérer vos produits', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('112', 'product_edit', 'Product Edit', 'Modification du produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('113', 'edit_your_product', 'Edit your product', 'Modifier votre produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('114', 'cancel', 'Cancel', 'Annuler', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('115', 'incl_vat', 'Incl. Vat', 'TVA inclus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('116', 'money', 'TK', 'Sommes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('117', 'grand_total', 'Grand Total', 'Montant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('118', 'quantity', 'Qnty', 'QTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('119', 'product_report', 'Product Report', 'rapport des produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('120', 'product_sales_and_purchase_report', 'Product sales and purchase report', 'Rapport des produits vendus et achetés', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('121', 'previous_stock', 'Previous Stock', 'Stock précedent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('122', 'out', 'Out', 'Sorties', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('123', 'in', 'In', 'Dans', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('124', 'to', 'To', 'à', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('125', 'previous_balance', 'Previous Balance', 'Solde précedent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('126', 'customer_address', 'Customer Address', 'Adresse du client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('127', 'customer_mobile', 'Customer Mobile', 'N° mobile du client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('128', 'customer_email', 'Customer Email', 'Email du client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('129', 'add_new_customer', 'Add new customer', 'Ajouter un nouveau client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('130', 'balance', 'Balance', 'Bilan(Solde)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('131', 'mobile', 'Mobile', 'mobile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('132', 'address', 'Address', 'Adresse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('133', 'manage_your_customer', 'Manage your customer', 'Gérer vos clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('134', 'customer_edit', 'Customer Edit', 'Modification du client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('135', 'paid_customer_list', 'Paid Customer List', 'Liste des clients comptant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('136', 'ammount', 'Amount', 'MONTANT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('137', 'customer_ledger', 'Customer Ledger', 'Registre du client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('138', 'manage_customer_ledger', 'Manage Customer Ledger', 'Gérer le registre client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('139', 'customer_information', 'Customer Information', 'Info client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('140', 'debit_ammount', 'Debit Amount', 'Montant du debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('141', 'credit_ammount', 'Credit Amount', 'Montant du crédit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('142', 'balance_ammount', 'Balance Amount', 'Montant du solde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('143', 'receipt_no', 'Receipt NO', 'n° du reçu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('144', 'description', 'Description', 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('145', 'debit', 'Debit', 'Debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('146', 'credit', 'Credit', 'Credit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('147', 'item_information', 'Item Information', 'Info article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('148', 'total', 'Total', 'total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('149', 'please_select_supplier', 'Please Select Supplier', 'Choisir un fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('150', 'submit', 'Submit', 'Soumettre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('151', 'submit_and_add_another', 'Submit And Add Another One', 'Soumettre et ajouter autre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('152', 'add_new_item', 'Add New Item', 'Ajouter un nouveau article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('153', 'manage_your_purchase', 'Manage your purchase', 'Gérer vos achats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('154', 'purchase_edit', 'Purchase Edit', 'modification d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('155', 'purchase_ledger', 'Purchase Ledger', 'Registre d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('156', 'invoice_information', 'Sale Information', 'Info facture achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('157', 'paid_ammount', 'Paid Amount', 'Montant Remis par le client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('158', 'discount', 'Dis./Pcs.', 'REMISE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('159', 'save_and_paid', 'Save And Paid', 'Enregistrer et payer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('160', 'payee_name', 'Payee Name', 'nom du bénéficiaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('161', 'manage_your_invoice', 'Manage your Sale', 'Gérer vos facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('162', 'invoice_edit', 'Sale Edit', 'Modification de la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('163', 'new_pos_invoice', 'New POS Sale', 'Nouvelle facture de vente', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('164', 'add_new_pos_invoice', 'Add new pos Sale', 'Ajouter une nouvelle facture pos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('165', 'product_id', 'Product ID', 'Identifiant du produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('166', 'paid_amount', 'Paid Amount', 'Montant payé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('167', 'authorised_by', 'Authorised By', 'Autorisée par', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('168', 'checked_by', 'Checked By', 'Vérifié par', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('169', 'received_by', 'Received By', 'Reçue par(client)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('170', 'prepared_by', 'Prepared By', 'préparé par', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('171', 'memo_no', 'Memo No', 'mémo n°', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('172', 'website', 'Website', 'site web/NIF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('173', 'email', 'Email', 'email', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('174', 'invoice_details', 'Sale Details', 'Détails de la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('175', 'reset', 'Reset', 'reset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('176', 'payment_account', 'Payment Account', 'compte de paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('177', 'bank_name', 'Bank Name', 'Nom de banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('178', 'cheque_or_pay_order_no', 'Cheque/Pay Order No', 'Chèque ou ordre de paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('179', 'payment_type', 'Payment Type', 'type de paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('180', 'payment_from', 'Payment From', 'formulaire de paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('181', 'payment_date', 'Payment Date', 'date de paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('182', 'add_income', 'Add Income', 'Ajouter des revenus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('183', 'cash', 'Cash', 'Trésorérie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('184', 'cheque', 'Cheque', 'Chèque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('185', 'pay_order', 'Pay Order', 'ordre de paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('186', 'payment_to', 'Payment To', 'payé à', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('187', 'total_outflow_ammount', 'Total Expense Amount', 'sortie totale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('188', 'transections', 'Transections', 'transsections', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('189', 'accounts_name', 'Accounts Name', 'Nom des comptes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('190', 'outflow_report', 'Expense Report', 'Rapport de sortie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('191', 'inflow_report', 'Income Report', 'Rapport d\'afflyx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('192', 'all', 'All', 'Tout', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('193', 'account', 'Account', 'Compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('194', 'from', 'From', 'de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('195', 'account_summary_report', 'Account Summary Report', 'Rapport syntétique de compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('196', 'search_by_date', 'Search By Date', 'Rechercher par date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('197', 'cheque_no', 'Cheque No', 'N° du chèque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('198', 'name', 'Name', 'nom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('199', 'closing_account', 'Closing Account', 'Fermeture de compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('200', 'close_your_account', 'Close your account', 'Fermer votre compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('201', 'last_day_closing', 'Last Day Closing', 'Fermeture du jour dernier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('202', 'cash_in', 'Cash In', 'Encaissé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('203', 'cash_out', 'Cash Out', 'Décaissé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('204', 'cash_in_hand', 'Cash In Hand', 'Liquidité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('205', 'add_new_bank', 'Add New Bank', 'Ajouter une nouvelle banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('206', 'day_closing', 'Day Closing', 'Fermeture du jour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('207', 'account_closing_report', 'Account Closing Report', 'Rapport de clôture de compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('208', 'last_day_ammount', 'Last Day Amount', 'Montant du jour dernier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('209', 'adjustment', 'Adjustment', 'Ajustement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('210', 'pay_type', 'Pay Type', 'type de paie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('211', 'customer_or_supplier', 'Customer,Supplier Or Others', 'Client ou fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('212', 'transection_id', 'Transections ID', 'identifiant de tanssection', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('213', 'accounts_summary_report', 'Accounts Summary Report', 'Rapport de synthèse des comptes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('214', 'bank_list', 'Bank List', 'Liste de banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('215', 'bank_edit', 'Bank Edit', 'Modification bancaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('216', 'debit_plus', 'Debit (+)', 'Debit(+)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('217', 'credit_minus', 'Credit (-)', 'credit(-)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('218', 'account_name', 'Account Name', 'Nom du compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('219', 'account_type', 'Account Type', 'Type de compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('220', 'account_real_name', 'Account Real Name', 'Nom réel du compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('221', 'manage_account', 'Manage Account', 'Gérer le compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('222', 'company_name', 'Boolisoft', 'Nom de la compagnie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('223', 'edit_your_company_information', 'Edit your company information', 'Edition info compagnie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('224', 'company_edit', 'Company Edit', 'Ajout d\'une compagnie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('225', 'admin', 'Admin', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('226', 'user', 'User', 'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('227', 'password', 'Password', 'mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('228', 'last_name', 'Last Name', 'Nom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('229', 'first_name', 'First Name', 'prénom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('230', 'add_new_user_information', 'Add new user information', 'Ajouter une nouvelle information utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('231', 'user_type', 'User Type', 'type d\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('232', 'user_edit', 'User Edit', 'mettre à jour l\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('233', 'rtr', 'RTR', 'rtr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('234', 'ltr', 'LTR', 'ltr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('235', 'ltr_or_rtr', 'LTR/RTR', 'ltr ou rtr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('236', 'footer_text', 'Footer Text', 'texte de bas de page', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('237', 'favicon', 'Favicon', 'L\'icône de favorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('238', 'logo', 'Logo', 'Logo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('239', 'update_setting', 'Update Setting', 'mettre à jour les paramètres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('240', 'update_your_web_setting', 'Update your web setting', 'mettre à jour les parmètres du web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('241', 'login', 'Login', 'Authentification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('242', 'your_strong_password', 'Your strong password', 'votre mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('243', 'your_unique_email', 'Your unique email', 'votre email unique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('244', 'please_enter_your_login_information', 'Please enter your login information.', 'Entrez les information de votre connexion svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('245', 'update_profile', 'Update Profile', 'mettre à jour le profile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('246', 'your_profile', 'Your Profile', 'votre profil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('247', 're_type_password', 'Re-Type Password', 'tapez encore votre mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('248', 'new_password', 'New Password', 'nouveau mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('249', 'old_password', 'Old Password', 'ancien mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('250', 'new_information', 'New Information', 'nouvelle info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('251', 'old_information', 'Old Information', 'anciennes informations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('252', 'change_your_information', 'Change your information', 'Modifier vos informations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('253', 'change_your_profile', 'Change your profile', 'Modifier votre profile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('254', 'profile', 'Profile', 'profile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('255', 'wrong_username_or_password', 'Wrong User Name Or Password !', 'mauvais mot de passe ou nom d\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('256', 'successfully_updated', 'Successfully Updated.', 'mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('257', 'blank_field_does_not_accept', 'Blank Field Does Not Accept !', 'Champs vides non acceptés', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('258', 'successfully_changed_password', 'Successfully changed password.', 'mot de passe changé avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('259', 'you_are_not_authorised_person', 'You are not authorised person !', 'vous n\'êtes pas autorisé(e)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('260', 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !', 'le mot de passe et le mot de passe de confirmation ne sont pas les mêmes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('261', 'new_password_at_least_six_character', 'New Password At Least 6 Character.', 'le nouveau mot de passe pas moins de 6 caractères', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('262', 'you_put_wrong_email_address', 'You put wrong email address !', 'vous avez entrez un mauvais email', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('263', 'cheque_ammount_asjusted', 'Cheque amount adjusted.', 'N° de chèque ajusté', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('264', 'successfully_payment_paid', 'Successfully Payment Paid.', 'le paiment est effectué avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('265', 'successfully_added', 'Successfully Added.', 'ajouté avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('266', 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.', 'mise à jour du montant de fermeture non effectuée', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('267', 'successfully_payment_received', 'Successfully Payment Received.', 'paiement reçu avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('268', 'already_inserted', 'Already Inserted !', 'Déjà inséré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('269', 'successfully_delete', 'Successfully Delete.', 'supprimé avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('270', 'successfully_created', 'Successfully Created.', 'crée avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('271', 'logo_not_uploaded', 'Logo not uploaded !', 'Le logo n\'est pas chargé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('272', 'favicon_not_uploaded', 'Favicon not uploaded !', 'l\'icône de favorie ne se télécharge pas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('273', 'supplier_mobile', 'Supplier Mobile', 'mobile fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('274', 'supplier_address', 'Supplier Address', 'adresse du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('275', 'supplier_details', 'Supplier Details', 'détails du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('276', 'add_new_supplier', 'Add New Supplier', 'Ajouter un nouveau fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('277', 'manage_suppiler', 'Manage Supplier', 'Gérer les fournisseurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('278', 'manage_your_supplier', 'Manage your supplier', 'Gérer vos fournisseurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('279', 'manage_supplier_ledger', 'Manage supplier ledger', 'Gérer le registrer des fournisseurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('280', 'invoice_id', 'Invoice ID', 'Id de la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('281', 'deposite_id', 'Deposite ID', 'Identifiant du dépôt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('282', 'supplier_actual_ledger', 'Supplier Payment Ledger', 'Registre actuel du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('283', 'supplier_information', 'Supplier Information', 'info fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('284', 'event', 'Event', 'évenement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('285', 'add_new_income', 'Add New Income', 'Ajouter un nouveau revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('286', 'add_expese', 'Add Expense', 'Ajouter une dépense', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('287', 'add_new_expense', 'Add New Expense', 'Ajouter une nouvelle dépense', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('288', 'total_inflow_ammount', 'Total Income Amount', 'montant d\'afflux total ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('289', 'create_new_invoice', 'Create New Sale', 'Créer une nouvelle facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('290', 'create_pos_invoice', 'Create POS Sale', 'Sortir la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('291', 'total_profit', 'Total Profit', 'profit total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('292', 'monthly_progress_report', 'Monthly Progress Report', 'Rapport de progression mensuelle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('293', 'total_invoice', 'Total Sale', 'Facture totale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('294', 'account_summary', 'Account Summary', 'Relevé de compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('295', 'total_supplier', 'Total Supplier', 'total des fournisseurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('296', 'total_product', 'Total Product', 'produit total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('297', 'total_customer', 'Total Customer', 'total des clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('298', 'supplier_edit', 'Supplier Edit', 'mise à jour du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('299', 'add_new_invoice', 'Add New Sale', 'Ajouter une nouvelle facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('300', 'add_new_purchase', 'Add new purchase', 'Ajouter un nouvel achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('301', 'currency', 'Currency', 'devise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('302', 'currency_position', 'Currency Position', 'position de la devise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('303', 'left', 'Left', 'gauche', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('304', 'right', 'Right', 'droite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('305', 'add_tax', 'Add Tax', 'Ajouter une taxe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('306', 'manage_tax', 'Manage Tax', 'Gérer les taxes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('307', 'add_new_tax', 'Add new tax', 'Ajouter une nouvelle taxe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('308', 'enter_tax', 'Enter Tax', 'Taxe d\'entrée', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('309', 'already_exists', 'Already Exists !', 'Existe déjà', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('310', 'successfully_inserted', 'Successfully Inserted.', 'insérer avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('311', 'tax', 'Tax', 'Taxe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('312', 'tax_edit', 'Tax Edit', 'mise à jour de la taxe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('313', 'product_not_added', 'Product not added !', 'produit non ajouté', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('314', 'total_tax', 'Total Tax', 'taxe totale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('315', 'manage_your_supplier_details', 'Manage your supplier details.', 'Gérer les détails sur vos fournisseurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('316', 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy', 'Description de la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('317', 'thank_you_for_choosing_us', 'Thank you very much for choosing us.', 'Merci de nous faire confiance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('318', 'billing_date', 'Billing Date', 'Date de facturation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('319', 'billing_to', 'Billing To', 'Facturé à', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('320', 'billing_from', 'Billing From', 'Facturé par', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('321', 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!', 'vous ne pouvez pas supprimer ce produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('322', 'old_customer', 'Old Customer', 'anciens clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('323', 'new_customer', 'New Customer', 'nouveau client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('324', 'new_supplier', 'New Supplier', 'nouveau fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('325', 'old_supplier', 'Old Supplier', 'ancien fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('326', 'credit_customer', 'Credit Customer', 'Clients (crédit)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('327', 'account_already_exists', 'This Account Already Exists !', 'Ce compte existe déjà', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('328', 'edit_income', 'Edit Income', 'Modifier le revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('329', 'you_are_not_access_this_part', 'You are not authorised person !', 'vous ne pouvez pas accéder à cette partie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('330', 'account_edit', 'Account Edit', 'Modifier le compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('331', 'due', 'Due', 'Payé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('332', 'expense_edit', 'Expense Edit', 'Modification des frais', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('333', 'please_select_customer', 'Please select customer !', 'Choisir un client svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('334', 'profit_report', 'Profit Report (Sale Wise)', 'Rapport de profit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('335', 'total_profit_report', 'Total profit report', 'rapport total des profits', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('336', 'please_enter_valid_captcha', 'Please enter valid captcha.', 'entrer le captcha valide svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('337', 'category_not_selected', 'Category not selected.', 'Catégorie non sélectionnée', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('338', 'supplier_not_selected', 'Supplier not selected.', 'fournisseur non sélectionné', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('339', 'please_select_product', 'Please select product.', 'Choisir un produit svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('340', 'product_model_already_exist', 'Product model already exist !', 'le modèle du produit existe déjà', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('341', 'invoice_logo', 'Sale Logo', 'Logo de la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('342', 'available_qnty', 'Av. Qnty.', 'Qté disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('343', 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !', 'vous ne pouvez pas payer plus que la quantité disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('344', 'customer_details', 'Customer details', 'Détails sur le client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('345', 'manage_customer_details', 'Manage customer details.', 'Gérer les détails clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('346', 'site_key', 'Captcha Site Key', 'clé du site', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('347', 'secret_key', 'Captcha Secret Key', 'clé secrète', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('348', 'captcha', 'Captcha', 'captcha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('349', 'cartoon_quantity', 'Cartoon Quantity', 'Qté maximale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('350', 'total_cartoon', 'Total Cartoon', 'total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('351', 'cartoon', 'Cartoon', 'max', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('352', 'item_cartoon', 'Item/Cartoon', 'qté(à commander) max de l\'article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('353', 'product_and_supplier_did_not_match', 'Product and supplier did not match !', 'le produit et le fournisseur ne correspondent pas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('354', 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.', 'Si tu veux modifier l\'achat sélectionne d\'abord le fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('355', 'item', 'Item', 'article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('356', 'manage_your_credit_customer', 'Manage your credit customer', 'Gérer les crédits des clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('357', 'total_quantity', 'Total Quantity', 'quantité totale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('358', 'quantity_per_cartoon', 'Quantity per cartoon', 'quantité par carton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('359', 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here', 'Scan de code-barres ou QR-code ici', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('360', 'synchronizer_setting', 'Synchronizer Setting', 'paramètre de synchronisation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('361', 'data_synchronizer', 'Data Synchronizer', 'Synchronisation des données', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('362', 'hostname', 'Host name', 'Nom d\'hôte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('363', 'username', 'User Name', 'nom d\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('364', 'ftp_port', 'FTP Port', 'port ftp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('365', 'ftp_debug', 'FTP Debug', 'ftp debug', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('366', 'project_root', 'Project Root', 'racine du projet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('367', 'please_try_again', 'Please try again', 'Réessayer svp !', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('368', 'save_successfully', 'Save successfully', 'Enregister avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('369', 'synchronize', 'Synchronize', 'synchroniser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('370', 'internet_connection', 'Internet Connection', 'connection internet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('371', 'outgoing_file', 'Outgoing File', 'fichier sortant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('372', 'incoming_file', 'Incoming File', 'Fichier du revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('373', 'ok', 'Ok', 'ok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('374', 'not_available', 'Not Available', 'non disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('375', 'available', 'Available', 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('376', 'download_data_from_server', 'Download data from server', 'télécharger les données du serveur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('377', 'data_import_to_database', 'Data import to database', 'Importation des données vers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('378', 'data_upload_to_server', 'Data uplod to server', 'upload des données vers le serveur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('379', 'please_wait', 'Please Wait', 'Patienter svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('380', 'ooops_something_went_wrong', 'Oooops Something went wrong !', 'ooops quelque chose tourne mal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('381', 'upload_successfully', 'Upload successfully', 'mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('382', 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration', 'impossible d\'uploader le fichier, voir la configuration svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('383', 'please_configure_synchronizer_settings', 'Please configure synchronizer settings', 'configurer les paramètres de synchronisation svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('384', 'download_successfully', 'Download successfully', 'Téléchargé avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('385', 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration', 'impossible de télécharger le fichier, voir la configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('386', 'data_import_first', 'Data import past', 'importer les données en premier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('387', 'data_import_successfully', 'Data import successfully', 'importation des données avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('388', 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file', 'impossible d\'importer le fichier, voir la configuration svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('389', 'total_sale_ctn', 'Total Sale Ctn', 'vente total ctn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('390', 'in_qnty', 'In Qnty.', 'Qté disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('391', 'out_qnty', 'Out Qnty.', 'Qté sortie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('392', 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)', 'Rapport de stock fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('393', 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)', 'Tous les rapoort de stock fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('394', 'select_supplier', 'Select Supplier', 'sélectionner un fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('395', 'stock_report_product_wise', 'Stock Report (Product Wise)', 'Rapport de stock par produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('396', 'phone', 'Phone', 'téléphone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('397', 'select_product', 'Select Product', 'sélectionner un produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('398', 'in_quantity', 'In Qnty.', 'Qté disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('399', 'out_quantity', 'Out Qnty.', 'Qté sortie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('400', 'in_taka', 'In TK.', 'en FCFA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('401', 'out_taka', 'Out TK.', 'en dehors de la devise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('402', 'commission', 'Commission', 'Commission', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('403', 'generate_commission', 'Generate Commssion', 'commission générée', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('404', 'commission_rate', 'Commission Rate', 'prix de la commission', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('405', 'total_ctn', 'Total Ctn.', 'total ctn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('406', 'per_pcs_commission', 'Per PCS Commission', 'commission par pièces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('407', 'total_commission', 'Total Commission', 'total commission', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('408', 'enter', 'Enter', 'Entrer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('409', 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.', 'ajouter client de passage comme client par défaut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('410', 'supplier_ammount', 'Supplier Amount', 'montant fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('411', 'my_sale_ammount', 'My Sale Amount', 'Montant de mes ventes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('412', 'signature_pic', 'Signature Picture', 'image de la signature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('413', 'branch', 'Branch', 'Branche', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('414', 'ac_no', 'A/C Number', 'Numero A/C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('415', 'ac_name', 'A/C Name', 'Nom A/C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('416', 'bank_transaction', 'Bank Transaction', 'Transaction bancaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('417', 'bank', 'Bank', 'Banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('418', 'withdraw_deposite_id', 'Withdraw / Deposite ID', 'identifiant de retrait du dépôt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('419', 'bank_ledger', 'Bank Ledger', 'Grand livre de banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('420', 'note_name', 'Note Name', 'titre de la note', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('421', 'pcs', 'Pcs.', 'par pièces(articles)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('422', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('423', '2', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('424', '5', '5', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('425', '10', '10', '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('426', '20', '20', '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('427', '50', '50', '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('428', '100', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('429', '500', '500', '500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('430', '1000', '1000', '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('431', 'total_discount', 'Total Discount', 'remise totale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('432', 'product_not_found', 'Product not found !', 'produit non trouvé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('433', 'this_is_not_credit_customer', 'This is not credit customer !', 'ce n\'est pas un client créditeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('434', 'personal_loan', 'Personal Loan', 'Prêt (personnel)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('435', 'add_person', 'Add Person', 'Ajouter une personne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('436', 'add_loan', 'Add Loan', 'Ajouter un prêt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('437', 'add_payment', 'Add Payment', 'Ajouter un paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('438', 'manage_person', 'Manage Person', 'Gérer les personnes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('439', 'personal_edit', 'Person Edit', 'modification personnelle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('440', 'person_ledger', 'Person Ledger', 'registre personnel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('441', 'backup_restore', 'Backup ', 'Restauration de la sauvegarde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('442', 'database_backup', 'Database backup', 'sauvegarde de la base de données', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('443', 'file_information', 'File information', 'Info fichier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('444', 'filename', 'Filename', 'Nom du fichier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('445', 'size', 'Size', 'taille', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('446', 'backup_date', 'Backup date', 'Date de sauvegarde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('447', 'backup_now', 'Backup now', 'Sauvegarder maintenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('448', 'restore_now', 'Restore now', 'restaurer maintenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('449', 'are_you_sure', 'Are you sure ?', 'Vous êtes sûr ?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('450', 'download', 'Download', 'Télécharger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('451', 'backup_and_restore', 'Backup', 'Sauvegarde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('452', 'backup_successfully', 'Backup successfully', 'Sauvegardée avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('453', 'delete_successfully', 'successfully Deleted', 'Supprimer avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('454', 'stock_ctn', 'Stock/Qnt', 'stock max', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('455', 'unit', 'Unit', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('456', 'meter_m', 'Meter (M)', 'Mètre(M)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('457', 'piece_pc', 'Piece (Pc)', 'par article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('458', 'kilogram_kg', 'Kilogram (Kg)', 'kG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('459', 'stock_cartoon', 'Stock Cartoon', 'stock maximal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('460', 'add_product_csv', 'Add Product (CSV)', 'Ajouter un produit csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('461', 'import_product_csv', 'Import product (CSV)', 'importer les produits en csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('462', 'close', 'Close', 'Fermer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('463', 'download_example_file', 'Download example file.', 'Télécharger le fichier d\'exemple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('464', 'upload_csv_file', 'Upload CSV File', 'uploader le fichier csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('465', 'csv_file_informaion', 'CSV File Information', 'info csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('466', 'out_of_stock', 'Out Of Stock', 'En rupture de stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('467', 'others', 'Others', 'autres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('468', 'full_paid', 'Full Paid', 'Entièrement payé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('469', 'successfully_saved', 'Your Data Successfully Saved', 'enregistré avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('470', 'manage_loan', 'Manage Loan', 'Gérer les prêts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('471', 'receipt', 'Receipt', 'reçu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('472', 'payment', 'Payment', 'paiement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('473', 'cashflow', 'Daily Cash Flow', 'Flux de trésorérie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('474', 'signature', 'Signature', 'signature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('475', 'supplier_reports', 'Supplier Reports', 'Rapports fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('476', 'generate', 'Generate', 'générer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('477', 'todays_overview', 'Todays Overview', 'vue d\'ensemble aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('478', 'last_sales', 'Last Sales', 'Dernière vente', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('479', 'manage_transaction', 'Manage Transaction', 'Gérer les transactions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('480', 'daily_summary', 'Daily Summary', 'Resumé quotidienne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('481', 'daily_cash_flow', 'Daily Cash Flow', 'trésorerie quotidienne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('482', 'custom_report', 'Custom Report', 'Rapport client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('483', 'transaction', 'Transaction', 'transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('484', 'receipt_amount', 'Receipt Amount', 'montant du reçu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('485', 'transaction_details_datewise', 'Transaction Details Datewise', 'détails des transactions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('486', 'cash_closing', 'Cash Closing', 'Clôture de caisse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('487', 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.', 'vous ne pouvez pas achéter plus que la quantité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('488', 'supplier_id', 'Supplier ID', 'identifiant du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('489', 'category_id', 'Category ID', 'Id catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('490', 'select_report', 'Select Report', 'sélectionner un rapport', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('491', 'supplier_summary', 'Supplier summary', 'Résumé fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('492', 'sales_payment_actual', 'Sales payment actual', 'Ventes actuellement payées', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('493', 'today_already_closed', 'Today already closed.', 'Déjà fermé pour aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('494', 'root_account', 'Root Account', 'racine du compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('495', 'office', 'Office', 'Bureau', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('496', 'loan', 'Loan', 'prêt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('497', 'transaction_mood', 'Transaction Mood', 'humeur transactionnelle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('498', 'select_account', 'Select Account', 'sélectionner un compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('499', 'add_receipt', 'Add Receipt', 'Ajouter un réçu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('500', 'update_transaction', 'Update Transaction', 'mettre à jour la transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('501', 'no_stock_found', 'No Stock Found !', 'stock non trouvé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('502', 'admin_login_area', 'Admin Login Area', 'Fénêtre d\'authentifiction admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('503', 'print_qr_code', 'Print QR Code', 'imp. QR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('504', 'discount_type', 'Discount Type', 'Type de remise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('505', 'discount_percentage', 'Discount', '%Remise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('506', 'fixed_dis', 'Fixed Dis.', 'disposition fixe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('507', 'return', 'Return', 'Retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('508', 'stock_return_list', 'Stock Return List', 'Liste de retour de stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('509', 'wastage_return_list', 'Wastage Return List', 'liste des retours des déchets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('510', 'return_invoice', 'Sale Return', 'Retour facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('511', 'sold_qty', 'Sold Qty', 'qté vendue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('512', 'ret_quantity', 'Return Qty', 'quantité de retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('513', 'deduction', 'Deduction', 'deduction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('514', 'check_return', 'Check Return', 'retour de chèque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('515', 'reason', 'Reason', 'raison', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('516', 'usablilties', 'Usability', 'utilisabilités', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('517', 'adjs_with_stck', 'Adjust With Stock', 'Ajuster avec le stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('518', 'return_to_supplier', 'Return To Supplier', 'retourner au fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('519', 'wastage', 'Wastage', 'gaspillage', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('520', 'to_deduction', 'Total Deduction ', 'à la déduction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('521', 'nt_return', 'Net Return Amount', 'non retourné', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('522', 'return_list', 'Return List', 'liste de retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('523', 'add_return', 'Add Return', 'Ajouter un retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('524', 'per_qty', 'Purchase Qty', 'par qté', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('525', 'return_supplier', 'Supplier Return', 'retour fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('526', 'stock_purchase', 'Stock Purchase Price', 'Marchandises achetées', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('527', 'stock_sale', 'Stock Sale Price', 'Vente des marchandises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('528', 'supplier_return', 'Supplier Return', 'retour fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('529', 'purchase_id', 'Purchase ID', 'identifiant de l\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('530', 'return_id', 'Return ID', 'identifiant de retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('531', 'supplier_return_list', 'Supplier Return List', 'liste des retours fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('532', 'c_r_slist', 'Stock Return Stock', 'Liste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('533', 'wastage_list', 'Wastage List', 'liste de gaspillage', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('534', 'please_input_correct_invoice_id', 'Please Input a Correct Sale ID', 'Entrez l\'identifiant valide de la facture d\'achat svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('535', 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID', 'Entrez l\'indentifiant correct de l\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('536', 'add_more', 'Add More', 'Ajouter plus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('537', 'prouct_details', 'Product Details', 'Détails des produits', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('538', 'prouct_detail', 'Product Details', 'Détail du produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('539', 'stock_return', 'Stock Return', 'Retour du stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('540', 'choose_transaction', 'Select Transaction', 'Choisir la transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('541', 'transection_category', 'Select  Category', 'catégorie de transsection', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('542', 'transaction_categry', 'Select Category', 'Catégorie de transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('543', 'search_supplier', 'Search Supplier', 'Rechercher un fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('544', 'customer_id', 'Customer ID', 'Identifiant du client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('545', 'search_customer', 'Search Customer Invoice', 'Rechercher un client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('546', 'serial_no', 'SN', 'n° de série', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('547', 'item_discount', 'Item Discount', 'Remise sur l\'article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('548', 'invoice_discount', 'Sale Discount', 'Remise sur la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('549', 'add_unit', 'Add Unit', 'Ajouter une unité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('550', 'manage_unit', 'Manage Unit', 'Gérer les unités', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('551', 'add_new_unit', 'Add New Unit', 'Ajouter une nouvelle unité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('552', 'unit_name', 'Unit Name', 'intitulé de l\'unité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('553', 'payment_amount', 'Payment Amount', 'Montant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('554', 'manage_your_unit', 'Manage Your Unit', 'Gérer vos unités', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('555', 'unit_id', 'Unit ID', 'identifiant de l\'unité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('556', 'unit_edit', 'Unit Edit', 'mise à jour de l\'unité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('557', 'vat', 'Vat', 'T.V.A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('558', 'sales_report_category_wise', 'Sales Report (Category wise)', 'Rapport des ventes par catégories', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('559', 'purchase_report_category_wise', 'Purchase Report (Category wise)', 'Rapport d\'acchat par catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('560', 'category_wise_purchase_report', 'Category wise purchase report', 'Rapport d\'achat par catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('561', 'category_wise_sales_report', 'Category wise sales report', 'Rapport de vente par catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('562', 'best_sale_product', 'Best Sale Product', 'Meilleur produit vendu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('563', 'all_best_sales_product', 'All Best Sales Products', 'Meilleur produits vendus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('564', 'todays_customer_receipt', 'Todays Customer Receipt', 'Facture des clients d\'aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('565', 'not_found', 'Record not found', 'non trouvé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('566', 'collection', 'Collection', 'Collection', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('567', 'increment', 'Increment', 'incrementer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('568', 'accounts_tree_view', 'Accounts Tree View', 'Arborescence des comptes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('569', 'debit_voucher', 'Debit Voucher', 'Ticket(debit)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('570', 'voucher_no', 'Voucher No', 'n° du bon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('571', 'credit_account_head', 'Credit Account Head', 'En-tête de compte de crédit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('572', 'remark', 'Remark', 'remarque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('573', 'code', 'Code', 'code', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('574', 'amount', 'Amount', 'Montant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('575', 'approved', 'Approved', 'Approuvé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('576', 'debit_account_head', 'Debit Account Head', 'en-tête  du compte debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('577', 'credit_voucher', 'Credit Voucher', 'Ticket crédit(Bon)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('578', 'find', 'Find', 'trouver', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('579', 'transaction_date', 'Transaction Date', 'date de la transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('580', 'voucher_type', 'Voucher Type', 'type de bon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('581', 'particulars', 'Particulars', 'détails', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('582', 'with_details', 'With Details', 'avec les détails', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('583', 'general_ledger', 'General Ledger', 'Registre général', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('584', 'general_ledger_of', 'General ledger of', 'Registre général de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('585', 'pre_balance', 'Pre Balance', 'pre-solde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('586', 'current_balance', 'Current Balance', 'Solde actuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('587', 'to_date', 'To Date', 'à ce jour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('588', 'from_date', 'From Date', 'à partir de la date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('589', 'trial_balance', 'Trial Balance', 'balance de vérification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('590', 'authorized_signature', 'Authorized Signature', 'Signature autorisée', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('591', 'chairman', 'Chairman', 'Responsable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('592', 'total_income', 'Total Income', 'revenu total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('593', 'statement_of_comprehensive_income', 'Statement of Comprehensive Income', 'déclaration de revenu complet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('594', 'profit_loss', 'Profit Loss', 'Perte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('595', 'cash_flow_report', 'Cash Flow Report', 'Rapport de caisse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('596', 'cash_flow_statement', 'Cash Flow Statement', 'Etat des flux de trésorérie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('597', 'amount_in_dollar', 'Amount In Dollar', 'Montant en FCFA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('598', 'opening_cash_and_equivalent', 'Opening Cash and Equivalent', 'ouverture de caisse et équivalent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('599', 'coa_print', 'Coa Print', 'impression', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('600', 'cash_flow', 'Cash Flow', 'Flux de trésorérie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('601', 'cash_book', 'Cash Book', 'Livre de caisse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('602', 'bank_book', 'Bank Book', 'Livret de banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('603', 'c_o_a', 'Chart of Account', 'Acte de commerce', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('604', 'journal_voucher', 'Journal Voucher', 'Bon du journal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('605', 'contra_voucher', 'Contra Voucher', 'Bon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('606', 'voucher_approval', 'Vouchar Approval', 'Approbation du bon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('607', 'supplier_payment', 'Supplier Payment', 'paiement fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('608', 'customer_receive', 'Customer Receive', 'Le cleint a reçu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('609', 'gl_head', 'General Head', 'Chef général', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('610', 'account_code', 'Account Head', 'Code du compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('611', 'opening_balance', 'Opening Balance', 'Solde d\'ouverture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('612', 'head_of_account', 'Head of Account', 'Entête du compte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('613', 'inventory_ledger', 'Inventory Ledger', 'Registre d\'inventaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('614', 'newpassword', 'New Password', 'nouveau mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('615', 'password_recovery', 'Password Recovery', 'récupération de mot de passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('616', 'forgot_password', 'Forgot Password ??', 'mot de passe oublié', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('617', 'send', 'Send', 'envoyer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('618', 'due_report', 'Due Report', 'Rapport d\'attente', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('619', 'due_amount', 'Due Amount', 'Montant dû', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('620', 'download_sample_file', 'Download Sample File', 'Télécharger un exemple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('621', 'customer_csv_upload', 'Customer Csv Upload', 'upload du csv client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('622', 'csv_supplier', 'Csv Upload Supplier', 'csv fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('623', 'csv_upload_supplier', 'Csv Upload Supplier', 'upload du csv fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('624', 'previous', 'Previous', 'Dettes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('625', 'net_total', 'Net Total', 'net total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('626', 'currency_list', 'Currency List', 'Liste des devises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('627', 'currency_name', 'Currency Name', 'Nom de la devise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('628', 'currency_icon', 'Currency Symbol', 'icon de la devise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('629', 'add_currency', 'Add Currency', 'Ajouter une devise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('630', 'role_permission', 'Role Permission', 'permission ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('631', 'role_list', 'Role List', 'liste de rôle ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('632', 'user_assign_role', 'User Assign Role', 'assigner un rôle à l\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('633', 'permission', 'Permission', 'permission', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('634', 'add_role', 'Add Role', 'Ajouter un rôle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('635', 'add_module', 'Add Module', 'Ajouter un module', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('636', 'module_name', 'Module Name', 'nom du module', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('637', 'office_loan', 'Office Loan', 'Prêt (bureau)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('638', 'add_menu', 'Add Menu', 'Ajouter un menu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('639', 'menu_name', 'Menu Name', 'nom du menu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('640', 'sl_no', 'Sl No', 'n° ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('641', 'create', 'Create', 'Créer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('642', 'read', 'Read', 'lire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('643', 'role_name', 'Role Name', 'nom du rôle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('644', 'qty', 'Quantity', 'qté', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('645', 'max_rate', 'Max Rate', 'pourcentage max', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('646', 'min_rate', 'Min Rate', '% min', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('647', 'avg_rate', 'Average Rate', 'Taux moyen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('648', 'role_permission_added_successfully', 'Role Permission Successfully Added', 'permission ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('649', 'update_successfully', 'Successfully Updated', 'mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('650', 'role_permission_updated_successfully', 'Role Permission Successfully Updated ', 'permission mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('651', 'shipping_cost', 'Shipping Cost', 'Frais de port', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('652', 'in_word', 'In Word ', 'en lettre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('653', 'shipping_cost_report', 'Shipping Cost Report', 'Rapport des frais de port', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('654', 'cash_book_report', 'Cash Book Report', 'Rapport de livre de caisse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('655', 'inventory_ledger_report', 'Inventory Ledger Report', 'Rapport du registre d\'inventaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('656', 'trial_balance_with_opening_as_on', 'Trial Balance With Opening As On', 'balance de vérification avec ouverture au', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('657', 'type', 'Type', 'type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('658', 'taka_only', 'Taka Only', 'FCFA seulement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('659', 'item_description', 'Desc', 'Description de l\'article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('660', 'sold_by', 'Sold By', 'vendu par', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('661', 'user_wise_sales_report', 'User Wise Sales Report', 'rapport des ventes par utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('662', 'user_name', 'User Name', 'nom d\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('663', 'total_sold', 'Total Sold', 'Total vendu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('664', 'user_wise_sale_report', 'User Wise Sales Report', 'rapport de vente utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('665', 'barcode_or_qrcode', 'Barcode/QR-code', 'Barcode ou Qrcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('666', 'category_csv_upload', 'Category Csv  Upload', 'Upload des catégories en csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('667', 'unit_csv_upload', 'Unit Csv Upload', 'upload unité csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('668', 'invoice_return_list', 'Sales Return list', 'Liste des retours de facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('669', 'invoice_return', 'Sales Return', 'Retour de la facture d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('670', 'tax_report', 'Tax Report', 'Rapport des taxes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('671', 'select_tax', 'Select Tax', 'sélectionner une taxe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('672', 'hrm', 'HRM', 'Ressources humaines', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('673', 'employee', 'Employee', 'employés', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('674', 'add_employee', 'Add Employee', 'Ajouter un employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('675', 'manage_employee', 'Manage Employee', 'Gérer les employés', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('676', 'attendance', 'Attendance', 'Présence', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('677', 'add_attendance', 'Attendance', 'Déclarer une présence', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('678', 'manage_attendance', 'Manage Attendance', 'Gérer les présences', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('679', 'payroll', 'Payroll', 'paie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('680', 'add_payroll', 'Payroll', 'Ajouter une paie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('681', 'manage_payroll', 'Manage Payroll', 'Gérer la paie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('682', 'employee_type', 'Employee Type', 'type d\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('683', 'employee_designation', 'Employee Designation', 'Poste de l\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('684', 'designation', 'Designation', 'Designation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('685', 'add_designation', 'Add Designation', 'Ajouter un poste/spécialité', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('686', 'manage_designation', 'Manage Designation', 'Gérer la désignation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('687', 'designation_update_form', 'Designation Update form', 'upload de la designation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('688', 'picture', 'Picture', 'photo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('689', 'country', 'Country', 'Pays', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('690', 'blood_group', 'Blood Group', 'Groupe sanguin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('691', 'address_line_1', 'Address Line 1', 'Adresse ligne 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('692', 'address_line_2', 'Address Line 2', 'Adresse ligne 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('693', 'zip', 'Zip code', 'zip', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('694', 'city', 'City', 'Ville', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('695', 'hour_rate_or_salary', 'Houre Rate/Salary', 'taux horaire ou salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('696', 'rate_type', 'Rate Type', 'type de pourcentage', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('697', 'hourly', 'Hourly', 'toutes les heures', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('698', 'salary', 'Salary', 'salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('699', 'employee_update', 'Employee Update', 'mise à jour de l\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('700', 'checkin', 'Check In', 'Enregistrement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('701', 'employee_name', 'Employee Name', 'nom de l\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('702', 'checkout', 'Check Out', 'Vérifier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('703', 'confirm_clock', 'Confirm Clock', 'Confirmer l\'heure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('704', 'stay', 'Stay Time', 'rester', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('705', 'sign_in', 'Sign In', 's\'identifier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('706', 'check_in', 'Check In', 'Enregistrement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('707', 'single_checkin', 'Single Check In', 'Enregistrement unique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('708', 'bulk_checkin', 'Bulk Check In', 'Enregistrement en masse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('709', 'successfully_checkout', 'Successfully Checkout', 'payé avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('710', 'attendance_report', 'Attendance Report', 'Rapport de présence', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('711', 'datewise_report', 'Date Wise Report', 'Rapport par date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('712', 'employee_wise_report', 'Employee Wise Report', 'rapport sur l\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('713', 'date_in_time_report', 'Date In Time Report', 'Rapport par date à l\'heure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('714', 'request', 'Request', 'requête', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('715', 'sign_out', 'Sign Out', 'se déconnecter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('716', 'work_hour', 'Work Hours', 'heure de travail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('717', 's_time', 'Start Time', 'temps', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('718', 'e_time', 'In Time', 'à l\'heure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('719', 'salary_benefits_type', 'Benefits Type', 'type de salaire du bénéficiaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('720', 'salary_benefits', 'Salary Benefits', 'bénéficiaire du salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('721', 'beneficial_list', 'Benefit List', 'Liste des avantages', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('722', 'add_beneficial', 'Add Benefits', 'Ajouter un bénéficiaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('723', 'add_benefits', 'Add Benefits', 'Ajouter les bénéficiaires', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('724', 'benefits_list', 'Benefit List', 'Liste des prestations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('725', 'benefit_type', 'Benefit Type', 'Type de prestation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('726', 'benefits', 'Benefit', 'Prestations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('727', 'manage_benefits', 'Manage Benefits', 'Gérer les avantages', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('728', 'deduct', 'Deduct', 'deduire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('729', 'add', 'Add', 'Ajouter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('730', 'add_salary_setup', 'Add Salary Setup', 'Configuration de salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('731', 'manage_salary_setup', 'Manage Salary Setup', 'Gérer les paramètres de salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('732', 'basic', 'Basic', 'Base', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('733', 'salary_type', 'Salary Type', 'type de salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('734', 'addition', 'Addition', 'Addition', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('735', 'gross_salary', 'Gross Salary', 'Salaire brut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('736', 'set', 'Set', 'Ensemble(montrer)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('737', 'salary_generate', 'Salary Generate', 'salaire généré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('738', 'manage_salary_generate', 'Manage Salary Generate', 'Gérer les salaires générés', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('739', 'sal_name', 'Salary Name', 'nom du vendeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('740', 'gdate', 'Generated Date', 'Date générale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('741', 'generate_by', 'Generated By', 'généré par', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('742', 'the_salary_of', 'The Salary of ', 'le salaire de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('743', 'already_generated', ' Already Generated', 'Déjà généré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('744', 'salary_month', 'Salary Month', 'salaire mensuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('745', 'successfully_generated', 'Successfully Generated', 'généré avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('746', 'salary_payment', 'Salary Payment', 'paiement de salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('747', 'employee_salary_payment', 'Employee Salary Payment', 'salaire de l\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('748', 'total_salary', 'Total Salary', 'salaire total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('749', 'total_working_minutes', 'Total Working Hours', 'temps total travaillé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('750', 'working_period', 'Working Period', 'temps de travail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('751', 'paid_by', 'Paid By', 'payé par ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('752', 'pay_now', 'Pay Now ', 'payer maintenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('753', 'confirm', 'Confirm', 'Confirmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('754', 'successfully_paid', 'Successfully Paid', 'payé avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('755', 'add_incometax', 'Add Income Tax', 'Ajouter l\'impôt sur le revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('756', 'setup_tax', 'Setup Tax', 'Mise en place des taxes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('757', 'start_amount', 'Start Amount', 'montant  de départ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('758', 'end_amount', 'End Amount', 'fin du montant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('759', 'tax_rate', 'Tax Rate', '% taxe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('760', 'setup', 'Setup', 'Mettre en place', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('761', 'manage_income_tax', 'Manage Income Tax', 'Gérer les taxe sur revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('762', 'income_tax_updateform', 'Income tax Update form', 'Modification de la taxe du revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('763', 'positional_information', 'Positional Information', 'information de position', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('764', 'personal_information', 'Personal Information', 'détails personnel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('765', 'timezone', 'Time Zone', 'timezone ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('766', 'sms', 'SMS', 'sms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('767', 'sms_configure', 'SMS Configure', 'configuration du sms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('768', 'url', 'URL', 'url', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('769', 'sender_id', 'Sender ID', 'identifiant de l\'expéditeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('770', 'api_key', 'Api Key', 'Clé d\'api', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('771', 'gui_pos', 'GUI POS', 'POS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('772', 'manage_service', 'Manage Service', 'Gérer le service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('773', 'service', 'Service', 'Service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('774', 'add_service', 'Add Service', 'Ajouter un service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('775', 'service_edit', 'Service Edit', 'mise à jour du service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('776', 'service_csv_upload', 'Service CSV Upload', 'upload du csv service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('777', 'service_name', 'Service Name', 'nom du service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('778', 'charge', 'Charge', 'Charge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('779', 'service_invoice', 'Service Invoice', 'facture du service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('780', 'service_discount', 'Service Discount', 'remise sur service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('781', 'hanging_over', 'ETD', 'ETD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('782', 'service_details', 'Service Details', 'détails du service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('783', 'tax_settings', 'Tax Settings', 'paramètres des taxes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('784', 'default_value', 'Default Value', 'Valeur par défaut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('785', 'number_of_tax', 'Number of Tax', 'nombre de taxe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('786', 'please_select_employee', 'Please Select Employee', 'Choisir un employé svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('787', 'manage_service_invoice', 'Manage Service Invoice', 'Gérer la facture du service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('788', 'update_service_invoice', 'Update Service Invoice', 'mettre à jour le service facturation achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('789', 'customer_wise_tax_report', 'Customer Wise  Tax Report', 'Taxe client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('790', 'service_id', 'Service Id', 'identifiant du service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('791', 'invoice_wise_tax_report', 'Invoice Wise Tax Report', 'Rapport sur les taxe sur les factures d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('792', 'reg_no', 'Reg No', 'n° du registre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('793', 'update_now', 'Update Now', 'mettre à jour maintenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('794', 'import', 'Import', 'importer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('795', 'add_expense_item', 'Add Expense Item', 'Ajouter les motifs de dépense', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('796', 'manage_expense_item', 'Manage Expense Item', 'Gérer les motifs de dépenses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('797', 'add_expense', 'Add Expense', 'Ajouter les dépenses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('798', 'manage_expense', 'Manage Expense', 'Gérer les dépenses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('799', 'expense_statement', 'Expense Statement', 'note de frais', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('800', 'expense_type', 'Expense Type', 'type de dépense', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('801', 'expense_item_name', 'Expense Item Name', 'Motif de la dépense', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('802', 'stock_purchase_price', 'Stock Purchase Price', 'prix d\'achat des marchandises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('803', 'purchase_price', 'Purchase Price', 'Prix d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('804', 'customer_advance', 'Customer Advance', 'Les avances des clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('805', 'advance_type', 'Advance Type', 'Type d\'avance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('806', 'restore', 'Restore', 'restaurer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('807', 'supplier_advance', 'Supplier Advance', 'avance du fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('808', 'please_input_correct_invoice_no', 'Please Input Correct Invoice NO', 'Entrez le n° correcte de votre facture d\'achat svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('809', 'backup', 'Back Up', 'Sauvegarder', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('810', 'app_setting', 'App Settings', 'Paramètres des serveurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('811', 'local_server_url', 'Local Server Url', 'serveur local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('812', 'online_server_url', 'Online Server Url', 'l\'url du serveur en ligne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('813', 'connet_url', 'Connected Hotspot Ip/url', 'Url de connection', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('814', 'update_your_app_setting', 'Update Your App Setting', 'mettre à jour les paramètres de l\'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('815', 'select_category', 'Select Category', 'sélectionner une catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('816', 'mini_invoice', 'Mini Invoice', 'Ticket', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('817', 'purchase_details', 'Purchase Details', 'détails d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('818', 'disc', 'Dis %', 'disc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('819', 'serial', 'Serial', 'série(clé série)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('820', 'transaction_head', 'Transaction Head', 'entête de la transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('821', 'transaction_type', 'Transaction Type', 'type de transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('822', 'return_details', 'Return Details', 'détails de retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('823', 'return_to_customer', 'Return To Customer', 'retourner au client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('824', 'sales_and_purchase_report_summary', 'Sales And Purchase Report Summary', 'Rapport résumé des ventes et achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('825', 'add_person_officeloan', 'Add Person (Office Loan)', 'Ajouter une personne (prêt de bureau)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('826', 'add_loan_officeloan', 'Add Loan (Office Loan)', 'Ajouter un prêt(prêt bureau)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('827', 'add_payment_officeloan', 'Add Payment (Office Loan)', 'Ajouter un paiement (prêt de bureau)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('828', 'manage_loan_officeloan', 'Manage Loan (Office Loan)', 'Gérer le bureau de prêt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('829', 'add_person_personalloan', 'Add Person (Personal Loan)', 'Ajouter une personne (prêt personnel)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('830', 'add_loan_personalloan', 'Add Loan (Personal Loan)', 'Ajouter un prêt (prêt personnel)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('831', 'add_payment_personalloan', 'Add Payment (Personal Loan)', 'Ajouter un paiement (prêt personnel)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('832', 'manage_loan_personalloan', 'Manage Loan (Personal)', 'Gérer les prêts personnels', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('833', 'hrm_management', 'Human Resource', 'Gestion RH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('834', 'cash_adjustment', 'Cash Adjustment', 'Ajustement de la trésorérie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('835', 'adjustment_type', 'Adjustment Type', 'Type d\'ajustement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('836', 'change', 'Change', 'Monnaie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('837', 'sale_by', 'Sale By', 'vendu par', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('838', 'salary_date', 'Salary Date', 'date du salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('839', 'earnings', 'Earnings', 'Gains', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('840', 'total_addition', 'Total Addition', 'addition total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('841', 'total_deduction', 'Total Deduction', 'déduction totale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('842', 'net_salary', 'Net Salary', 'salaire net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('843', 'ref_number', 'Reference Number', 'numéro de ref', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('844', 'name_of_bank', 'Name Of Bank', 'nom de la banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('845', 'salary_slip', 'Salary Slip', 'fiche de salire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('846', 'basic_salary', 'Basic Salary', 'Salaire de base', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('847', 'return_from_customer', 'Return From Customer', 'formulaire client de retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('848', 'quotation', 'Quotation', 'Devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('849', 'add_quotation', 'Add Quotation', 'Ajouter un devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('850', 'manage_quotation', 'Manage Quotation', 'Gérer les devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('851', 'terms', 'Terms', 'termes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('852', 'send_to_customer', 'Sent To Customer', 'envoyer au client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('853', 'quotation_no', 'Quotation No', 'Devis n°', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('854', 'quotation_date', 'Quotation Date', 'date du devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('855', 'total_service_tax', 'Total Service Tax', 'total des tax service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('856', 'totalservicedicount', 'Total Service Discount', 'total de remise par service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('857', 'item_total', 'Item Total', 'article total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('858', 'service_total', 'Service Total', 'total de service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('859', 'quot_description', 'Quotation Description', 'description du devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('860', 'sub_total', 'Sub Total', 'sous-total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('861', 'mail_setting', 'Mail Setting', 'paramètres du mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('862', 'mail_configuration', 'Mail Configuration', 'configuration du mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('863', 'mail', 'Mail', 'mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('864', 'protocol', 'Protocol', 'protocol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('865', 'smtp_host', 'SMTP Host', 'nom d\'hôte smtp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('866', 'smtp_port', 'SMTP Port', 'port smtp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('867', 'sender_mail', 'Sender Mail', 'mail de l\'expéditeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('868', 'mail_type', 'Mail Type', 'type de mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('869', 'html', 'HTML', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('870', 'text', 'TEXT', 'texte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('871', 'expiry_date', 'Expiry Date', 'date d\'expiration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('872', 'api_secret', 'Api Secret', 'clé secrète', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('873', 'please_config_your_mail_setting', NULL, 'configurer les paramètres de votre mail svp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('874', 'quotation_successfully_added', 'Quotation Successfully Added', 'devis ajouté avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('875', 'add_to_invoice', 'Add To Invoice', 'Ajouter à la facture ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('876', 'added_to_invoice', 'Added To Invoice', 'Ajouter à la facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('877', 'closing_balance', 'Closing Balance', 'Solde de fermeture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('878', 'contact', 'Contact', 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('879', 'fax', 'Fax', 'fax', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('880', 'state', 'State', 'Etat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('881', 'discounts', 'Discount', 'Les Remises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('882', 'address1', 'Address1', 'Adresse 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('883', 'address2', 'Address2', 'Adresse 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('884', 'receive', 'Receive', 'Avance/reception', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('885', 'purchase_history', 'Purchase History', 'historique des achats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('886', 'cash_payment', 'Cash Payment', 'Paiement en cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('887', 'bank_payment', 'Bank Payment', 'Paiement bancaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('888', 'do_you_want_to_print', 'Do You Want to Print', 'voudriez-vous imprimer ?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('889', 'yes', 'Yes', 'oui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('890', 'no', 'No', 'n°', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('891', 'todays_sale', 'Today\'s Sales', 'Ventes d\'aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('892', 'or', 'OR', 'ou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('893', 'no_result_found', 'No Result Found', 'resultat non trouvé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('894', 'add_service_quotation', 'Add Service Quotation', 'Ajouter un service de devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('895', 'add_to_invoice', 'Add To Invoice', 'Ajouter à la facture ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('896', 'item_quotation', 'Item Quotation', 'Devis d\'article', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('897', 'service_quotation', 'Service Quotation', 'service devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('898', 'return_from', 'Return Form', 'formulaire de retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('899', 'customer_return_list', 'Customer Return List', 'Liste des retours client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('900', 'pdf', 'Pdf', 'pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('901', 'note', 'Note', 'note', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('902', 'update_debit_voucher', 'Update Debit Voucher', 'mettre à jour le bon du débit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('903', 'update_credit_voucher', 'Update Credit voucher', 'mettre à jour le bon de crédit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('904', 'on', 'On', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('905', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('906', 'total_expenses', 'Total Expense', 'dépenses totales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('907', 'already_exist', 'Already Exist', 'Existe déjà', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('908', 'checked_out', 'Checked Out', 'Vérifié', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('909', 'update_salary_setup', 'Update Salary Setup', 'mettre à jour les paramètres de salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('910', 'employee_signature', 'Employee Signature', 'signature de l\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('911', 'payslip', 'Payslip', 'fiche de paie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('912', 'exsisting_role', 'Existing Role', 'rôle existant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('913', 'filter', 'Filter', 'filtre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('914', 'testinput', NULL, 'entrée de test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('915', 'update_quotation', 'Update Quotation', 'mettre à jour le dévis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('916', 'quotation_successfully_updated', 'Quotation Successfully Updated', 'devis mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('917', 'successfully_approved', 'Successfully Approved', 'approuvé avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('918', 'expiry', 'Expiry', 'expiration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('919', 'user_list', 'User List', 'Liste d\'utilisateurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('920', 'assign_roleto_user', 'Assign Role To User', 'Attribuer des rôles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('921', 'assign_role_list', 'Assigned Role List', 'Liste des rôles attribués', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('922', 'application_settings', 'Application Settings', 'Paramètre des serveurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('923', 'company_list', 'Company List', 'Liste de compagnie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('924', 'edit_company', 'Edit Company', 'Modifier la compagnie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('925', 'edit_user', 'Edit User', 'Modifier l\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('926', 'edit_currency', 'Edit Currency', 'Modifier la devise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('927', 'mobile_no', 'Mobile No', 'numéro mobile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('928', 'email_address', 'Email Address', 'adresse email', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('929', 'customer_list', 'Customer List', 'Liste des clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('930', 'advance_receipt', 'Advance Receipt', 'Réçu d\'avance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('931', 'supplier_list', 'Supplier List', 'Liste des fournisseurs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('932', 'category_list', 'Category List', 'Liste des catégorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('933', 'no_record_found', 'No Record Found', 'pas d\'enregistrement trouvé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('934', 'unit_list', 'Unit List', 'Liste des unités', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('935', 'edit_product', 'Edit Product', 'Modifier le produit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('936', 'payable_summary', 'Payable Summary', 'récapitulatif  à payer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('937', 'pad_print', 'Pad Print', 'impression(pad)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('938', 'pos_print', 'POS Print', 'Impression POS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('939', 'pos_invoice', 'POS Invoice', 'Vente(POS)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('940', 'employee_profile', 'Employee Profile', 'profile de l\'employé', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('941', 'edit_beneficials', 'Edit Beneficials', 'Modifier les bénéficiaires', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('942', 'edit_setup_update', 'Edit Salary Setup', 'Modifier les paramètres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('943', 'add_office_loan', 'Add Office Loan', 'Ajouter un prêt(bureau)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('944', 'income_tax', 'Income Tax', 'Taxe sur revenu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('945', 'quotation_to_sale', 'Quotation To Sale', 'Facturer le devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('946', 'quotation_edit', 'Edit Quotation', 'Edition du devis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('947', 'edit_profile', 'Edit Profile', 'Modifier le profile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('948', 'edit_supplier', 'Edit Supplier', 'Modifier le fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('949', 'edit_bank', 'Edit Bank', 'Modifier la banque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('950', 'balance_sheet', 'Balance Sheet', 'Bilan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('951', 'salary_setup', 'Salary Setup', 'configuration de salaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('952', 'account_head', 'Account Head', 'Chef de compte(entête)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('953', 'add_invoice', 'Add Invoice', 'Ajouter une facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('954', 'general_ledger_report', 'General Ledger Report', 'Rapport du registre général', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('955', 'print_setting', 'Print Setting', 'imp. paramètres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('956', 'header', 'Header', 'Entête', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('957', 'footer', 'Footer', 'bas de page', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('958', 'supplier_payment_receipt', 'Payment Receipt', 'Ticket de paiment fournisseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('959', 'welcome_back', 'Welcome Back', 'content de vous revoir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('960', 'overwrite', 'Over Write', 'écraser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('961', 'module', 'Module', 'module', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('962', 'purchase_key', 'Purchase Key', 'clé d\'achat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('963', 'buy_now', 'Buy Now', 'Acheter maintenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('964', 'module_list', 'Module List', 'liste de module', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('965', 'modules', 'Modules', 'les modules', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('966', 'install', 'Install', 'installer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('967', 'uninstall', 'Uninstall', 'désinstaller', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('968', 'module_added_successfully', 'Module Added Successfully', 'module ajouté avec succès', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('969', 'no_tables_are_registered_in_config', 'No table registered in config', 'aucune table n\'est configurée', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('970', 'tables_are_not_available_in_database', 'Table Are not Available in Database', 'la table n\'est pas disponible dans la base', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('971', 'addon', 'Add-ons', 'addon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('972', 'generate_qr', 'Generate QR', 'générer le qr code', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('973', 'latestv', 'Latest Version', 'Dernière tv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('974', 'Current Version', NULL, 'Version actuelle du logiciel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('976', 'notesupdate', 'Note: If you want to update software,you Must have immediate previous version', 'mise à jour des notes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `w`, `kaby`, `kotokoli`, `losso`, `moba`, `tchamana`, `espagnol`, `atchanti`) VALUES ('977', 'alldata', NULL, 'Aller à la page des rénitialisations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: madina_table
#

DROP TABLE IF EXISTS `madina_table`;

CREATE TABLE `madina_table` (
  `user_mac` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `secretkey` varchar(255) DEFAULT NULL,
  UNIQUE KEY `madina_table_user_mac_uindex` (`user_mac`),
  UNIQUE KEY `madina_table_secretkey_uindex` (`secretkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `madina_table` (`user_mac`, `status`, `secretkey`) VALUES ('fmuGo8aifBOs78/Ap9grPDeiqvfn5uYsiTiu3DXF', '6437486b543977354e2b4a6c436d65725052482f33413d3d', 'CQuJ3rq3DHSo6LG/');


#
# TABLE STRUCTURE FOR: mazou
#

DROP TABLE IF EXISTS `mazou`;

CREATE TABLE `mazou` (
  `usermachine` varchar(255) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  UNIQUE KEY `mazou_usermachine_uindex` (`usermachine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: module
#

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('1', 'invoice', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('2', 'customer', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('3', 'product', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('4', 'supplier', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('5', 'purchase', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('6', 'stock', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('7', 'return', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('8', 'report', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('9', 'accounts', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('10', 'bank', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('11', 'tax', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('12', 'hrm_management', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('13', 'service', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('14', 'commission', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('15', 'setting', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('16', 'quotation', NULL, NULL, NULL, '1');


#
# TABLE STRUCTURE FOR: module_purchase_key
#

DROP TABLE IF EXISTS `module_purchase_key`;

CREATE TABLE `module_purchase_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity` varchar(100) DEFAULT NULL,
  `purchase_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: payroll_tax_setup
#

DROP TABLE IF EXISTS `payroll_tax_setup`;

CREATE TABLE `payroll_tax_setup` (
  `tax_setup_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `end_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`tax_setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: person_information
#

DROP TABLE IF EXISTS `person_information`;

CREATE TABLE `person_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(50) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: person_ledger
#

DROP TABLE IF EXISTS `person_ledger`;

CREATE TABLE `person_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(50) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `debit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `details` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid',
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: personal_loan
#

DROP TABLE IF EXISTS `personal_loan`;

CREATE TABLE `personal_loan` (
  `per_loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(30) NOT NULL,
  `person_id` varchar(30) NOT NULL,
  `debit` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `date` varchar(30) NOT NULL,
  `details` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid',
  PRIMARY KEY (`per_loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: pesonal_loan_information
#

DROP TABLE IF EXISTS `pesonal_loan_information`;

CREATE TABLE `pesonal_loan_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(30) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: print_setting
#

DROP TABLE IF EXISTS `print_setting`;

CREATE TABLE `print_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` int(11) NOT NULL,
  `footer` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `print_setting` (`id`, `header`, `footer`) VALUES ('1', '97', '100');


#
# TABLE STRUCTURE FOR: product_category
#

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: product_information
#

DROP TABLE IF EXISTS `product_information`;

CREATE TABLE `product_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(100) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `tax` float DEFAULT NULL COMMENT 'Tax in %',
  `serial_no` varchar(200) DEFAULT NULL,
  `product_model` varchar(100) DEFAULT NULL,
  `product_details` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: product_purchase
#

DROP TABLE IF EXISTS `product_purchase`;

CREATE TABLE `product_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) NOT NULL,
  `chalan_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `grand_total_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `due_amount` decimal(10,2) DEFAULT '0.00',
  `total_discount` decimal(10,2) DEFAULT NULL,
  `purchase_date` varchar(50) DEFAULT NULL,
  `purchase_details` text,
  `status` int(2) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: product_purchase_details
#

DROP TABLE IF EXISTS `product_purchase_details`;

CREATE TABLE `product_purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_detail_id` varchar(100) DEFAULT NULL,
  `purchase_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: product_return
#

DROP TABLE IF EXISTS `product_return`;

CREATE TABLE `product_return` (
  `return_id` varchar(30) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `invoice_id` varchar(20) NOT NULL,
  `purchase_id` varchar(30) DEFAULT NULL,
  `date_purchase` varchar(20) NOT NULL,
  `date_return` varchar(30) NOT NULL,
  `byy_qty` float NOT NULL,
  `ret_qty` float NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `supplier_id` varchar(30) NOT NULL,
  `product_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deduction` float NOT NULL,
  `total_deduct` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_ret_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `net_total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reason` mediumtext NOT NULL,
  `usablity` int(5) NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: product_service
#

DROP TABLE IF EXISTS `product_service`;

CREATE TABLE `product_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: quot_products_used
#

DROP TABLE IF EXISTS `quot_products_used`;

CREATE TABLE `quot_products_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quot_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `used_qty` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `quot_id` (`quot_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: quotation
#

DROP TABLE IF EXISTS `quotation`;

CREATE TABLE `quotation` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `quotation_id` varchar(30) NOT NULL,
  `quot_description` text NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `quotdate` date NOT NULL,
  `expire_date` date DEFAULT NULL,
  `item_total_amount` decimal(12,2) NOT NULL,
  `item_total_dicount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `item_total_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_total_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_total_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quot_dis_item` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quot_dis_service` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quot_no` varchar(50) NOT NULL,
  `create_by` varchar(30) NOT NULL,
  `create_date` date NOT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `cust_show` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quot_no` (`quot_no`),
  KEY `quotation_id` (`quotation_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: quotation_service_used
#

DROP TABLE IF EXISTS `quotation_service_used`;

CREATE TABLE `quotation_service_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quot_id` varchar(20) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `quot_id` (`quot_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: quotation_taxinfo
#

DROP TABLE IF EXISTS `quotation_taxinfo`;

CREATE TABLE `quotation_taxinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `relation_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: role_permission
#

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_module_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `update` tinyint(1) DEFAULT NULL,
  `delete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_module_id` (`fk_module_id`),
  KEY `fk_user_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: salary_sheet_generate
#

DROP TABLE IF EXISTS `salary_sheet_generate`;

CREATE TABLE `salary_sheet_generate` (
  `ssg_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `gdate` varchar(30) DEFAULT NULL,
  `start_date` varchar(30) NOT NULL,
  `end_date` varchar(30) NOT NULL,
  `generate_by` varchar(30) NOT NULL,
  PRIMARY KEY (`ssg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: salary_type
#

DROP TABLE IF EXISTS `salary_type`;

CREATE TABLE `salary_type` (
  `salary_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_name` varchar(100) NOT NULL,
  `salary_type` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`salary_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sec_role
#

DROP TABLE IF EXISTS `sec_role`;

CREATE TABLE `sec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sec_userrole
#

DROP TABLE IF EXISTS `sec_userrole`;

CREATE TABLE `sec_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `roleid` int(11) NOT NULL,
  `createby` varchar(50) NOT NULL,
  `createdate` datetime NOT NULL,
  UNIQUE KEY `ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: service_invoice
#

DROP TABLE IF EXISTS `service_invoice`;

CREATE TABLE `service_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(30) NOT NULL,
  `total_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_discount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `invoice_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `previous` decimal(10,2) NOT NULL DEFAULT '0.00',
  `details` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: service_invoice_details
#

DROP TABLE IF EXISTS `service_invoice_details`;

CREATE TABLE `service_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `service_inv_id` varchar(30) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sms_settings
#

DROP TABLE IF EXISTS `sms_settings`;

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(100) DEFAULT NULL,
  `api_secret` varchar(100) DEFAULT NULL,
  `from` varchar(100) DEFAULT NULL,
  `isinvoice` int(11) NOT NULL DEFAULT '0',
  `isservice` int(11) NOT NULL DEFAULT '0',
  `isreceive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sub_module
#

DROP TABLE IF EXISTS `sub_module`;

CREATE TABLE `sub_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  `directory` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('1', '1', 'new_invoice', NULL, NULL, 'new_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('2', '1', 'manage_invoice', NULL, NULL, 'manage_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('3', '1', 'pos_invoice', NULL, NULL, 'gui_pos', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('4', '2', 'add_customer', NULL, NULL, 'add_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('5', '2', 'manage_customer', NULL, NULL, 'manage_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('6', '2', 'credit_customer', NULL, NULL, 'credit_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('7', '2', 'paid_customer', NULL, NULL, 'paid_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('8', '2', 'customer_ledger', NULL, NULL, 'customer_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('9', '2', 'customer_advance', NULL, NULL, 'customer_advance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('10', '3', 'category', NULL, NULL, 'category', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('11', '3', 'manage_category', NULL, NULL, 'manage_category', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('12', '3', 'unit', NULL, NULL, 'unit', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('13', '3', 'manage_unit', NULL, NULL, 'manage_unit', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('14', '3', 'add_product', NULL, NULL, 'create_product', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('15', '3', 'import_product_csv', NULL, NULL, 'add_product_csv', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('16', '3', 'manage_product', NULL, NULL, 'manage_product', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('17', '4', 'add_supplier', NULL, NULL, 'add_supplier', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('18', '4', 'manage_supplier', NULL, NULL, 'manage_supplier', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('19', '4', 'supplier_ledger', NULL, NULL, 'supplier_ledger_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('20', '4', 'supplier_advance', NULL, NULL, 'supplier_advance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('21', '5', 'add_purchase', NULL, NULL, 'add_purchase', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('22', '5', 'manage_purchase', NULL, NULL, 'manage_purchase', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('23', '6', 'stock_report', NULL, NULL, 'stock_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('24', '7', 'return', NULL, NULL, 'add_return', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('25', '7', 'stock_return_list', NULL, NULL, 'return_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('26', '7', 'supplier_return_list', NULL, NULL, 'supplier_return_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('27', '7', 'wastage_return_list', NULL, NULL, 'wastage_return_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('28', '8', 'closing', NULL, NULL, 'add_closing', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('29', '8', 'closing_report', NULL, NULL, 'closing_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('30', '8', 'todays_report', NULL, NULL, 'all_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('31', '8', 'todays_customer_receipt', NULL, NULL, 'todays_customer_receipt', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('32', '8', 'sales_report', NULL, NULL, 'todays_sales_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('33', '8', 'due_report', NULL, NULL, 'due_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('34', '8', 'purchase_report', NULL, NULL, 'todays_purchase_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('35', '8', 'purchase_report_category_wise', NULL, NULL, 'purchase_report_category_wise', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('36', '8', 'sales_report_product_wise', NULL, NULL, 'product_sales_reports_date_wise', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('37', '8', 'sales_report_category_wise', NULL, NULL, 'sales_report_category_wise', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('38', '8', 'shipping_cost_report', NULL, NULL, 'shipping_cost_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('39', '8', 'user_wise_sales_report', NULL, NULL, 'user_wise_sales_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('40', '8', 'invoice_return', NULL, NULL, 'invoice_return', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('41', '8', 'supplier_return', NULL, NULL, 'supplier_return', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('42', '8', 'tax_report', NULL, NULL, 'tax_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('43', '8', 'profit_report', NULL, NULL, 'profit_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('44', '9', 'c_o_a', NULL, NULL, 'show_tree', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('45', '9', 'supplier_payment', NULL, NULL, 'supplier_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('46', '9', 'customer_receive', NULL, NULL, 'customer_receive', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('47', '9', 'opening_balance', NULL, NULL, 'opening_balance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('48', '9', 'debit_voucher', NULL, NULL, 'debit_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('49', '9', 'credit_voucher', NULL, NULL, 'credit_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('50', '9', 'voucher_approval', NULL, NULL, 'aprove_v', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('51', '9', 'contra_voucher', NULL, NULL, 'contra_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('52', '9', 'journal_voucher', NULL, NULL, 'journal_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('53', '9', 'report', NULL, NULL, 'ac_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('54', '9', 'cash_book', NULL, NULL, 'cash_book', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('55', '9', 'Inventory_ledger', NULL, NULL, 'inventory_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('56', '9', 'bank_book', NULL, NULL, 'bank_book', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('57', '9', 'general_ledger', NULL, NULL, 'general_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('58', '9', 'trial_balance', NULL, NULL, 'trial_balance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('59', '9', 'cash_flow', NULL, NULL, 'cash_flow_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('60', '9', 'coa_print', NULL, NULL, 'coa_print', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('61', '10', 'add_new_bank', NULL, NULL, 'add_bank', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('62', '10', 'manage_bank', NULL, NULL, 'bank_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('63', '10', 'bank_transaction', NULL, NULL, 'bank_transaction', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('64', '10', 'bank_ledger', NULL, NULL, 'bank_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('65', '11', 'tax_settings', NULL, NULL, 'tax_settings', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('66', '11', 'add_incometax', NULL, NULL, 'add_incometax', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('67', '11', 'manage_income_tax', NULL, NULL, 'manage_income_tax', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('68', '11', 'tax_report', NULL, NULL, 'tax_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('69', '11', 'invoice_wise_tax_report', NULL, NULL, 'invoice_wise_tax_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('70', '12', 'add_designation', NULL, NULL, 'add_designation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('71', '12', 'manage_designation', NULL, NULL, 'manage_designation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('72', '12', 'add_employee', NULL, NULL, 'add_employee', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('73', '12', 'manage_employee', NULL, NULL, 'manage_employee', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('74', '12', 'add_attendance', NULL, NULL, 'add_attendance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('75', '12', 'manage_attendance', NULL, NULL, 'manage_attendance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('76', '12', 'attendance_report', NULL, NULL, 'attendance_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('77', '12', 'add_benefits', NULL, NULL, 'add_benefits', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('78', '12', 'manage_benefits', NULL, NULL, 'manage_benefits', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('79', '12', 'add_salary_setup', NULL, NULL, 'add_salary_setup', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('80', '12', 'manage_salary_setup', NULL, NULL, 'manage_salary_setup', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('81', '12', 'salary_generate', NULL, NULL, 'salary_generate', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('82', '12', 'manage_salary_generate', NULL, NULL, 'manage_salary_generate', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('83', '12', 'salary_payment', NULL, NULL, 'salary_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('84', '12', 'add_expense_item', NULL, NULL, 'add_expense_item', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('85', '12', 'manage_expense_item', NULL, NULL, 'manage_expense_item', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('86', '12', 'add_expense', NULL, NULL, 'add_expense', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('87', '12', 'manage_expense', NULL, NULL, 'manage_expense', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('88', '12', 'expense_statement', NULL, NULL, 'expense_statement', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('89', '12', 'add_person_officeloan', NULL, NULL, 'add1_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('90', '12', 'add_loan_officeloan', NULL, NULL, 'add_office_loan', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('91', '12', 'add_payment_officeloan', NULL, NULL, 'add_loan_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('92', '12', 'manage_loan_officeloan', NULL, NULL, 'manage1_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('93', '12', 'add_person_personalloan', NULL, NULL, 'add_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('94', '12', 'add_loan_personalloan', NULL, NULL, 'add_loan', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('95', '12', 'add_payment_personalloan', NULL, NULL, 'add_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('96', '12', 'manage_loan_personalloan', NULL, NULL, 'manage_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('97', '13', 'add_service', NULL, NULL, 'create_service', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('98', '13', 'manage_service', NULL, NULL, 'manage_service', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('99', '13', 'service_invoice', NULL, NULL, 'service_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('100', '13', 'manage_service_invoice', NULL, NULL, 'manage_service_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('101', '14', 'generate_commission', NULL, NULL, 'commission', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('102', '15', 'manage_company', NULL, NULL, 'manage_company', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('103', '15', 'add_user', NULL, NULL, 'add_user', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('104', '15', 'manage_users', NULL, NULL, 'manage_user', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('105', '15', 'language', NULL, NULL, 'add_language', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('106', '15', 'currency', NULL, NULL, 'add_currency', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('107', '15', 'setting', NULL, NULL, 'soft_setting', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('108', '15', 'print_setting', NULL, NULL, 'print_setting', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('109', '15', 'mail_setting', NULL, NULL, 'mail_setting', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('110', '15', 'add_role', NULL, NULL, 'add_role', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('111', '15', 'role_list', NULL, NULL, 'role_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('112', '15', 'user_assign_role', NULL, NULL, 'user_assign', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('113', '15', 'Permission', NULL, NULL, NULL, '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('114', '15', 'sms_configure', NULL, NULL, 'sms_configure', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('115', '15', 'backup_restore', NULL, NULL, 'back_up', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('116', '15', 'import', NULL, NULL, 'sql_import', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('117', '15', 'restore', NULL, NULL, 'restore', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('118', '16', 'add_quotation', NULL, NULL, 'add_quotation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('119', '16', 'manage_quotation', NULL, NULL, 'manage_quotation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('120', '16', 'add_to_invoice', NULL, NULL, 'add_to_invoice', '1');


#
# TABLE STRUCTURE FOR: supplier_information
#

DROP TABLE IF EXISTS `supplier_information`;

CREATE TABLE `supplier_information` (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` text NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `emailnumber` varchar(200) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `city` text,
  `state` text,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: supplier_product
#

DROP TABLE IF EXISTS `supplier_product`;

CREATE TABLE `supplier_product` (
  `supplier_pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(30) NOT NULL,
  `products_model` varchar(30) DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `supplier_price` float DEFAULT NULL,
  PRIMARY KEY (`supplier_pr_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: synchronizer_setting
#

DROP TABLE IF EXISTS `synchronizer_setting`;

CREATE TABLE `synchronizer_setting` (
  `id` int(11) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `port` varchar(10) NOT NULL,
  `debug` varchar(10) NOT NULL,
  `project_root` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: tax_collection
#

DROP TABLE IF EXISTS `tax_collection`;

CREATE TABLE `tax_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `relation_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: tax_settings
#

DROP TABLE IF EXISTS `tax_settings`;

CREATE TABLE `tax_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_value` float NOT NULL,
  `tax_name` varchar(250) NOT NULL,
  `nt` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: units
#

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: user_login
#

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` int(2) DEFAULT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `user_type`, `security_code`, `status`) VALUES ('4', '607506', 'boolisoftdev@gmail.com', 'eb5431787a5adf986a10441b9068001e', '1', NULL, '1');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `address` text,
  `phone` varchar(20) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `user_id`, `last_name`, `first_name`, `company_name`, `address`, `phone`, `gender`, `date_of_birth`, `logo`, `status`) VALUES ('1', '2', 'User', 'Admin', NULL, NULL, NULL, NULL, NULL, 'http://localhost/saleserp_v9.8/assets/dist/img/profile_picture/profile.jpg', '1');
INSERT INTO `users` (`id`, `user_id`, `last_name`, `first_name`, `company_name`, `address`, `phone`, `gender`, `date_of_birth`, `logo`, `status`) VALUES ('4', '607506', 'Invitée', 'Entreprise', NULL, NULL, NULL, NULL, NULL, '', '1');


#
# TABLE STRUCTURE FOR: web_setting
#

DROP TABLE IF EXISTS `web_setting`;

CREATE TABLE `web_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `invoice_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `timezone` varchar(150) NOT NULL,
  `currency_position` varchar(10) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `rtr` varchar(255) DEFAULT NULL,
  `captcha` int(11) DEFAULT '1' COMMENT '0=active,1=inactive',
  `site_key` varchar(250) DEFAULT NULL,
  `secret_key` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT '1',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `web_setting` (`setting_id`, `logo`, `invoice_logo`, `favicon`, `currency`, `timezone`, `currency_position`, `footer_text`, `language`, `rtr`, `captcha`, `site_key`, `secret_key`, `discount_type`) VALUES ('1', 'assets/img/icons/2022-03-16/8b0562baf732518bac3c924ebcb5a661.png', 'assets/img/icons/2022-03-16/5b825ef4c48f8a7817b7417348bc1589.png', 'assets/img/icons/2021-10-04/fa3095329a049ecbde61620c4fc67cf9.png', 'FCFA', 'Europe/London', '1', 'Boolisoft France| 2021', 'french', '0', '1', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '2');


