
-- We are getting the product id which has been sold more than once

SELECT Product_ID,Brand,Model 
    FROM S22_S003_15_PRODUCT 
        WHERE Product_ID IN(
            SELECT Prod_ID FROM S22_S003_15_SALES_HISTORY 
                GROUP BY Prod_ID 
                    HAVING COUNT(Prod_ID)>);

-- Getting Customer Details who have done more than one purchase 
SELECT First_Name,Last_Name,Email 
    FROM S22_S003_15_CUSTOMER 
        WHERE Cust_ID IN(
            SELECT S.Cust_ID 
                FROM S22_S003_15_SALES_HISTORY S 
                    GROUP BY S.Cust_ID 
                        HAVING COUNT(S.Cust_ID)>1);

-- Grouping brand models by luxury and getting their respective suppliers and model counts
SELECT p1.Brand, p1.Model, s1.Supplier_ID, s1.Supplier_Name ,count(Model) 
    FROM S22_S003_15_SUPPLIER s1, S22_S003_15_PRODUCT p1 
        WHERE s1.Supplier_ID = p1.Supplier_ID and p1.Category_Name='LUXURY' 
            GROUP BY p1.Brand, p1.Model, s1.Supplier_ID, s1.Supplier_Name ;


--rollup function for S22_S003_15_PRODUCT and S22_S003_15_SALES_HISTORY
select p.Brand , p.Model,count(p.Model) as model_count 
    from S22_S003_15_PRODUCT p , S22_S003_15_SALES_HISTORY s  
        where p.Product_ID = s.Prod_ID  
            group by rollup( p.Brand , p.Model);

--rollup S22_S003_15_SALES_HISTORY 
select p.Purchase_ID, p.Cust_ID, COUNT(p.Cust_ID) 
    from S22_S003_15_SALES_HISTORY p  
    group by rollup(p.Purchase_ID, p.Cust_ID);

---Displaying the count of category purchase by a specific customer
SELECT Purchase_ID,Cust_ID,Purchase_Date,Prod_ID,Category_ID,Quantity, 
    COUNT(Quantity) OVER (PARTITION BY Category_ID) AS TOTAL_NO_OF_CATEGORY 
        FROM S22_S003_15_SALES_HISTORY 
            ORDER BY Category_ID;

---Fetching the first 10 values of Displaying the count of category purchase by a specific customer
SELECT Purchase_ID,Cust_ID,Purchase_Date,Prod_ID,Category_ID,Quantity, 
    COUNT(Quantity) OVER (PARTITION BY Category_ID) AS TOTAL_CATEGORY_PURCHASED_BY_A_CUSTOMER
        FROM S22_S003_15_SALES_HISTORY
         ORDER BY Category_ID OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
