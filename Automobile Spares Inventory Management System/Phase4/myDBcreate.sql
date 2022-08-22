Create table S22_S003_15_CUSTOMER(
    Cust_ID integer constraint customer_ID_PK Primary key,
    First_Name varchar(30) not null,
    Last_Name varchar(30) not null,
    Email varchar(30) not null ,
    Phone_Number integer not null ,
    DateofBirth date ,
    Addr varchar(500) not null
);

create table S22_S003_15_SUPPLIER(
    Supplier_ID integer constraint SID_PK primary key,
    Supplier_Name varchar(30) not null,
    Phone_Number integer not null unique,
    Email varchar(30) not null unique,
    Supplier_Addr varchar(500) not null
);

create table S22_S003_15_COMPANY(
    License_Num integer constraint LNUM_PK primary key,
    Email varchar(30) not null unique
);

create table S22_S003_15_PRODUCT(
    Product_ID integer constraint PID_PK primary key,
    Category_ID integer not null, 
    Brand varchar(20) not null,
    Model varchar(20) not null,
    Quantity integer not null,
    Purchase_Cost integer not null, 
    Selling_Cost integer not null,
    Category_Name varchar(30) not null,
    Product_Name varchar(30) not null,
    Supplier_ID integer,
    CONSTRAINT Supplier_ID_FK FOREIGN KEY (Supplier_ID) REFERENCES S22_S003_15_SUPPLIER (Supplier_ID)
); 

create table S22_S003_15_COMPANY_LOC(
    License_Num integer not null,
    Phone_Number integer not null unique,
    Addr varchar(200) not null,
    city varchar(100) not null,
    st varchar(100) not null,
    pin integer not null,
    CONSTRAINT LID_FK FOREIGN key (License_Num) REFERENCES S22_S003_15_COMPANY(License_Num)
);

create table S22_S003_15_EMPLOYEE(
    EMP_ID integer constraint EMP_ID_PK Primary key,
    First_Name varchar(30) not null,
    Last_Name varchar(30) not null,
    Gender varchar (10) not null, 
    DateofBirth date,
    Bank_Account_No integer not null unique,
    License_Num integer not null,
    CONSTRAINT LNM_FK FOREIGN KEY (License_Num) REFERENCES S22_S003_15_COMPANY(License_Num)
);

create table S22_S003_15_EMPLOYEE_ADDR(
    EMP_ID integer constraint EMP_PK Primary key,
    Street_Name varchar(500) not null,
    City varchar(100) not null,
    Zipcode integer not null,
    CONSTRAINT EMP_FK FOREIGN KEY (EMP_ID) REFERENCES S22_S003_15_EMPLOYEE(EMP_ID)
);

create table S22_S003_15_SALES_HISTORY(
    Purchase_ID integer constraint P_PK Primary key,
    Cust_ID integer not null ,
    Purchase_Date date ,
    Prod_ID integer not null ,
    Category_ID integer not null ,
    Quantity integer,
    Prod_Amt integer,
    License_Num integer not null,
    Emp_ID integer not null,
    Access_ID integer CHECK(Access_ID = 1001830297) not null, 
    CONSTRAINT CUS_FK FOREIGN KEY (Cust_ID) REFERENCES S22_S003_15_CUSTOMER(Cust_ID),
    CONSTRAINT PRO_FK FOREIGN KEY (Prod_ID) REFERENCES S22_S003_15_PRODUCT(Product_ID),
    CONSTRAINT LM_FK FOREIGN KEY (License_Num) REFERENCES S22_S003_15_COMPANY(License_Num),
    CONSTRAINT EP_FK FOREIGN KEY (Emp_ID) REFERENCES S22_S003_15_EMPLOYEE(EMP_ID)
);





