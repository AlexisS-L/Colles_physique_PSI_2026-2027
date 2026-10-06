#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 4 : 05/10/2026]
    #linebreak()
    #text(size: 11pt, weight: "bold")[Sujet #lettre --- Corrigé (usage colleur)]
  ]
  v(6pt)
  line(length: 100%, stroke: 0.5pt)
  v(6pt)
}

#let qdc(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours --- corrigé]
    #v(4pt)
    #corps
  ]
  v(8pt)
}

#let qdc_annexe(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours annexe --- corrigé]
    #v(4pt)
    #corps
  ]
  v(8pt)
}

#let remarque(corps) = {
  block(width: 100%, inset: 7pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 9.5pt)[Point de vigilance / note colleur]
    #v(2pt)
    #text(size: 9.5pt)[#corps]
  ]
  v(6pt)
}

#let etape(titre) = {
  v(4pt)
  text(weight: "bold")[#titre]
  v(2pt)
}

#let rappel(corps) = {
  text(style: "italic", size: 9.5pt)[*Rappel de l'énoncé.* #corps]
  v(6pt)
}

#let resultat(corps) = {
  align(center)[#box(stroke: 0.5pt, inset: 6pt)[#corps]]
}

#let jkm = $"J" dot "K"^(-1) dot "mol"^(-1)$
#let kjm = $"kJ" dot "mol"^(-1)$

// ============================================================
// SUJET A --- CORRIGÉ
// ============================================================
#entete("A")

#qdc[
  #rappel[Oscillateur à pont de Wien (cf. schéma de l'énoncé). Démontrer que la tension $s$ est oscillante pour $R_2 = 2R_1$ et déterminer sa pulsation d'oscillation.]

  *Notations.* On note $v_s$ la tension de sortie (la « tension $s$ »), $v_+$ le potentiel de l'entrée non inverseuse et $v_-$ celui du nœud A (entrée inverseuse), tous par rapport à la masse. On pose $G_0 = 1 + R_2 \/ R_1$ et $omega_0 = 1\/(R C)$.

  #etape("Étape 1 --- Amplificateur : relation entre " + $v_s$ + " et " + $v_+$)
  *Hypothèses :* ALI idéal en régime linéaire ($|v_s| < V_"sat"$), donc $i_+ = i_- = 0$ et $epsilon = v_+ - v_- = 0$.

  *Pont diviseur* ($R_1$ et $R_2$ parcourues par le même courant, car $i_- = 0$) :
  $ v_- = frac(R_1, R_1 + R_2) thin v_s $
  Comme $epsilon = 0$, on a $v_+ = v_-$ :
  #resultat[$ v_s = G_0 thin v_+ quad "avec" quad G_0 = 1 + frac(R_2, R_1) $]

  #etape("Étape 2 --- Filtre de Wien : relation entre " + $v_+$ + " et " + $v_s$)
  Le filtre est en sortie ouverte ($i_+ = 0$), donc c'est un simple diviseur de tension entre l'impédance série $underline(Z)_s$ et l'impédance parallèle $underline(Z)_p$ (cf. schéma) :
  $ v_+ = frac(underline(Z)_p, underline(Z)_p + underline(Z)_s) thin v_s quad "avec" quad underline(Z)_s = R + frac(1, j C omega), quad underline(Z)_p = frac(R, 1 + j R C omega) $
  On pose $x = R C omega = omega\/omega_0$, ce qui donne :
  $ underline(Z)_s = R thin frac(1 + j x, j x), quad underline(Z)_p = frac(R, 1 + j x) $
  On simplifie le rapport en multipliant numérateur et dénominateur par $j x (1 + j x)$ (pourquoi : cela fait disparaître toutes les fractions) :
  $ frac(underline(Z)_p, underline(Z)_p + underline(Z)_s) = frac(1 \/ (1 + j x), 1 \/ (1 + j x) + (1 + j x) \/ (j x)) = frac(j x, j x + (1 + j x)^2) = frac(j x, 1 - x^2 + 3 j x) $
  #resultat[$ underline(F)(j x) = frac(v_+, v_s) = frac(j x, 1 - x^2 + 3 j x) = frac(1\/3, 1 + frac(j, 3) (x - frac(1, x))) $]
  (on reconnaît un passe-bande d'ordre 2 de gain maximal $H_0 = 1\/3$, de facteur de qualité $Q = 1\/3$ et de pulsation propre $omega_0$.)

  #etape("Étape 3 --- Condition de Barkhausen")
  *Rappel.* Pour un système bouclé (chaîne directe de transmittance $G_0$, chaîne de retour $underline(F)$), des oscillations sinusoïdales de pulsation $omega$ sont possibles si
  $ G_0 thin underline(F)(j omega) = 1 quad <==> quad |G_0 underline(F)| = 1 quad "et" quad arg(G_0 underline(F)) = 0 thin [2 pi] $
  C'est une condition *nécessaire* pour entretenir une oscillation dans le système linéaire ; elle ne dit rien du démarrage ni de l'amplitude (voir étape 4).

  On écrit $G_0 underline(F)(j x) = 1$ :
  $ G_0 thin j x = 1 - x^2 + 3 j x $
  On égale parties réelle et imaginaire :
  - partie réelle : $0 = 1 - x^2$, donc $x = 1$ (car $x > 0$), soit $omega = omega_0$ ;
  - partie imaginaire : $G_0 x = 3 x$, donc $G_0 = 3$, soit $1 + R_2 \/ R_1 = 3$.
  #resultat[$ R_2 = 2 R_1 quad "et" quad omega_"osc" = omega_0 = frac(1, R C) $]

  #etape("Étape 4 --- Équation différentielle : la tension " + $v_s$ + " est bien oscillante")
  On repart de la relation du filtre, écrite sans fraction : $(1 - x^2 + 3 j x) thin v_+ = j x thin v_s$. En remplaçant $v_s = G_0 v_+$ (étape 1) :
  $ (1 - x^2 + (3 - G_0) j x) thin v_+ = 0 $
  On traduit en temporel : $j omega arrow.r d\/d t$, donc $j x = R C thin j omega arrow.r R C thin d\/d t$ et $-x^2 = (j x)^2 arrow.r (R C)^2 thin d^2\/d t^2$. Comme $v_s = G_0 v_+$ et que l'équation est linéaire, $v_s$ obéit à la même équation :
  #resultat[$ frac(d^2 v_s, d t^2) + omega_0 (3 - G_0) frac(d v_s, d t) + omega_0^2 thin v_s = 0 $]
  Pour $R_2 = 2 R_1$, soit $G_0 = 3$, le terme d'amortissement s'annule :
  $ frac(d^2 v_s, d t^2) + omega_0^2 thin v_s = 0 quad ==> quad v_s (t) = A cos(omega_0 t + phi.alt) $
  Oscillateur harmonique de pulsation $omega_0 = 1\/(R C)$ ; $A$ et $phi.alt$ sont fixées par les conditions initiales.
]

