#Menampilkan data order untuk jumlah pembelian kurang dari 100
#atau pembelian sebelum tanggal 25 agustus 2022 dan memiliki id customer di atas 2001
SELECT * FROM Customer_order
WHERE (Purchase_amount < 100) OR (Order_date < '2022-08-25' AND Customer_id > '2001');