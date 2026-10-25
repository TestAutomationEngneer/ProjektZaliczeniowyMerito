# AGENTS.md

Ten plik zawiera instrukcje dla agentów AI (np. Claude Code, GitHub Copilot, Codex, Cursor) pracujących w tym repozytorium.
Opisuje zasady projektu, których agent musi przestrzegać, aby jego zmiany były spójne z pracą zespołu.

## Opis projektu

Projekt zaliczeniowy realizowany w ramach studiów na Uczelni WSB Merito.
Repozytorium jest prowadzone zespołowo z wykorzystaniem dobrych praktyk pracy z Git i GitHub
(branche, Pull Requesty, przeglądy kodu, szablony zgłoszeń).

Zespół projektu:

| Osoba   | Login GitHub             |
|---------|--------------------------|
| Agata   | @ObiOneKenobi712         |
| Emilia  | @cozmic-octopus          |
| Dariusz | @TestAutomationEngneer   |
| Marta   | @melitheleh              |

## Struktura repozytorium

```
.
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md          # szablon zgłoszenia błędu
│   │   └── feature_request.md     # szablon propozycji nowej funkcji
│   ├── CODEOWNERS                 # właściciele plików i automatyczni recenzenci
│   └── pull_request_template.md   # szablon opisu Pull Requesta
├── .gitignore
├── AGENTS.md                      # instrukcje dla agentów AI (ten plik)
├── CODE_OF_CONDUCT.md             # zasady współpracy w zespole
├── CONTRIBUTING.md                # jak wnosić zmiany do projektu
└── README.md                      # opis projektu
```

## Środowisko pracy

> **Technologie projektu nie zostały jeszcze ustalone.**
> Po ich wybraniu uzupełnij tę sekcję o: język programowania, wymagane wersje narzędzi,
> sposób instalacji zależności, uruchamiania projektu i uruchamiania testów.

- Pliki lokalnego środowiska i konfiguracji IDE (np. `.venv/`, `.idea/`) **nie są** commitowane do repozytorium.

## Zasady pisania kodu

- Stosuj standard formatowania i nazewnictwa przyjęty dla wybranego języka programowania.
- Nazwy zmiennych, funkcji i klas po angielsku.
- Komentarze i dokumentacja po **polsku**.
- Pisz małe, czytelne funkcje o jednej odpowiedzialności.
- Nie dodawaj nowych zależności bez wyraźnej potrzeby; każdą nową zależność opisz w Pull Requeście.
- Nie umieszczaj w repozytorium haseł, tokenów, kluczy API ani danych osobowych.

## Bezpieczeństwo

- Przed każdym commitem przejrzyj zmiany (`git diff --staged`) pod kątem sekretów i danych osobowych.
- Sekrety przechowuj w pliku `.env` (wpisanym do `.gitignore`); w repozytorium umieszczaj tylko `.env.example` z pustymi wartościami.
- Repozytorium powinno mieć włączone GitHub Secret Scanning i push protection.
- Jeśli sekret trafił do repozytorium, natychmiast poinformuj zespół – sekret należy unieważnić, samo usunięcie z kodu nie wystarcza.

## Praca z Git

### Branche

- **Nigdy nie commituj bezpośrednio do `main`.** Każda zmiana trafia na `main` wyłącznie przez Pull Request.
- Twórz osobny branch dla każdego zadania, z nazwą opisującą zmianę i prefiksem określającym jej rodzaj:
  - `feature/opis` – nowa funkcjonalność, np. `feature/logowanie-uzytkownika`,
  - `fix/opis` – poprawka błędu, np. `fix/walidacja-formularza`,
  - `docs/opis` – dokumentacja, np. `docs/uzupelnienie-agents-md`.
- Przed rozpoczęciem pracy zaktualizuj branch względem `main`.

### Commity

- Opis commita po polsku, w formie krótkiego zdania opisującego zmianę, np. `Dodano treść do pliku AGENTS.md`.
- Jeden commit = jedna logiczna zmiana.
- Nie commituj plików wygenerowanych automatycznie ani plików wymienionych w `.gitignore`.
- Nie używaj `git push --force` na współdzielonych branchach bez uzgodnienia z zespołem.

### Pull Requesty