#remarque[
  - Discussion de $G_0$ (signe du terme en $d v_s \/ d t$) : $G_0 < 3$ amortissement positif, oscillations qui s'éteignent ; $G_0 = 3$ oscillations sinusoïdales d'amplitude constante (cas marginal, irréalisable précisément en pratique) ; $G_0 > 3$ amortissement négatif, l'amplitude croît exponentiellement.
  - Pour obtenir le démarrage, on prend donc $R_2$ légèrement supérieur à $2 R_1$ ; la croissance s'arrête quand l'ALI sature ($|v_s| = V_"sat"$) : c'est cette non-linéarité qui stabilise l'amplitude, et le régime linéaire supposé étapes 1 à 4 n'est alors plus valable.
  - Sur le schéma de l'énoncé, la flèche notée $v_+$ est dessinée près de $R_1$ : il s'agit bien du potentiel de l'entrée non inverseuse par rapport à la masse.
]

= Calorimétrie : combustion du glucose --- corrigé

*Hypothèses générales.* Calorimètre adiabatique, à pression constante (atmosphérique) : pour toute transformation $Delta H = Q_p + W_"utile"$ avec $Q_p = 0$.

== Question 1

#rappel[Capacité thermique $C$ du calorimètre, sachant que le passage de $I = "4,80"$ A sous $U = "6,0"$ V pendant $Delta t = "49,0"$ s l'échauffe de $Delta T = "2,2"$ K.]

*Premier principe, système $=$ calorimètre + résistor, à pression constante, adiabatique* : $Delta H = Q_p + W_"utile" = W_"él"$, avec le travail électrique reçu (effet Joule) $W_"él" = U I Delta t$. Par ailleurs $Delta H = C Delta T$ (capacité du calorimètre, résistor de capacité négligeable) :
$ C thin Delta T = U I Delta t quad ==> quad C = frac(U I Delta t, Delta T) $
*Application numérique :* $U I Delta t = "6,0" times "4,80" times "49,0" = 1411 thin "J"$, d'où
#resultat[$ C = frac(1411, "2,2") approx "6,4" times 10^2 thin "J" dot "K"^(-1) quad ("valeur non arrondie utilisée ensuite : " "641,5" thin "J" dot "K"^(-1)) $]

== Question 2

#rappel[Écrire la réaction de combustion du glucose en présence de $"O"_2$ (produits : $"CO"_2$ et eau liquide) ; quantité de dioxygène nécessaire pour $m = "417,6"$ mg de glucose.]

#resultat[$ "C"_6"H"_12"O"_6"(s)" + 6 "O"_2"(g)" -> 6 "CO"_2"(g)" + 6 "H"_2"O""(l)" $]
Les proportions stœchiométriques donnent $n("O"_2) = 6 thin n("glucose")$ (nombres stœchiométriques $-1$ et $-6$).

*Application numérique :* $n_"glu" = m \/ M = "0,4176" \/ 180 = "2,32" times 10^(-3) "mol"$, d'où
#resultat[$ n("O"_2) = 6 n_"glu" = "1,39" times 10^(-2) thin "mol" $]

== Question 3

#rappel[Comparer la capacité thermique des réactifs à celle du calorimètre ; quelle approximation en déduire ?]

*Capacité thermique d'un système :* $C_"syst" = sum_i n_i C_(p,m,i)$. Pour les réactifs :
$ C_"réactifs" = n_"glu" C_(p,m)("glucose") + 6 n_"glu" C_(p,m)("O"_2) $
*Application numérique :* $C_"réactifs" = "2,32" times 10^(-3) times "218,6" + "1,392" times 10^(-2) times "29,3" = "0,507" + "0,408" approx "0,92" thin "J" dot "K"^(-1)$.

De même pour les produits : $C_"produits" = 6 n_"glu" (C_(p,m)("CO"_2) + C_(p,m)("H"_2"O")) = "1,392" times 10^(-2) times ("37,1" + "75,3") approx "1,6" thin "J" dot "K"^(-1)$.

Ces capacités sont de l'ordre de $10^(-3)$ fois celle du calorimètre ($approx 641 thin "J" dot "K"^(-1)$).
#resultat[On néglige la capacité thermique des réactifs et des produits devant $C$ : seul le calorimètre s'échauffe.]

== Question 4

#rappel[$Delta T = "10,125"$ K. En déduire la chaleur libérée, puis l'enthalpie de combustion du glucose (pour une mole de glucose).]

*Loi :* réacteur monobare adiabatique, transformation isenthalpique $Delta H = 0$. Chemin fictif : (1) réaction à $T_i$, $Delta H_1 = xi Delta_r H^circle.small$ ; (2) échauffement isobare du calorimètre et du contenu de $T_i$ à $T_f$, $Delta H_2 = (C + C_"produits") Delta T approx C Delta T$ (Q3). Donc :
$ Delta H = xi thin Delta_r H^circle.small + C thin Delta T = 0 $
La chaleur « libérée » par la réaction (celle qui échauffe le calorimètre) est $Q_"lib" = - xi Delta_r H^circle.small = C Delta T$. Le glucose est le réactif limitant (le dioxygène est en proportion stœchiométrique), donc $xi = n_"glu"$ ($nu_"glu" = -1$), et :
#resultat[$ Delta_c H^circle.small = Delta_r H^circle.small = - frac(C Delta T, n_"glu") $]
*Application numérique :* $Q_"lib" = "641,5" times "10,125" = "6,49" times 10^3 thin "J"$, puis
#resultat[$ Delta_c H^circle.small = - frac("6,49" times 10^3, "2,32" times 10^(-3)) approx -"2,80" times 10^6 thin "J" dot "mol"^(-1) = -"2,80" times 10^3 thin "kJ" dot "mol"^(-1) $]

