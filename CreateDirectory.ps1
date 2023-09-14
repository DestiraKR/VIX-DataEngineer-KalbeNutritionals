cls # Membersihkan console

# Variabel 
$path = "/hdfs/data/data1"
$name_of_directory = "data1"
$dir = "$path/$name_of_directory"

$filename_excel = "daily_market_price.xlsx"
$source_dir = "/local/data/market"
$target_dir = "$dir"

# Mengecek keberadaan directory di dalam path
if(Test-Path $dir) # Jika directory ada
{
    echo "There is $name_of_directory Directory Exist!"

    # Menyalin file excel ke dalam path yang dituju
    Copy-Item "$source_dir/$filename_excel" "$target_dir"

    # Membuat file log
    $Message = "File Moved Succesfully"
    $TimeStamp = (Get-Date).toString("dd/MM/yyyy HH:mm:ss:fff tt")
    $Line = "$TimeStamp - $Message"
    Add-content -Path "$target_dir/log.txt" -Value $Line
}

else # Jika directory tidak ada
{
    echo "$name_of_directory Directory Not Exists!"

    # Membuat directory
    New-Item $dir -ItemType Directory
}