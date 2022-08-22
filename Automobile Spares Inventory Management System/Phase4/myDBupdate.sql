-- CUSTOMER TABLE --
update  S22_S003_15_CUSTOMER set First_Name = 'Taylor', Last_Name = 'Swift' where Cust_ID = 500036;
update S22_S003_15_CUSTOMER set Phone_Number = 6822525665 where Email = 'Charley@gmail.com';

-- SUPPLIER TABLE --
update  S22_S003_15_SUPPLIER set Supplier_Name = 'Mini Cooper' where Supplier_ID = 400021 ;
update S22_S003_15_SUPPLIER set Supplier_Addr = '221B Baker Street' where Supplier_Name = 'Kia';

-- COMPANY --
update  S22_S003_15_COMPANY set Email = 'location800@gmail.com' where License_Num = '70000006'; 

-- PRODUCT --
update  S22_S003_15_PRODUCT set Purchase_Cost = 5873 where Product_ID = 80005;
update  S22_S003_15_PRODUCT set Product_Name = 'New Beetle' where Brand = 'SUZUKI' and Model = 'SWIFT';

-- COMPANY LOC --
update  S22_S003_15_COMPANY_LOC set pin = 8765 where Addr = '832 old MainRoad';
update  S22_S003_15_COMPANY_LOC set Phone_Number = '6822525665' where License_Num = 70000007;

-- EMPLOYEE --
update  S22_S003_15_EMPLOYEE  set First_Name = 'Sai', Last_Name = 'Nishanth' where EMP_ID = 1028;
update  S22_S003_15_EMPLOYEE set Bank_Account_No = '9999' where EMP_ID = 1026;

-- EMPLOYEE ADDR --
update  S22_S003_15_EMPLOYEE_ADDR set Zipcode = 600028 where Street_Name = '423 Black Ave' and City = 'Chennai';

-- SALES HISTORY --
update  S22_S003_15_SALES_HISTORY set Quantity = 20 where Purchase_ID = 12354;