== Question 5

#rappel[Avec $Delta_f H^circle.small ("CO"_2"(g)") = -"393,5"$ #kjm et $Delta_f H^circle.small ("H"_2"O""(l)") = -"285,8"$ #kjm, en déduire $Delta_f H^circle.small$ du glucose.]

*Loi de Hess :* $Delta_r H^circle.small = sum_i nu_i Delta_f H_i^circle.small$ ($nu_i > 0$ produits, $< 0$ réactifs). Pour la combustion de la Q2 :
$ Delta_c H^circle.small = 6 Delta_f H^circle.small ("CO"_2) + 6 Delta_f H^circle.small ("H"_2"O""(l)") - Delta_f H^circle.small ("glucose") - 6 Delta_f H^circle.small ("O"_2) $
avec $Delta_f H^circle.small ("O"_2"(g)") = 0$ (corps simple dans son état standard de référence). On isole le glucose :
#resultat[$ Delta_f H^circle.small ("glucose") = 6 Delta_f H^circle.small ("CO"_2) + 6 Delta_f H^circle.small ("H"_2"O""(l)") - Delta_c H^circle.small $]
*Application numérique :* $6 times (-"393,5") + 6 times (-"285,8") - (-"2799,5") = -2361 - "1714,8" + "2799,5" = -1276 thin "kJ" dot "mol"^(-1) approx -"1,28" times 10^3 thin "kJ" dot "mol"^(-1)$.

#remarque[
  - Le résultat non arrondi de la Q4 est $-"2799,5"$ kJ/mol ; avec l'arrondi $-"2,80" times 10^3$ kJ/mol, on trouverait $-"1275,8"$ kJ/mol, soit le même résultat à l'arrondi près.
  - *Donnée corrigée :* l'énoncé d'origine (TD08) donnait $Delta_f H^circle.small ("CO"_2) = -"395,5"$ kJ/mol, ce qui est une coquille par rapport au cours ($-"393,5"$). Avec $-"395,5"$ on trouverait $approx -1288$ kJ/mol.
  - Le TD actuel donne $-1268$ kJ/mol pour $"C"_6"H"_12"O"_6"(l)"$ : même ordre de grandeur ($("s")$ ici, $("l")$ dans le TD ; la valeur tabulée du solide est à vérifier dans la table utilisée).
  - Pièges classiques : oublier que $xi$ se compte en moles *de glucose* ; écrire $Delta T$ en $°$C et $T$ en K de façon incohérente ; oublier le signe de $Delta_c H^circle.small$ (réaction exothermique, donc négatif, alors que la chaleur « libérée » $C Delta T$ est positive) ; oublier que $Delta_f H^circle.small ("O"_2) = 0$.
  - Approximation de la Q3 : en incluant $C_"produits" approx "1,6"$ J/K on trouverait $-2806$ kJ/mol, soit un écart de $"0,25" %$.
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  #rappel[(1) Établir les équations de d'Alembert en tension et en courant dans un câble coaxial sans perte caractérisé par une inductance et une capacité linéiques. (2) Étudier la réflexion en amplitude sur une impédance terminale fixée à l'extrémité d'un câble coaxial en fonction de son impédance caractéristique.]

  #etape("QdC 1 --- Équations de d'Alembert")
  *Modèle à constantes réparties sans perte :* une tranche de câble comprise entre $x$ et $x + d x$ est modélisée par une inductance $Lambda thin d x$ en série et une capacité $Gamma thin d x$ entre les deux conducteurs ($Lambda$ et $Gamma$ : inductance et capacité linéiques). On note $u(x,t)$ la tension et $i(x,t)$ le courant.

  *Loi des mailles* (aux bornes de l'inductance $Lambda d x$) :
  $ u(x,t) - u(x + d x, t) = Lambda thin d x thin frac(partial i, partial t) quad ==> quad - frac(partial u, partial x) = Lambda frac(partial i, partial t) quad (1) $
  *Loi des nœuds* (courant dans la capacité $Gamma d x$) :
  $ i(x,t) - i(x + d x, t) = Gamma thin d x thin frac(partial u, partial t) quad ==> quad - frac(partial i, partial x) = Gamma frac(partial u, partial t) quad (2) $
  *Élimination de $i$ :* on dérive (1) par rapport à $x$ et (2) par rapport à $t$ :
  $ - frac(partial^2 u, partial x^2) = Lambda frac(partial^2 i, partial x partial t), quad - frac(partial^2 i, partial t partial x) = Gamma frac(partial^2 u, partial t^2) $
  Le théorème de Schwarz ($partial^2 i \/ partial x partial t = partial^2 i \/ partial t partial x$) permet de substituer :
  #resultat[$ frac(partial^2 u, partial x^2) = Lambda Gamma frac(partial^2 u, partial t^2), quad "c'est-à-dire" quad frac(partial^2 u, partial t^2) = c^2 frac(partial^2 u, partial x^2) quad "avec" quad c = frac(1, sqrt(Lambda Gamma)) $]
  *Élimination de $u$ :* on dérive (2) par rapport à $x$ et (1) par rapport à $t$, puis Schwarz :
  $ - frac(partial^2 i, partial x^2) = Gamma frac(partial^2 u, partial x partial t), quad - frac(partial^2 u, partial t partial x) = Lambda frac(partial^2 i, partial t^2) quad ==> quad frac(partial^2 i, partial x^2) = Lambda Gamma frac(partial^2 i, partial t^2) $
  #resultat[$ frac(partial^2 i, partial t^2) = c^2 frac(partial^2 i, partial x^2) $]

  #etape("QdC 2 --- Réflexion sur une impédance terminale")
  *Rappel utile (impédance caractéristique).* Pour une onde progressive vers les $x$ croissants, $u = U e^(j(omega t - k x))$ avec $k = omega\/c$. L'équation (1) donne $j k u = j omega Lambda i$, donc :
  $ i = frac(k, omega Lambda) u = frac(u, Lambda c) = frac(u, Z_c) quad "avec" quad Z_c = Lambda c = sqrt(frac(Lambda, Gamma)) $
  Pour une onde vers les $x$ décroissants ($e^(j(omega t + k x))$) : $i = - u \/ Z_c$.

  *Configuration.* Câble occupant $x < 0$, fermé en $x = 0$ sur une impédance $underline(Z)_L$. Onde incidente d'amplitude complexe $U_i$ (vers $x > 0$) et onde réfléchie d'amplitude complexe $U_r$ (vers $x < 0$) :
  $ u(x,t) = (U_i e^(-j k x) + U_r e^(j k x)) e^(j omega t), quad i(x,t) = frac(1, Z_c) (U_i e^(-j k x) - U_r e^(j k x)) e^(j omega t) $
  *Condition à la limite :* en $x = 0$, loi d'Ohm de la charge, $u(0,t) = underline(Z)_L thin i(0,t)$ :
  $ U_i + U_r = frac(underline(Z)_L, Z_c) (U_i - U_r) $
  On isole $U_r$ :
  #resultat[$ r = frac(U_r, U_i) = frac(underline(Z)_L - Z_c, underline(Z)_L + Z_c) $]
  *Cas particuliers :*
  - $underline(Z)_L = 0$ (court-circuit) : $r = -1$, la tension s'annule en $x = 0$ (nœud de tension), le signal est réfléchi avec inversion ;
  - $underline(Z)_L arrow infinity$ (circuit ouvert) : $r = +1$, réflexion totale sans changement de signe (ventre de tension, nœud de courant) ;
  - $underline(Z)_L = R$ résistive : $r$ réel, $-1 < r < 1$ ; $r > 0$ si $R > Z_c$, $r < 0$ si $R < Z_c$ ;
  - $underline(Z)_L = Z_c$ : $r = 0$, adaptation d'impédance, aucune onde réfléchie.
]

