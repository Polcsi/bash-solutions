# Első zh feladat megoldásai

## 1. feladat (7p)
Írjon shell szkriptet, amely az alábbi fájl bejegyzéseket a megfelelő jogosultságokkal együtt
létrehozza az aktuális könyvtáron belül relatív fájl hivatkozásokat használva:
Név Típus Jogosultság Helye
EtAlone könyvtár rwxr-sr-x .
dOxyGEN szim. link, aminek célja: git rwxrwxrwx .
LILO könyvtár rwxr-xr-t .
tmp állomány rw-r----- LILO
.hidden könyvtár r-xr-xr-x EtAlone
git állomány (git, GRUB hard link) r-------- .hidden
GRUB állomány (git, GRUB hard link) r-------- .hidden

## 2. feladat (8p)
Írjon shell szkriptet, amelyet egy paraméterrel lehetséges használni. A paraméter egy könyvtárat
jelent. A szkript nem megfelelő paraméterszám esetében írja ki a használatot. (1)
Sikeres végrehajtás esetében:
- Ellenőrzi, hogy létezik-e a könyvtár. Amennyiben létezik kék előtér színnel, ha nem létezik
piros előtér színnel írja ki a könyvtár elérési útvonalát. (3)
Amennyiben létezik a könyvtár, akkor elvégzi az alábbiakat is:
- Listázza azon állományok nevét és jogosultságait oktális formátumban TAB-al
elválasztva a könyvtárból, melyek mérete 6144 bájtnál kisebb! (2)
- Listázza a könyvtárban lévő rejtett állományok darabszámát. (2)

## 3. feladat (9p)
Tegyük fel, hogy az aktuális könyvtárban létezik egy datadir nevű alkönyvtár.
Ebben INI fájlok vannak tárolva az alábbiak szerint:
- Fájlnév séma, és minta: name.ini (“hosztnévvel” megegyező név)

Egy ilyen fájl tartalma az alábbi minta szerinti formátumban adatokat tartalmaz:
> eno1=10.0.0.254/24

> eno2=172.16.4.129/25

> eno3=192.168.2.1/25

> tun0=10.10.10.1/32

Írjon shell szkriptet, amely kiírja az(oka)t az IPv4 címe(ke)t, amelyek a B címosztályba tartoznak.
