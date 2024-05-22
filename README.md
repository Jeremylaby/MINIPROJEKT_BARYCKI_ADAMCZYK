# MINIPROJEKT_BARYCKI_ADAMCZYK


---

# Miniprojekt bazodanowy

## Skład grupy

- Nikodem Adamczyk, nikodemadm@student.agh.edu.pl
- Stanisław Barycki, barycki@student.agh.edu.pl

## Temat projektu

Aplikacja bozodanowa obsługująca wynajem krótkoterminowy w budynku mieszkalnym

## Informację o wykorzystywanym SZBD i technologii realizacji projektu

- MySql
- Node.js i Express.js
- React Native

## Link do repozytorium

https://github.com/Jeremylaby/MINIPROJEKT_BARYCKI_ADAMCZYK

![image.png](img%2Fimage.png)
Procedury widoki
User

1. Wyświetlanie Szczegółów mieszkania
2. Wyświetlanie dostępnych mieszkań w danym przedziale czasowym
3. Wyświetlanie mieszkań po tym ile mają pokoji i czy kuchnia łazienka
4. połączenie 2 i 3
5. Rezerwowanie mieszkania
6. Dokonywanie płatności za rezerwacje
7. Anulowanie rezerwacji

Admin

1. Wyświetlanie anulowanych rezerwacji
2. Widok raportu finansowego z danego miesiąca
3. wyświetlanie wszystkiech niezwróconych rezerwacji
4. Wyświetlanie mieszkań których rezerwacja kończy się w danym dniu (do sprzątania)
5. Wyświetlanie zwróconych rezerwacji po id admina
6. Wyświetlanie rezerwacji zwróconych przez system

System

1. Anulowanie rezerwacji jeżeli nie zapłacono w ciągu godziny
2. Obliczanie pieniędzy do zwrotu a także dodawanie nowych paymentów po anulowaniu rezerwacji i zapłaceniu

Jak rezerwujemy to płacimy od razu w ciągu godziny po tym czasie rezerwacja zostaje anulowana

Jeżeli zapłacimy za Rezerwacje to wprowadzamy nowy Payment z admin id Null i repayamount null i statusem Payed(1)

Jeżeli użytkowni anuluje rezerwacje przynajmniej 3 dni przed terminem to dodajemy nowy payment ze statusem Canncelled (0)
i repay amount jest obliczane na 50% paymentu admin id dalej null

Admin przegląda wszystkie paymenty ze statusem Cancelled i zwraca pieniądze wprowadzając swoje id oraz nowy payment ze statusem Returned(2)

jeżeli anulujemy rezerwację mniej niż 3 dni przed terminem to zwracamy 25%