#remarque[
  - Pour le courant, le coefficient de réflexion est $-r$ (à cause du signe $-$ dans $i$ pour l'onde réfléchie) : ne pas confondre avec celui de la tension.
  - Dans le résultat de la QdC 1, ne pas oublier de justifier l'usage de Schwarz (fonctions de classe $C^2$) ; c'est l'argument qui permet d'éliminer $i$.
]

= Poche réfrigérante --- corrigé

== Question 1

#rappel[Chaleur totale prélevée à l'environnement par la poche, une fois revenue à la température ambiante.]

*Loi :* pour une transformation chimique monobare et monotherme, $Q_p = Delta H approx xi thin Delta_r H^circle.small (T)$ (chaleur reçue par le système).

Ici, l'état initial (urée solide, eau, à $T_i$) et l'état final (urée dissoute, à $T_i$ après retour à l'équilibre thermique avec l'extérieur) sont à la même température et à la même pression. Comme $H$ est une fonction d'état, $Delta H$ ne dépend pas du chemin suivi (échauffement/refroidissement intermédiaire inclus) et la chaleur totale reçue par la poche est $Q_p = Delta H$.

La dissolution est totale et $nu_"urée" = -1$ : $xi = n_"urée" = m_"urée" \/ M_"urée"$. D'où :
#resultat[$ Q_p = xi thin Delta_r H^circle.small = frac(m_"urée", M_"urée") thin Delta_r H^circle.small $]
*Application numérique :* $xi = 20 \/ 60 = "0,333" thin "mol"$, donc $Q_p = "0,333" times "14,58" approx "4,9" thin "kJ"$.

$Q_p > 0$ : la poche *reçoit* de la chaleur, donc la prélève à l'environnement (la dissolution est endothermique).

== Question 2

#rappel[Température minimale atteinte juste après la dissolution ; préciser les hypothèses.]

*Hypothèses :* la dissolution est rapide (choc), donc on la modélise comme *adiabatique et monobare* ($Delta H = 0$) ; on néglige la capacité thermique de l'enveloppe de la poche ; $Delta_r H^circle.small$ est indépendant de $T$ (approximation d'Ellingham) ; les capacités thermiques molaires sont constantes, celle de l'urée dissoute étant prise égale à celle donnée (93 #jkm) ; la capacité du mélange est la somme de celles de ses constituants (mélange idéal).

*Chemin fictif :* (1) dissolution isotherme à $T_i$ : $Delta H_1 = xi Delta_r H^circle.small$ ; (2) échauffement isobare du mélange final (urée dissoute + eau) de $T_i$ à $T_f$ : $Delta H_2 = (n_"urée" C_"urée" + n_"eau" C_"eau")(T_f - T_i)$.
$ Delta H = Delta H_1 + Delta H_2 = 0 quad ==> quad T_f = T_i - frac(xi thin Delta_r H^circle.small, n_"urée" C_"urée" + n_"eau" C_"eau") $
*Application numérique :* $n_"eau" = 50 \/ 18 = "2,78" thin "mol"$, puis
$ n_"urée" C_"urée" + n_"eau" C_"eau" = "0,333" times 93 + "2,78" times "75,3" = "31,0" + "209,2" = "240,2" thin "J" dot "K"^(-1) $
$ Delta T = - frac("4,86" times 10^3, "240,2") approx -20 thin "K" $
#resultat[$ T_f approx 25 - 20 approx 5 thin degree"C" quad ("soit environ " 278 thin "K") $]
C'est un *minimum* : en pratique, les échanges avec l'extérieur réchauffent la poche pendant la dissolution.

#remarque[
  - Erreur classique : oublier l'eau dans la capacité thermique du mélange ; avec l'urée seule on trouverait $Delta T approx -157$ K, résultat manifestement absurde.
  - Les questions 1 et 2 utilisent deux modèles différents de la même transformation (états initial et final identiques à $T_i$ pour la chaleur totale ; transformation adiabatique pour la température minimale) : bien faire expliciter à l'élève lequel il utilise.
  - Le modèle de mélange idéal est discutable ici : 20 g d'urée dans 50 g d'eau représentent environ $"6,7"$ mol/kg, bien loin de la dilution infinie de l'état standard du soluté.
]

= Température de flamme --- corrigé

== Question 1

#rappel[Enthalpie standard de la réaction $4 "NH"_3"(g)" + 5 "O"_2"(g)" = 4 "NO""(g)" + 6 "H"_2"O""(g)"$ à 298 K.]