- Opis PR wypełniaj zgodnie z szablonem `.github/pull_request_template.md`.
- Jeśli PR dotyczy zgłoszenia, połącz je słowem kluczowym, np. `Closes #12`.
- Recenzenci są przypisywani automatycznie na podstawie pliku `.github/CODEOWNERS`.
- PR może zostać scalony dopiero po zatwierdzeniu przez co najmniej jednego właściciela zmienianych plików.
- Jeden PR = jedno zadanie. PR powyżej ok. 400 zmienionych linii podziel na mniejsze.
- PR przygotowany z pomocą agenta AI oznacz etykietą `ai-assisted` i zaznacz to w opisie.
- Autor PR odpowiada za każdą linię kodu, również wygenerowaną przez AI – kod AI przechodzi pełny przegląd człowieka.
- Recenzent zmian wygenerowanych przez AI sprawdza szczególnie: nieistniejące (zmyślone) API i biblioteki,
  nieużywany lub zduplikowany kod oraz zmiany wykraczające poza zakres zadania.

### Automatyczna weryfikacja (CI i ochrona brancha)

- Branch `main` powinien być chroniony (branch protection): wymagany PR, co najmniej jedno zatwierdzenie,
  wymagane przejście CI, zakaz force push.
- Każdy PR uruchamia workflow CI (`.github/workflows/`). PR z niezaliczonym CI nie może zostać scalony.
- Dopóki technologie nie są ustalone, CI sprawdza co najmniej poprawność plików Markdown i linków.

## Definicja ukończenia zadania (Definition of Done)

Zadanie jest ukończone dopiero, gdy spełnione są wszystkie warunki:

- [ ] kod się buduje i uruchamia bez błędów,
- [ ] wszystkie testy przechodzą – lokalnie i w CI,
- [ ] linter i formatter nie zgłaszają uwag,
- [ ] nowa lub zmieniona logika ma testy,
- [ ] dokumentacja (README, komentarze, ten plik) jest aktualna,
- [ ] diff zawiera wyłącznie zmiany związane z zadaniem.

## Weryfikacja zmian

Przed zgłoszeniem PR agent **musi** uruchomić poniższe kroki i pokazać ich wynik:

| Krok       | Komenda             |
|------------|---------------------|
| Instalacja | `<do uzupełnienia>` |
| Lint       | `<do uzupełnienia>` |
| Testy      | `<do uzupełnienia>` |
| Build      | `<do uzupełnienia>` |

> Komendy należy uzupełnić po wybraniu technologii projektu.

- Jeśli którykolwiek krok się nie powiedzie, agent nie może zgłosić zadania jako ukończonego.
- Agent **nie może** wyłączać, pomijać, usuwać ani osłabiać testów (np. kasować asercji), aby testy przeszły.

## Zasady dla agentów AI

- Przed wprowadzeniem zmian przeczytaj `README.md` i `CONTRIBUTING.md`.
- Wprowadzaj tylko zmiany, o które poproszono; nie modyfikuj niepowiązanych plików.
- Dopóki technologie projektu nie są ustalone, nie wybieraj ich samodzielnie (języka, frameworków, bibliotek) – zapytaj zespół.
- Nie zmieniaj plików `.github/CODEOWNERS` ani `AGENTS.md` bez wyraźnej prośby członka zespołu.
- Nie zmieniaj konfiguracji CI (`.github/workflows/`) ani ustawień repozytorium bez wyraźnej prośby.
- Nie dodawaj plików binarnych ani dużych plików z danymi.
- Nie usuwaj plików ani historii Git (`git reset --hard`, `git push --force`) bez potwierdzenia.
- Nie twórz commitów ani nie wypychaj zmian bez polecenia użytkownika.
- Jeśli instrukcja jest niejasna, zapytaj zamiast zgadywać.
- Po wprowadzeniu zmian przygotuj raport według poniższego formatu.

### Raport po zmianach

Agent kończy pracę raportem zawierającym:

- **Co zmieniono** – lista plików i krótki opis zmian,
- **Dlaczego** – powiązanie z zadaniem lub zgłoszeniem (issue),
- **Jak zweryfikowano** – uruchomione komendy i ich wynik,
- **Czego NIE zweryfikowano** – jawnie, np. „brak testów dla funkcji X”,
- **Ryzyka i otwarte pytania**.

## Kontakt i eskalacja

- Pytania i wątpliwości dotyczące zadania zgłaszaj w komentarzu do issue lub PR, oznaczając członka zespołu z tabeli powyżej.
- Problemy z bezpieczeństwem (np. wyciek sekretu) zgłaszaj zespołowi natychmiast, poza zwykłym trybem przeglądu.
