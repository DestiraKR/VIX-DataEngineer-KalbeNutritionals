#Melakukan import mysql connector
import mysql.connector
#Melakukan percobaan koneksi
conn = mysql.connector.connect(
    host="localhost", 
    user="root",
    password="letmein", 
    database ="project")
# Cek Koneksi
if conn.is_connected():
    print('Connected')

#Membuat object cursor sebagai penanda
cursor = conn.cursor()

#Membuat tabel karyawan
cursor.execute(
    "CREATE TABLE karyawan (FIRST_NAME VARCHAR(50),LAST_NAME VARCHAR(50),"
    "AGE VARCHAR(10), SEX VARCHAR(10), INCOME INT(10))")

#Deklarasi SQL Query untuk memasukkan record ke DB (KARYAWAN)
insert_sql =(
    "INSERT INTO karyawan (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME)"
    "VALUES (%s, %s, %s, %s, %s)")
values = ('Steve', 'Job', 30, 'M', 10000)

try:
    #Eksekusi SQL Command
    cursor.execute(insert_sql, values)
    #Melakukan perubahan (commit) pada DB
    conn.commit()
except:
    #Roll Back apabila ada issue
    conn.rollback()

#Menutup koneksi
conn.close()