*Loi de Hess :* $Delta_r H^circle.small = sum_i nu_i Delta_f H_i^circle.small$ ($nu_i > 0$ produits, $nu_i < 0$ réactifs) :
$ Delta_r H^circle.small = 4 Delta_f H^circle.small ("NO") + 6 Delta_f H^circle.small ("H"_2"O""(g)") - 4 Delta_f H^circle.small ("NH"_3) - 5 Delta_f H^circle.small ("O"_2) $
avec $Delta_f H^circle.small ("O"_2) = 0$ (corps simple dans son état standard de référence).

*Application numérique :* $Delta_r H^circle.small = 4 times "90,3" + 6 times (-"241,8") - 4 times (-"46,1") = "361,2" - "1450,8" + "184,4"$
#resultat[$ Delta_r H^circle.small = -"905,2" thin "kJ" dot "mol"^(-1) $]
Réaction exothermique, par mole d'avancement de la réaction écrite avec ces nombres stœchiométriques (c'est-à-dire pour 4 mol de $"NH"_3$ consommées).

== Question 2

#rappel[8 mol de $"NH"_3$ et 50 mol d'air ($"O"_2$ : 20 %, $"N"_2$ : 80 %) à 298 K ; réaction totale : composition finale et avancement.]

*Quantités initiales :* $n_i("NH"_3) = 8$ mol ; $n_i("O"_2) = "0,20" times 50 = 10$ mol ; $n_i("N"_2) = "0,80" times 50 = 40$ mol.

*Tableau d'avancement* (quantités en mol) :
#align(center)[#table(
  columns: 6,
  stroke: 0.5pt,
  inset: 4pt,
  align: center,
  [], [$"NH"_3$], [$"O"_2$], [$"NO"$], [$"H"_2"O"$], [$"N"_2$],
  [initial], [8], [10], [0], [0], [40],
  [en cours], [$8 - 4 xi$], [$10 - 5 xi$], [$4 xi$], [$6 xi$], [40],
)]
*Avancement maximal :* $xi <= 8 \/ 4 = 2$ mol (pour $"NH"_3$) et $xi <= 10 \/ 5 = 2$ mol (pour $"O"_2$). Les deux réactifs sont limitants *simultanément* (mélange stœchiométrique) :
#resultat[$ xi_"max" = 2 thin "mol" $]
*Composition finale* (total : 60 mol) : $n_f("NH"_3) = 0$ ; $n_f("O"_2) = 0$ ; $n_f("NO") = 8$ mol ; $n_f("H"_2"O") = 12$ mol ; $n_f("N"_2) = 40$ mol (inerte).

== Question 3

#rappel[Réacteur monobare et adiabatique : température finale du système.]

*Loi :* transformation isenthalpique, $Delta H = 0$. Chemin fictif : (1) réaction totale à $T_i = 298$ K, $Delta H_1 = xi_"max" Delta_r H^circle.small (T_i)$ ; (2) échauffement isobare des constituants *finaux* (produits et inerte) de $T_i$ à $T_f$ :
$ Delta H = xi_"max" Delta_r H^circle.small (T_i) + (sum_i n_(f,i) C_(p,m,i)) (T_f - T_i) = 0 $
$ T_f = T_i - frac(xi_"max" Delta_r H^circle.small, sum_i n_(f,i) C_(p,m,i)) $
*Application numérique :*
$ sum_i n_(f,i) C_(p,m,i) = 8 times "27,2" + 12 times "34,3" + 40 times "27,2" = "217,6" + "411,6" + 1088 = 1717 thin "J" dot "K"^(-1) $
$ Delta T = frac(2 times "905,2" times 10^3, 1717) approx 1054 thin "K" $
#resultat[$ T_f = 298 + 1054 approx "1,35" times 10^3 thin "K" $]

#remarque[
  - Donnée corrigée : l'énoncé d'origine (TD08) donnait $Delta_f H^circle.small = -"285,8"$ kJ/mol dans la colonne $"H"_2"O""(g)"$, valeur de l'eau *liquide*. J'ai pris $-"241,8"$ kJ/mol (eau gazeuse, cours) ; avec $-"285,8"$ on trouverait $Delta_r H^circle.small = -"1169,2"$ kJ/mol, incompatible avec un produit gazeux. Les capacités fournies correspondent bien à de l'eau gazeuse.
  - Le $"N"_2$ inerte pèse pour 63 % de la capacité thermique totale : l'oublier dans $sum n C_p$ donne un résultat très surestimé.
  - $xi_"max"$ est le même pour les deux réactifs ici : cas particulier à faire remarquer à l'élève.
]

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  #rappel[Réaction d'avancement final $xi_e$ et d'enthalpie de réaction $Delta_r H^0$ dans un réacteur isobare isotherme : énergie dégagée par le système.]

  *Loi :* premier principe à pression constante, $Delta H = Q_p + W_"utile"$ avec $W_"utile" = 0$ (pas de travail autre que celui des forces de pression). Variation d'enthalpie due à la réaction (mélange idéal, état standard) :
  $ Delta H approx xi_e thin Delta_r H^0 $
  Donc la chaleur reçue par le système est $Q_p = Delta H approx xi_e Delta_r H^0$. L'énergie *dégagée* par le système est l'opposée :
  #resultat[$ Q_"dégagée" = - Q_p = - xi_e thin Delta_r H^0 $]
  (positive si la réaction est exothermique, $Delta_r H^0 < 0$ ; négative, c'est-à-dire en réalité énergie absorbée, si $Delta_r H^0 > 0$.)

  Le caractère isotherme signifie que $T_"final" = T_"initial" = T_"ext"$ : la chaleur est échangée avec le thermostat à mesure que la réaction avance.
]

#remarque[
  Le signe : $Q_p$ est « reçue par le système » (convention du cours), donc l'énergie « dégagée » est $-Q_p$. Faire préciser à l'élève la convention utilisée avant de conclure.
]

= Cuisson de pâtes à la bouteille de butane --- corrigé

*Stratégie.* Comparer l'énergie thermique disponible dans la bouteille $E_"dispo"$ à l'énergie nécessaire $E_"nécessaire"$ à la cuisson. Les hypothèses ci-dessous sont des *choix raisonnables de modélisation* ; d'autres valeurs, bien justifiées, sont tout aussi acceptables. Ce qui est évalué est la structure du raisonnement et la discussion des ordres de grandeur.

