--List of all the arrived orders
--a.Total number of arrived orders in POS
select pos, count(1) from orders o
where pos is not null group by pos;


--b.Total number of arrivied orders for one specific customer
select Order_CustomerId, count(1) from Orders o
where Order_CustomerId=1 group by Order_CustomerId;

--Customer order pick up
--a.Search query that will be able to look for customer orders
select cu.*,o.* from Orders o
join Customer cu on cu.CustomerId =o.Order_CustomerId
where  cu.Name  like '%Pramod%'
select cu.*,o.* from Orders o
join Customer cu on cu.CustomerId =o.Order_CustomerId
where o.OrderDate between current_date - integer '300' and current_date + integer '10'
select ar.*,o.* from Orders o
join Customer cu on cu.CustomerId =o.Order_CustomerId
join Article ar on ar.ArticleId = o.Order_ArticleId
where o.Order_ArticleId = 1

--b. search query at least 2 parameters
select c2.*,o.* from Orders o
join Customer c2 on c2.CustomerId =o.Order_CustomerId
join Article ar on ar.ArticleId =o.Order_ArticleId 
where  c2.Name  like '%Pramod%' and o.OrderDate between current_date - integer '300' and current_date + integer '10'

--c.Display orders for specific customers
select Parcel_Details, o.OrderId, cu.Name, Parcel_tracking.Trackingdate, Parcel_tracking.TrackingstatusId, Trackingstatus.Status from Orders o
join Customer cu on cu.CustomerId =o.Order_CustomerId
join Parcel_Details Parcel_Details on Parcel_Details.Parcel_Order = o.OrderId
join Parcel_tracking Parcel_tracking on Parcel_tracking.TrackingId = TrackingId
join Trackingstatus Trackingstatus on Trackingstatus.TrackingstatusId = Trackingstatus.TrackingstatusId
where cu.Name like '%Pramod%'

--d.Updating the orders with a text comments and status
update Parcel_tracking set TrackingStatusId=5,
tracking_comments = 'Delivered product to customer'
from Orders o
join Customer cu on cu.CustomerId =o.Order_CustomerId
join Parcel_Details Parcel_Details on Parcel_Details.Parcel_Order = o.OrderId
where o.OrderId = 120 and Parcel_tracking.ParcelId_Tracking = Parcel_Details.ParcelId

update Parcel_tracking set TrackingStatusId=15,
tracking_comments = 'Product returned to the warehouse'
from Orders o
join Customer cu on cu.CustomerId =o.Order_CustomerId
join Parcel_Details Parcel_Details on Parcel_Details.Parcel_Order = o.OrderId
where o.OrderId = 324 and Parcel_tracking.ParcelId_Tracking = Parcel_Details.ParcelId

--Orders that have not been picked up
--a. Find all the unclaimed orders
select o.* from Orders o
join Customer cu on cu.CustomerId =o.Order_CustomerId
join Parcel_Details Parcel_Details on Parcel_Details.Parcel_Order = o.OrderId
join Parcel_tracking Parcel_tracking on Parcel_tracking.TrackingId = TrackingId
join Trackingstatus Trackingstatus on Trackingstatus.TrackingstatusId = Trackingstatus.TrackingstatusId
where o.OrderDate between current_date - integer '20' and current_date and Trackingstatus.TrackingstatusId = 5

--b Calculate the 3 category the most affected
select ac.Category from Orders o
join Article ar on ar.ArticleId =o.Order_ArticleId 
join Article_Categories ac on ac.Article_catId = ac.Article_Category
join Parcel_Details Parcel_Details on Parcel_Details.Parcel_Order = o.OrderId
join Parcel_tracking Parcel_tracking on Parcel_tracking.TrackingId = TrackingId
join Trackingstatus Trackingstatus on Trackingstatus.TrackingstatusId = Trackingstatus.TrackingstatusId
where Trackingstatus.TrackingstatusId=5 group by ac.Category order by count(ac.Category) desc limit 3

--c Calculate the overall cost 
select sum(o.Unitprice) as Price from orders o
join Parcel_Details Parcel_Details on Parcel_Details.Parcel_Order = o.OrderId
join Parcel_tracking Parcel_tracking on Parcel_tracking.TrackingId = TrackingId
join Trackingstatus Trackingstatus on Trackingstatus.TrackingstatusId = Trackingstatus.TrackingstatusId
where Trackingstatus.TrackingstatusId=5
