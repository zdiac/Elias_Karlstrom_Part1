# Logbook — Björklunda kommun Del 1 
**Namn:** Elias Karlström 
**E-post:** elikar940726@student.jenseneducation.se 
**Inlämning:** Del 1 — Grundmiljön 

--- 
## Arbetslogg

### ÅÅ-MM-DD 
**Arbetat med:** 
**Vad jag gjorde:** 
**Problem och lösningar:** 
**Beslut jag fattade:** 
**Källor jag använde:** 
---

# Del 1 — Förberedelse och sätta upp repo -

Jag har skapat ett red hat developer konto och laddat ned senaste ISOn

Git är installerat och konfigurerat
- Namn: Elias Karlström
- Mail: elikar940726@student.jenseneducation.se

Repo initierat och mappstruktur skapad så som instruktionerna.

Skapat .sh och .ps1 signatur.

Skapat några commits enligt instruktionerna.


# Del 2 — Planering -

Redhat säger att /boot ska ligga på en egen partition som har minst 1 GB utrymme.

XFS är RHEL:s standardfilsystem, optimerat för stora filsystem och hög prestanda.

ext4 är äldre, stabilt och enklare men har lägre maxgränser för filstorlek och volym.

RHEL IdM är Red Hats system för central hantering av Linux‑användare, autentisering, grupper, SSH‑nycklar och policies. Det bygger på FreeIPA. (Så deras version av Active Directory)

Något jag inte förstod? - Jag tycker att allt det känns som att det är väldigt mycket information och lite otydligt.


Källa: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/

srv-linux01 - Partitionsplan
Mount point   Minimum size   Filesystem   Motivering
/boot         1 GB           xfs          Standard, minsta rekommenderade storlek
/             20 GB          xfs          Räcker för system, loggar och installerade paket
/home         10 GB          xfs          Minimikrav, lagrar användarfiler
swap          2 GB           swap         Minimikrav


srv-idm01 - Partitionsplan
Mount point   Minumum size   Filesystem   Motivering
/boot         1 GB           xfs          Standard
/             30 GB          xfs          IdM installerar fler tjänster och databaser
/home         20 GB          xfs          Mer utrymme för användardata och certifikat
swap          2 GB           swap         Minimikrav


# Del 3 — Linux-serverinstallation -
Jag har installerat srv-linux01. Jag var tvungen att lägga till en /boot/efi på 600 mib för att det skulle fungera. Innan dess fick jag problem med min installation, det ståd att den inte kunde kontrollera utrymme, jag testade det mesta innan jag lyckades ta reda på vad felet var.
Jag har gjort screenshot-01 och screenshot-02 och lagt i screenshot mappen.

# Del 4 — Windows Server och Active Directory -
# Del 5 — Kontohantering med script -
# Del 6 — Delade mappar och rättigheter -
# Del 7 — Utskriftssystem -
# Del 8 — Virtualisering -
# Del 9 — Lagar och säkerhet -
# Del 10 — Råd och stöd -
# Del 11 — Reflektera över din miljö 