== Énergie disponible

*Loi :* $Q_p = Delta H = xi thin Delta_r H^circle.small$ ; pour la combustion totale du butane ($nu_"butane" = -1$), $xi = n_"butane"$, et l'énergie dégagée vaut $|Delta_r H^circle.small| thin n_"butane"$.

*Masse molaire :* $M("C"_4"H"_10) = 4 times 12 + 10 times 1 = 58$ g/mol.
$ n_"butane" = frac(m, M) = frac(13 times 10^3, 58) approx 224 thin "mol" $
#resultat[$ E_"dispo" = n_"butane" |Delta_r H^circle.small| = 224 times 2900 approx "6,5" times 10^5 thin "kJ" = 650 thin "MJ" $]

== Énergie nécessaire (hypothèses et calcul)

*Hypothèses de modélisation :*
- 100 g de pâtes par personne : 20 kg de pâtes pour 200 personnes ;
- 1 L d'eau pour 100 g de pâtes : $V = 200$ L, soit $m_"eau" = 200$ kg ($rho = 1$ kg/L) ;
- eau initialement à $theta_i = 15 thin degree"C"$, portée à $theta_f = 100 thin degree"C"$ : $Delta T = 85$ K ;
- la cuisson dure environ 10 min à ébullition, pendant lesquelles 5 % de l'eau s'évapore : $m_"vap" = 10$ kg ;
- capacité thermique des pâtes négligée (masse 10 fois plus faible que celle de l'eau) ;
- rendement du brûleur (casserole, pertes thermiques) $eta = 50 %$, donc seule la moitié de l'énergie dégagée est utile.

*Énergie pour chauffer l'eau* (capacité thermique massique constante, $c_p$ de l'énoncé) :
$ E_"chauffe" = m_"eau" thin c_p thin Delta T $
*Énergie pour vaporiser* (enthalpie massique de vaporisation de l'énoncé) :
$ E_"vap" = m_"vap" thin Delta_"vap" H^circle.small $
*Énergie nécessaire* en tenant compte du rendement :
$ E_"nécessaire" = frac(E_"chauffe" + E_"vap", eta) $
*Application numérique :* $E_"chauffe" = 200 times "4,18" times 85 = "7,1" times 10^4$ kJ ; $E_"vap" = 10 times 2265 = "2,3" times 10^4$ kJ ; $E_"chauffe" + E_"vap" approx "9,4" times 10^4$ kJ ; puis
#resultat[$ E_"nécessaire" = frac("9,4" times 10^4, "0,5") approx "1,9" times 10^5 thin "kJ" = 190 thin "MJ" $]

== Conclusion

$E_"dispo" approx 650$ MJ $>$ $E_"nécessaire" approx 190$ MJ, soit un facteur $approx "3,5"$ de marge : *oui*, la bouteille suffit.

*Robustesse :* la conclusion résiste à des variations raisonnables des hypothèses. Par exemple, avec $eta = 30 %$ : $E_"nécessaire" approx 310$ MJ $< 650$ MJ ; même en doublant la quantité d'eau et celle d'eau évaporée, $E_"nécessaire" approx 375$ MJ pour $eta = 50 %$, qui reste inférieure à $E_"dispo"$.

#remarque[
  - *Donnée corrigée :* la capacité thermique massique de l'eau était donnée en « kJ/mol » dans l'énoncé d'origine (TD08) ; c'est $"4,18"$ kJ$dot$kg$""^(-1)$$dot$K$""^(-1)$.
  - *Valeur à vérifier :* la donnée $Delta_r H^circle.small = -2900$ kJ/mol est annoncée pour la formation de $"H"_2"O""(g)"$. D'après $Delta_f H^circle.small ("butane") = -"125,6"$ kJ/mol (NIST), on trouve $approx -2877$ kJ/mol avec de l'eau *liquide* et $approx -2657$ kJ/mol avec de l'eau gazeuse : $-2900$ est cohérent avec l'eau liquide. Avec $-2657$ kJ/mol, $E_"dispo" approx 595$ MJ : la conclusion est inchangée (facteur $approx 3$).
  - Les valeurs 100 g par personne, 1 L pour 100 g, $theta_i = 15 thin degree"C"$, 5 % d'évaporation et $eta = 50 %$ sont mes choix de modélisation, non issus d'une source : à ajuster selon ton expérience.
  - Pièges classiques : oublier de passer les masses en moles ou les kJ en MJ ; oublier la vaporisation ; ne pas discuter les pertes thermiques ; conclure sans comparer clairement à l'énergie disponible.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  #rappel[Réacteur isobare et adiabatique, capacité thermique isobare $C_p$ du système après réaction : exprimer la variation de température.]

  *Loi :* réacteur monobare et adiabatique, donc $Delta H = Q_p + W_"utile" = 0$ : la transformation est isenthalpique.

  *Chemin fictif* ($H$ est une fonction d'état) : (1) la réaction a lieu à $T_i$ de façon isotherme, jusqu'à l'avancement $xi_e$ : $Delta H_1 = xi_e Delta_r H^0$ ; (2) le système après réaction est échauffé de $T_i$ à $T_f$ de façon isobare : $Delta H_2 = C_p (T_f - T_i)$ (avec $C_p$ constante sur l'intervalle).
  $ Delta H = Delta H_1 + Delta H_2 = xi_e Delta_r H^0 + C_p (T_f - T_i) = 0 $
  #resultat[$ Delta T = T_f - T_i = - frac(xi_e thin Delta_r H^0, C_p) $]
  Réaction exothermique ($Delta_r H^0 < 0$) : $Delta T > 0$, le système s'échauffe.
]

#remarque[
  $C_p$ est la capacité thermique du système *après* réaction (produits, réactif en excès et espèces inertes), pas celle des réactifs. On a supposé $Delta_r H^0$ indépendant de $T$ (approximation d'Ellingham).
]

= Chambre de combustion d'une turbine à gaz --- corrigé

*Notations.* $C_i$ désigne la capacité thermique molaire (constante) de l'espèce $i$, $h = -Delta_r H^circle.small > 0$, et $T_i = 700$ K.

== Question 1

#rappel[Calculer $Delta_r H^circle.small$ et commenter son signe. Pourquoi utiliser cette valeur à $T_i = 700$ K ?]

