# Lyrics Fixer

This simple application... fixes your lyrics (!) by correcting capitalization errors, removing double-spacings, and a couple others.

### How to use

Download the executable in Releases, open it, paste the lyrics, and click **Fix Lyrics**. 

### What does it exactly do?
This is documented in the code, see `LyricsFixer.ahk` -> `FixLyrics()`. The application:
1. Removes
    - The very first whitespaces (before the first visible character)
    - Trailing whitespaces at the very end (after the last visible character)
2. Replaces
   - Multiple trailing spaces with single spaces
   - Multiple trailing line feeds with single line feeds
3. Capitalizes
   - The first letter of every line (if the first character if a letter)
   - The first letter after a parenthesis, apostrophe, or a quotation mark (only if these symbols are the first in every line)
   - The next letter after a question mark or a period that is followed by a space
  
### Examples
This example showcases all the features currently supported by the app. This block of text, which contains a lot of errors,
```




lorem ipsum dolor sit amet, consectetur              adipiscing elit.
(enean nec pellentesque odio, quis semper eros.)
"uspendisse nec commodo arcu."


'integer nibh libero, eleifend in ipsum vitae, convallis laoreet arcu.'
etiam. viverra? quis.                       orci. non. lacinia.



```
is "fixed" into:
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
(Enean nec pellentesque odio, quis semper eros.)
"Uspendisse nec commodo arcu."

'Integer nibh libero, eleifend in ipsum vitae, convallis laoreet arcu.'
Etiam. Viverra? Quis. Orci. Non. Lacinia.
```

A practical example would be this site's [lyrics](http://www.animelyrics.com/anime/toradora/orenji.htm) of Orange from the anime Toradora! The app converts this:
```
nemurenai yoru ni wa
hitori de tameiki
minna wa dou na no?
nanda ka sabishii

rashikunai nante ne
warau no wa yamete
HONTO no watashi wo
shirenai dake da yo

hiroi daichi ni  hitotsubu no tane
nekko nobashite
mada aoi  mi wo tsuketa

ORENJI iro ni  hayaku
naritai kajitsu
KIMI no hikari wo abite
risou ya yume wa fukuramu bakari
kidzuite yo  nee
ORENJI  kyou mo
tabete mita kedo
mada suppakute  naita
watashi mitai de nokosenai kara
zenbu tabeta
suki da yo nakeru yo
suki da yo suki da yo

nitete mo chigau yo
MANDARIN ORENJI
tomodachi koibito
futari no KOKORO mo

kizutsukitakunai
watashi wa nigeteta
soshitara hikari mo
sashite wa kurenai

kiseki na no ni ne
deai mo koi mo
tane mo tsubomi mo
mada aoi  mi de sae mo

ORENJI iro wa  ano hi
mita yuuyake wo
omoidasasete kureru
futatsu no kage ga
te wo tsunaideru mitai datta
ORENJI  itsuka
amaku naru kana
sore to mo shibonjau no?
watashi no mirai shiritakunakute
zenbu tabeta
suppai...
suki dakedo nakeru yo
suki dakara nakeru yo

ORENJI iro ni  hayaku
naritai kajitsu
KIMI no hikari wo abite
risou ya yume wa fukuramu bakari
kidzuite yo  nee
ORENJI  kyou mo
tabete mita kedo
mata suppakute  naita
watashi mitai de nokosenai kara
zenbu tabeta suki da yo
nakeru yo suki da yo
suki da yo
suki da yo suppai
nakeru yo suki da yo
```

Into:
```
Nemurenai yoru ni wa
Hitori de tameiki
Minna wa dou na no?
Nanda ka sabishii

Rashikunai nante ne
Warau no wa yamete
HONTO no watashi wo
Shirenai dake da yo

Hiroi daichi ni hitotsubu no tane
Nekko nobashite
Mada aoi mi wo tsuketa

ORENJI iro ni hayaku
Naritai kajitsu
KIMI no hikari wo abite
Risou ya yume wa fukuramu bakari
Kidzuite yo nee
ORENJI kyou mo
Tabete mita kedo
Mada suppakute naita
Watashi mitai de nokosenai kara
Zenbu tabeta
Suki da yo nakeru yo
Suki da yo suki da yo

Nitete mo chigau yo
MANDARIN ORENJI
Tomodachi koibito
Futari no KOKORO mo

Kizutsukitakunai
Watashi wa nigeteta
Soshitara hikari mo
Sashite wa kurenai

Kiseki na no ni ne
Deai mo koi mo
Tane mo tsubomi mo
Mada aoi mi de sae mo

ORENJI iro wa ano hi
Mita yuuyake wo
Omoidasasete kureru
Futatsu no kage ga
Te wo tsunaideru mitai datta
ORENJI itsuka
Amaku naru kana
Sore to mo shibonjau no?
Watashi no mirai shiritakunakute
Zenbu tabeta
Suppai...
Suki dakedo nakeru yo
Suki dakara nakeru yo

ORENJI iro ni hayaku
Naritai kajitsu
KIMI no hikari wo abite
Risou ya yume wa fukuramu bakari
Kidzuite yo nee
ORENJI kyou mo
Tabete mita kedo
Mata suppakute naita
Watashi mitai de nokosenai kara
Zenbu tabeta suki da yo
Nakeru yo suki da yo
Suki da yo
Suki da yo suppai
Nakeru yo suki da yo
```
As you can see, it capitalized the first letter of every line, and removed double spaces (if you noticed them).