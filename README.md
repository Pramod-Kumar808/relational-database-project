# relational-database-project
Relational database project from the scratch 

Question: 

This relational databases projects will involve the skills learned during the foundation semester.

This project aims at designing a right database structure that corresponds to a real-world project, a parcel delivery management system.

This project is divided in 3 phases, as during the lectures:

1. Finding a right model to match the system needs in terms of data management,

2. Implementing this model using DDL, with PostgreSQL database.

3. Interact with data through SQL Queries.

Pitch:

You are a software engineer involved in a team which has no special skill in databases management, so you’re the only one able to deal with the database creation and the data engineering in general! Your company just received a business opportunity to create an application to track parcel for a big DIY stores chain. It will be able to manage special orders from the customers, and to help in dispatching parcels between stores, warehouses, transporters, and providers.

Your team gets the specifications from the functional manager, here is the summary you get from your technical manager:

a. The application will propose to manually create an order, directly in the store, when a customer wants to order a DIY article, not immediately available in the store.

b. An order is constituted of the article reference, the quantity, the unit price, the category of the article, a provider, a date (and time) of creation, a state, an order completion date.

c. Each order is linked to a single customer which has a name, an address, a birthdate and customer number.

d. Each order is to be delivered in the customer’s preferred store.

e. There are 13 article categories :

i. Garden

ii. Tools

iii. Bathroom

iv. Kitchen

v. Storage / arrangement

vi. Carpentry

vii. Construction materials

viii. Tiles & parquet

ix. Decoration, Lighting

x. Drugstore & painting

xi. Electricity & home automation

xii. Heating & Plumbing

xiii. Hardware

f. Each order is then packed into a parcel, which has a number, a current state, a current location, a current transporter.

g. It is possible to have several transporters between the provider warehouse and the store.

h. It is necessary to trace all the successive states of a parcel, to be able to give information to the customer.