*Loi de Hess :* $Delta_r H^circle.small = sum_i nu_i Delta_f H_i^circle.small$ :
$ Delta_r H^circle.small = Delta_f H^circle.small ("CO"_2) + 2 Delta_f H^circle.small ("H"_2"O""(g)") - Delta_f H^circle.small ("CH"_4) - 2 Delta_f H^circle.small ("O"_2) $
avec $Delta_f H^circle.small ("O"_2) = 0$ (corps simple dans son état standard de référence).

*Application numérique :* $Delta_r H^circle.small = -"393,5" + 2 times (-"241,8") - (-"74,87")$
#resultat[$ Delta_r H^circle.small = -"802,2" thin "kJ" dot "mol"^(-1) $]
$Delta_r H^circle.small < 0$ : la réaction est *exothermique* (elle fournit de la chaleur au milieu).

*Choix de la valeur à 298 K :* d'après l'approximation d'Ellingham, $Delta_r H^circle.small (T)$ est indépendant de $T$ dans un domaine de température où aucun constituant ne change d'état ; ici tous les constituants restent gazeux. On peut donc utiliser la valeur de la table à 298 K pour $T_i = 700$ K, et plus généralement jusqu'à $T_f$.

== Question 2

#rappel[Exprimer $n_i("O"_2)$ et $n_i("N"_2)$ en fonction de $phi$ ; montrer que le réactif limitant dépend de $phi$ ; exprimer $xi_"max"(phi)$.]

*Proportions stœchiométriques :* d'après l'équation, $(n("CH"_4) \/ n("O"_2))_"stœchiométrique" = 1\/2$, donc :
$ phi = frac(n_i("CH"_4) \/ n_i("O"_2), 1\/2) = frac(2 n_i("CH"_4), n_i("O"_2)) $
Avec $n_i("CH"_4) = 1$ mol :
#resultat[$ n_i("O"_2) = frac(2, phi), quad n_i("N"_2) = 4 thin n_i("O"_2) = frac(8, phi) $]
(l'air contient 20 % de $"O"_2$ et 80 % de $"N"_2$, donc $n("N"_2) = 4 thin n("O"_2)$.)

*Tableau d'avancement* (quantités en mol) :
#align(center)[#table(
  columns: 6,
  stroke: 0.5pt,
  inset: 4pt,
  align: center,
  [], [$"CH"_4$], [$"O"_2$], [$"CO"_2$], [$"H"_2"O"$], [$"N"_2$],
  [initial], [1], [$2\/phi$], [0], [0], [$8\/phi$],
  [en cours], [$1 - xi$], [$2\/phi - 2 xi$], [$xi$], [$2 xi$], [$8\/phi$],
)]
*Avancement maximal :* $xi <= 1$ (le méthane est consommé) et $xi <= 1\/phi$ (le dioxygène est consommé). Donc $xi_"max" = min(1, 1\/phi)$ :
#resultat[$ phi <= 1 : thin xi_"max" = 1 quad ("méthane limitant") ; quad phi >= 1 : thin xi_"max" = frac(1, phi) quad ("dioxygène limitant") $]
Pour $phi < 1$ le mélange est *pauvre* (air en excès) ; pour $phi > 1$ il est *riche* (méthane en excès) ; $phi = 1$ est le cas stœchiométrique.

== Question 3

#rappel[Cas $phi <= 1$ : composition finale, puis $T_f$ en fonction de $phi$ ; montrer que $T_f - T_i$ ne dépend pas de $T_i$.]

*Composition finale* ($xi = 1$) : $n_f("CH"_4) = 0$ ; $n_f("O"_2) = 2\/phi - 2$ ; $n_f("CO"_2) = 1$ ; $n_f("H"_2"O") = 2$ ; $n_f("N"_2) = 8\/phi$.

*Loi :* $Delta H = 0$ avec le chemin fictif de la QdC :
$ Delta H = xi_"max" Delta_r H^circle.small + (sum_j n_(f,j) C_j) (T_f - T_i) = 0 quad ==> quad T_f = T_i + frac(xi_"max" h, sum_j n_(f,j) C_j) $
*Capacité thermique finale* (la somme comprend le dioxygène en excès et le diazote inerte) :
$ sum_j n_(f,j) C_j = C_("CO"_2) + 2 C_("H"_2"O") + (frac(2, phi) - 2) C_("O"_2) + frac(8, phi) C_("N"_2) = (C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2)) + frac(2 C_("O"_2) + 8 C_("N"_2), phi) $
*Température finale :*
#resultat[$ T_f = T_i + frac(h thin phi, (C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2)) thin phi + 2 C_("O"_2) + 8 C_("N"_2)) $]
*Indépendance vis-à-vis de $T_i$ :* $T_i$ n'apparaît que comme terme additif dans $T_f$ ; $h$ et les $C_j$ sont constants (Ellingham, capacités constantes), donc $T_f - T_i$ ne dépend pas de $T_i$ dans ce modèle.

*Application numérique :* $C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2) = "37,1" + "67,2" - "58,8" = "45,5"$ ; $2 C_("O"_2) + 8 C_("N"_2) = "58,8" + "232,8" = "291,6"$ (en #jkm) ; $h = "802,2" times 10^3$ J/mol :
$ T_f = 700 + frac("802,2" times 10^3 thin phi, "45,5" thin phi + "291,6") quad (phi <= 1) $

== Question 4

#rappel[Cas $phi >= 1$ : mêmes questions.]

*Composition finale* ($xi = 1\/phi$, dioxygène épuisé) : $n_f("CH"_4) = 1 - 1\/phi$ ; $n_f("O"_2) = 0$ ; $n_f("CO"_2) = 1\/phi$ ; $n_f("H"_2"O") = 2\/phi$ ; $n_f("N"_2) = 8\/phi$.

*Capacité thermique finale* (la somme comprend le méthane en excès, non brûlé) :
$ sum_j n_(f,j) C_j = (1 - frac(1, phi)) C_("CH"_4) + frac(1, phi) (C_("CO"_2) + 2 C_("H"_2"O")) + frac(8, phi) C_("N"_2) = C_("CH"_4) + frac(C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4), phi) $
*Température finale :* avec $xi_"max" = 1\/phi$, puis en multipliant haut et bas par $phi$ :
#resultat[$ T_f = T_i + frac(h, C_("CH"_4) thin phi + C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4)) $]
Là encore $T_f - T_i$ est indépendant de $T_i$.

*Application numérique :* $C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4) = "37,1" + "67,2" + "232,8" - "35,7" = "301,4"$ (en #jkm) :
$ T_f = 700 + frac("802,2" times 10^3, "35,7" thin phi + "301,4") quad (phi >= 1) $

== Question 5

#rappel[$T_f$ pour $phi = 1$ ; continuité en ce point ; allure de $T_f (phi)$ et position du maximum ; limites du modèle.]

*Continuité en $phi = 1$ :* le dénominateur de la Q3 vaut alors $C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2) + 2 C_("O"_2) + 8 C_("N"_2) = C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2)$, et celui de la Q4 vaut $C_("CH"_4) + C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4)$, la même expression (même composition finale pour $phi = 1$ : $"CO"_2$, $"H"_2"O"$, $"N"_2$ seulement).

*Application numérique :* $"37,1" + "67,2" + "232,8" = "337,1"$ #jkm, donc
#resultat[$ T_f (phi = 1) = 700 + frac("802,2" times 10^3, "337,1") approx 700 + 2380 approx "3,08" times 10^3 thin "K" $]

*Allure de $T_f (phi)$* (avec $Delta T = T_f - T_i$) :
- pour $phi < 1$ : $Delta T = h phi \/ (a phi + b)$ avec $a = "45,5"$ et $b = "291,6"$ ; sa dérivée $h b \/ (a phi + b)^2$ est positive, donc $T_f$ *croît* avec $phi$ (la chaleur dégagée par mole de méthane est la même, mais elle est répartie sur moins de gaz, car il y a moins d'air en excès) ; $T_f (0) = T_i$ ;
- pour $phi > 1$ : $Delta T = h \/ (c phi + d)$ avec $c = "35,7"$ et $d = "301,4"$ ; fonction *décroissante*, de limite $T_i$ quand $phi arrow infinity$ (le dioxygène limite, $xi_"max" = 1\/phi$ diminue : de moins en moins de méthane brûle).
- Le maximum est donc en $phi = 1$ (mélange stœchiométrique). Les pentes à gauche et à droite sont différentes : $dif T_f \/ dif phi = h b \/ (a + b)^2 approx +"2,06" times 10^3$ K à gauche, et $-h c \/ (c + d)^2 approx -"2,5" times 10^2$ K à droite : le maximum est un *point anguleux*, dû au changement de réactif limitant.

*Limites du modèle :* la valeur $approx 3080$ K est très élevée et surestimée. En réalité les capacités thermiques molaires augmentent avec $T$ (on les a prises constantes, égales à leurs valeurs à 298 K), et on a négligé les dissociations ($"CO"_2$, $"H"_2"O"$ à très haute température) ainsi que les autres réactions possibles (formation de $"CO"$, de $"NO"_x$, etc.).

== Question 6

#rappel[Aubes limitées à $T_"max" = 1500$ K : richesse maximale $phi_"max"$, quantité d'air par mole de méthane ; pourquoi la seconde solution pour $phi > 1$ est inacceptable ?]

*Condition :* $T_f <= T_"max"$, soit $Delta T <= Delta T_"max" = 1500 - 700 = 800$ K.

*Branche pauvre ($phi <= 1$) :* $h phi \/ (a phi + b) <= Delta T_"max"$, avec $a phi + b > 0$ :
$ h phi <= Delta T_"max" (a phi + b) quad ==> quad phi (h - a Delta T_"max") <= b Delta T_"max" $
Comme $h > a Delta T_"max"$ :
#resultat[$ phi_"max" = frac(b thin Delta T_"max", h - a thin Delta T_"max") $]
*Application numérique :* $phi_"max" = frac("291,6" times 800, "802,2" times 10^3 - "45,5" times 800) = frac("2,333" times 10^5, "7,658" times 10^5) approx "0,30"$

*Air à introduire par mole de méthane :* $n_"air" = n_i("O"_2) \/ "0,20" = (2 \/ phi) \/ "0,20" = 10 \/ phi$, soit pour $phi_"max"$ :
#resultat[$ n_"air" = frac(10, phi_"max") approx 33 thin "mol d'air par mol de méthane" $]
soit environ 3,3 fois la quantité d'air stœchiométrique (10 mol). Pour $phi <= phi_"max"$ on a $T_f <= T_"max"$ : il faut au moins cette quantité d'air.

*Branche riche ($phi >= 1$) :* $h \/ (c phi + d) <= Delta T_"max"$ donne $phi >= (h \/ Delta T_"max" - d) \/ c$ :
$ phi >= frac("802,2" times 10^3 \/ 800 - "301,4", "35,7") = frac("1002,8" - "301,4", "35,7") approx "19,6" $
*Pourquoi inacceptable :* pour $phi approx 20$, $xi_"max" = 1\/phi approx "0,05"$ mol : 95 % du méthane ne brûle pas. La température est basse uniquement parce que presque tout le combustible reste inutilisé, ce qui n'a aucun intérêt pour une turbine ; de plus, le modèle (combustion complète en $"CO"_2$ et $"H"_2"O"$ comme seule réaction) n'est plus crédible pour un mélange aussi riche.

#remarque[
  - *Pièges classiques :* inverser la définition de la richesse ($phi > 1$ est riche en *combustible*) ; oublier le dioxygène en excès ($phi < 1$) ou le méthane en excès ($phi > 1$) dans la capacité thermique finale ; oublier le diazote ; prendre $xi_"max" = 1$ pour $phi > 1$ ; prendre pour $C_p$ celle des réactifs au lieu de celle des produits.
  - La Q3 se résout aussi en écrivant directement $T_f$ avec $T_i$ au numérateur : bien faire expliciter pourquoi $T_f - T_i$ est indépendant de $T_i$ (conséquence des deux hypothèses de constance).
  - Bonne question de relance pour un élève rapide : comment le résultat changerait-il avec des capacités thermiques croissantes avec la température ?
  - Donnée ajoutée par rapport au TD : $C_(p,m)("CH"_4) = "35,7"$ #jkm (valeur de 298 K, NIST : $"35,69"$). Le TD actuel ne la donne pas ; elle n'est utile que pour la branche riche.
]
