#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 7 : 09/11/2026]
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

#let remarque(corps) = {
  block(width: 100%, inset: 7pt, stroke: 0.5pt, radius: 2pt, breakable: false)[
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

#let gm = $"g" dot "mol"^(-1)$
#let grad = $nabla$
#let divg = $nabla dot$

// ============================================================
// SUJET A --- CORRIGÉ
// ============================================================
#entete("A")

#qdc[
  #rappel[À partir du bilan local de conservation du nombre de particules, établir l'équation de diffusion de particules.]

  *Point de départ : bilan local de particules (cours).* Pour la densité volumique de particules $n(arrow(r), t)$ et le vecteur densité de courant de particules $arrow(j)_N$, en l'absence de création ou de destruction de particules :
  $ frac(partial n, partial t) + divg arrow(j)_N = 0 $
  (en une dimension : $partial n \/ partial t + partial j_N \/ partial x = 0$, obtenu par le bilan sur une tranche d'épaisseur $dif x$ entre $t$ et $t + dif t$ : $[n(x, t + dif t) - n(x, t)] S thin dif x = [j_N (x, t) - j_N (x + dif x, t)] S thin dif t$.)

  *Loi de Fick :* $arrow(j)_N = - D thin nabla n$ ($D$ : coefficient de diffusion, en m$""^2 dot$s$""^(-1)$). Le signe $-$ traduit un courant dirigé des zones concentrées vers les zones diluées.

  *Substitution dans le bilan* (en une dimension, $arrow(j)_N = j_N arrow(e)_x$, $j_N = - D thin partial n \/ partial x$) :
  $ frac(partial n, partial t) - frac(partial, partial x) (D frac(partial n, partial x)) = 0 $
  Avec $D$ uniforme et constant, on peut sortir $D$ de la dérivée :
  #resultat[$ frac(partial n, partial t) = D thin frac(partial^2 n, partial x^2) $]
  *Trois dimensions :* $partial n \/ partial t - divg (D nabla n) = 0$ et, avec $D$ constant et $divg (nabla n) = Delta n$ :
  #resultat[$ frac(partial n, partial t) = D thin Delta n quad "avec" quad Delta n = frac(partial^2 n, partial x^2) + frac(partial^2 n, partial y^2) + frac(partial^2 n, partial z^2) $]
]

#remarque[
  - Hypothèses à faire énoncer : $D$ *uniforme et constant* (sinon il reste $partial_x (D partial_x n)$) ; pas de source. Avec un terme source $sigma$ dans le bilan ($partial n \/ partial t + divg arrow(j)_N = sigma$), on obtient $partial n \/ partial t = D Delta n + sigma$.
  - Le bilan est une loi de conservation (exacte) ; la loi de Fick est une loi phénoménologique : c'est elle qui apporte l'irréversibilité.
  - Relance : *irréversibilité.* Le terme $partial n \/ partial t$ change de signe par $t arrow -t$, pas $D thin partial^2 n \/ partial x^2$ : l'équation n'est pas invariante par renversement du temps (contrairement à l'équation de d'Alembert).
  - Relance : analyse dimensionnelle, temps caractéristique de diffusion $tau tilde.op L^2 \/ D$.
]

= Ballon-sonde --- corrigé

*Notations.* $z$ : altitude (axe $O z$ vertical ascendant, $z = 0$ au sol) ; $V = 4 pi a^3 \/ 3$ : volume du ballon ; $m_"He"$ : masse d'hélium (constante, l'enveloppe est étanche et indéformable) ; $m_"tot" = m_0 + m_u + m_"He"$ : masse totale du système ballon + hélium + charge. Le rayon du ballon est noté $a$ pour ne pas le confondre avec la constante des gaz parfaits $R$.

*Données préliminaires (atmosphère isotherme, gaz parfait).* En statique, $dif P \/ dif z = - rho_"air" g$ avec $rho_"air" = M_"air" P \/ (R T_0)$ : on obtient (résultat de cours, cf. sujet D)
$ P(z) = P_0 thin e^(-z \/ H), quad rho_"air" (z) = rho_"air" (0) thin e^(-z \/ H), quad H = frac(R T_0, M_"air" g) $
Applications numériques (avec $R = "8,32"$ J$dot$K$""^(-1) dot$mol$""^(-1)$) :
$ H = frac("8,32" times 273, "0,029" times "9,8") approx "7,99" "km", quad rho_"air" (0) = frac(P_0 M_"air", R T_0) approx "1,28" "kg" dot "m"^(-3), quad rho_"He" (0) = frac(P_0 M_"He", R T_0) approx "0,176" "kg" dot "m"^(-3) $
$ V = frac(4 pi a^3, 3) approx "33,5" "m"^3, quad m_"He" = rho_"He" (0) V approx "5,9" "kg" $
Attention aux unités : $M$ en kg$dot$mol$""^(-1)$ dans les applications numériques.

== Question 1

#rappel[Forces subies par le ballon ; condition d'équilibre à l'altitude $z$.]

Le système $Sigma$ = {enveloppe + nacelle + charge + hélium}, de masse $m_"tot"$, est étudié dans le référentiel terrestre supposé galiléen. Il est soumis à :
- son *poids* $arrow(P) = - m_"tot" g thin arrow(e)_z$ ;
- la *poussée d'Archimède* de l'air $arrow(Pi) = + rho_"air" (z) V g thin arrow(e)_z$ (opposée au poids du fluide déplacé : l'air étant au repos, c'est la résultante des forces de pression sur la surface du ballon) ;
- les frottements de l'air, négligés par l'énoncé.

*Condition d'équilibre* à l'altitude $z$ (somme des forces nulle, projetée sur $O z$) :
#resultat[$ rho_"air" (z) thin V = m_0 + m_u + m_"He" = m_0 + m_u + rho_"He" (0) thin V $]
ou encore, avec la loi de l'atmosphère, $rho_"air" (0) thin e^(-z \/ H) V = m_0 + m_u + rho_"He" (0) V$.

La poussée *décroît* avec l'altitude alors que le poids est constant : si le ballon est trop léger il monte jusqu'à ce que la poussée compense le poids. Le volume du ballon étant fixé, c'est la raréfaction de l'air qui fixe l'altitude d'équilibre.

== Question 2

#rappel[Charge utile maximale pour atteindre $z_c = 4$ km.]

Si la charge est trop grande, l'altitude d'équilibre est inférieure à $z_c$. La charge maximale correspond à un équilibre exactement en $z = z_c$ :
$ m_(u,"max") = rho_"air" (0) V thin e^(-z_c \/ H) - m_0 - rho_"He" (0) V $
Application numérique : $rho_"air" (0) V approx "42,8" "kg"$ et $e^(-z_c \/ H) = e^(-"0,50") approx "0,606"$, donc $rho_"air" (z_c) V approx "25,9" "kg"$ :
#resultat[$ m_(u,"max") approx "25,9" - 10 - "5,9" approx 10 "kg" $]

#remarque[
  - *Piège classique :* oublier la masse d'hélium $m_"He" approx "5,9"$ kg (non négligeable !). On trouverait $approx 16$ kg au lieu de $approx 10$ kg. L'hélium est plus léger que l'air mais pas de masse nulle : le « ballon gonflé » pèse $m_0 + m_"He"$.
  - Autres pièges : utiliser $rho_"air" (0)$ au lieu de $rho_"air" (z_c)$ pour la poussée ; unités de $M$ (g$dot$mol$""^(-1)$ au lieu de kg$dot$mol$""^(-1)$) ; confondre le rayon $a$ et la constante $R$.
  - Le volume du ballon est supposé constant (enveloppe rigide) : un vrai ballon-sonde est déformable et grossit en montant, ce qui change la dépendance en $z$ de la poussée.
]

== Question 3

#rappel[Période des petites oscillations verticales autour de la position d'équilibre.]

*Équation du mouvement.* Le système est un solide en translation verticale ; on applique la deuxième loi de Newton (mécanique du point, avec la poussée d'Archimède comme force extérieure) projetée sur $O z$ :
$ m_"tot" thin dot.double(z) = - m_"tot" g + rho_"air" (z) thin V g $
*Position d'équilibre $z_e$ :* $rho_"air" (z_e) V = m_"tot"$ (question 1).

*Linéarisation.* On pose $z = z_e + zeta$ avec $zeta << H$ :
$ rho_"air" (z) = rho_"air" (z_e) thin e^(-zeta \/ H) approx rho_"air" (z_e) (1 - zeta / H) $
d'où
$ m_"tot" thin dot.double(zeta) = - m_"tot" g + rho_"air" (z_e) V g (1 - zeta / H) = - frac(rho_"air" (z_e) V g, H) zeta = - frac(m_"tot" g, H) zeta $
#resultat[$ dot.double(zeta) + frac(g, H) zeta = 0 quad "soit" quad omega_0 = sqrt(g / H), quad T = 2 pi sqrt(H / g) = 2 pi sqrt(frac(R T_0, M_"air" g^2)) $]
Application numérique : $omega_0 approx "0,035" "rad" dot "s"^(-1)$ et
#resultat[$ T approx 180 "s" approx 3 "min" $]
Le coefficient devant $zeta$ est positif : l'équilibre est *stable*.

#remarque[
  - La période *ne dépend ni de la charge utile, ni du volume du ballon* : la masse $m_"tot"$ se simplifie. Le coefficient de rappel $rho_"air" (z_e) V g \/ H$ est proportionnel à $m_"tot"$ car $rho_"air" (z_e) V = m_"tot"$ à l'équilibre.
  - *Hypothèses à faire discuter :* les frottements de l'air sont négligés (en réalité les oscillations sont amorties) ; le volume est constant ; l'atmosphère est isotherme ; $zeta << H$.
  - Remarque de ma part, à vérifier avant usage : un corps qui accélère dans un fluide entraîne aussi une partie du fluide (« masse ajoutée »). Pour une sphère dans un fluide parfait, elle vaut $rho_"air" V \/ 2$, ce qui multiplierait $T$ par $sqrt(1 + 1\/2) approx "1,22"$ (soit $approx 220$ s, car $rho_"air" (z_e) V = m_"tot"$). Hors programme : à ne pas évoquer aux élèves, sauf pour une relance avec un élève très à l'aise.
  - Piège : écrire la linéarisation autour de $z = 0$ au lieu de $z_e$, ou oublier que la poussée dépend de $z$ (alors on trouve une force de rappel nulle).
  - Relance (mécanique vs mécanique des fluides) : ici, on applique le principe fondamental de la dynamique à un solide ; la mécanique des fluides n'intervient que par la force de poussée (statique des fluides, fluide au repos).
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  #rappel[Établir la résistance électrique d'un conducteur ohmique cylindrique parcouru uniformément par un courant parallèle à son axe.]

  *Modèle.* Conducteur cylindrique d'axe $O x$, de longueur $L$, de section droite d'aire $S$, de conductivité $gamma$ uniforme. Le courant d'intensité $I$ entre par la section $x = 0$ et sort par la section $x = L$ ; la densité de courant est uniforme et parallèle à l'axe : $arrow(j) = j thin arrow(e)_x$.

  *Densité de courant :* $I = integral.double_S arrow(j) dot dif arrow(S) = j S$ donc $j = I \/ S$.

  *Champ électrique* (loi d'Ohm locale) : $arrow(E) = arrow(j) \/ gamma = I \/ (gamma S) thin arrow(e)_x$, uniforme.

  *Tension.* Avec $arrow(E) = - nabla V$, soit $E = - dif V \/ dif x$ :
  $ U = V(0) - V(L) = integral_0^L E thin dif x = E L = frac(I L, gamma S) $
  (le potentiel décroît linéairement dans le sens du courant : $V(x) = V(0) - E x$.)

  *Résistance :*
  #resultat[$ R = frac(U, I) = frac(L, gamma S) = rho_"r" frac(L, S) quad "avec" rho_"r" = 1 \/ gamma "la résistivité" $]
]

#remarque[
  - Hypothèses à faire énoncer : $gamma$ *uniforme*, régime *stationnaire* (ou lentement variable), courant *uniforme sur la section* (en pratique, vrai si les contacts sont répartis sur toute la section et si $L$ est grand devant les dimensions de la section : sinon effets de bord).
  - Convention : $U$ est orientée dans le sens *opposé* au courant ($U = V(0) - V(L) > 0$ si $I > 0$), c'est la convention récepteur pour un conducteur ohmique : $U = R I$.
  - Pièges : dimension (vérifier que $L \/ (gamma S)$ est bien en $Omega$ : $gamma$ en S$dot$m$""^(-1)$) ; oublier le signe $-$ de $arrow(E) = - nabla V$ ; confondre résistivité $rho_"r"$ et masse volumique.
  - Relance : $R$ augmente avec $L$ (résistances en série), diminue avec $S$ (résistances en parallèle). Lien avec Drude : $gamma = n e^2 tau \/ m_e$.
]

= Cloche hémisphérique retournée --- corrigé

*Énoncé de résolution de problème (ouvert) :* ce qui est attendu est avant tout une *démarche* : modéliser, lister les hypothèses, choisir l'outil (statique des fluides, bilan de forces sur la cloche), conduire le calcul et discuter le résultat.

*Notations.* Axe $O z$ vertical ascendant, origine $O$ au centre de la base de la cloche, sur la table. La cloche est la demi-sphère $r = R$, $z >= 0$. L'eau occupe la région $r < R$, $0 <= z <= h$, avec $h <= R$. $m$ : masse de la cloche ; $rho$ : masse volumique de l'eau.

*Hypothèses du modèle.* À faire énoncer (et justifier) par l'élève :
- fluides au repos (statique), référentiel galiléen, $g$ uniforme, eau incompressible ;
- coque *mince* et bord *mince* posé de façon étanche sur la table : aucune surface d'appui horizontale sur laquelle l'eau agirait par le dessous ;
- air à la pression $P_0$ à l'intérieur comme à l'extérieur ; l'air intérieur exerce donc sur la cloche la même pression que l'air extérieur, et ces actions se compensent (pas de compression de l'air emprisonné, remplissage instantané) ;
- tension superficielle et épaisseur de la coque négligées ; seule la masse totale $m$ intervient.

#align(center)[#image("Images/cloche.png", width: 50%)]
_(Schéma réservé au colleur : il n'est volontairement pas fourni aux élèves.)_

*Idée de la résolution.* La cloche se soulève si la résultante verticale des forces exercées par l'eau (poussée vers le haut) compense son poids. Seule la *surpression* de l'eau, par rapport à la pression atmosphérique extérieure, intervient.

== Résolution : calcul direct de la force sur la coque

*Champ de pression dans l'eau* (statique, $z$ ascendant, pression $P_0$ en $z = h$ à la surface libre) :
$ P(z) = P_0 + rho g (h - z) quad (0 <= z <= h) $
La coque est soumise, sur sa face externe, à la pression $P_0$ et, sur sa face interne mouillée ($z < h$), à $P(z)$. La force nette de pression sur un élément de surface mouillée $dif S$ vaut donc, orientée vers l'extérieur de la sphère ($arrow(e)_r$) :
$ dif arrow(F) = [P(z) - P_0] thin dif S thin arrow(e)_r = rho g (h - z) thin dif S thin arrow(e)_r $
*Projection verticale.* Sur la sphère, $arrow(e)_r dot arrow(e)_z = cos theta = z \/ R$ (avec $theta$ l'angle polaire). Les composantes horizontales s'annulent par symétrie de révolution. L'élément de surface compris entre les cotes $z$ et $z + dif z$ est une zone sphérique d'aire $dif S = 2 pi R thin dif z$ (propriété de la sphère : l'aire ne dépend que de la hauteur de la tranche). Donc
$ F_z = integral_0^h rho g (h - z) thin frac(z, R) thin 2 pi R thin dif z = 2 pi rho g integral_0^h (h z - z^2) dif z = 2 pi rho g (frac(h^3, 2) - frac(h^3, 3)) $
#resultat[$ F_z = frac(pi rho g h^3, 3) $]

*Condition de soulèvement.* La cloche décolle quand $F_z >= m g$ (la réaction de la table s'annule) :
#resultat[$ h >= h^* = (frac(3 m, pi rho))^(1 \/ 3) $]

== Variante : forces intérieure et extérieure calculées séparément (coordonnées sphériques)

Un élève peut ne pas passer directement par la surpression : il calcule la force de l'air extérieur, celle de l'air intérieur et celle de l'eau, puis fait la somme. Le calcul est plus long mais doit donner le même résultat ; il faut alors projeter proprement. La pression est *normale* à la coque : sur la face externe, la force sur un élément $dif S$ est $-P dif S thin arrow(e)_r$ ; sur la face interne, elle est $+P dif S thin arrow(e)_r$ (le fluide intérieur pousse la coque vers l'extérieur de la sphère).

*Repérage.* Coordonnées sphériques d'origine $O$, d'axe polaire $O z$ : $theta in [0, pi \/ 2]$ est l'angle polaire (mesuré depuis la verticale), $phi$ l'azimut. Un point de la coque est à la cote $z = R cos theta$. Sur la sphère $r = R$ :
$ arrow(e)_r = sin theta cos phi thin arrow(e)_x + sin theta sin phi thin arrow(e)_y + cos theta thin arrow(e)_z, quad dif S = R^2 sin theta thin dif theta thin dif phi $
*Composantes horizontales :* elles contiennent $integral_0^(2 pi) cos phi thin dif phi = integral_0^(2 pi) sin phi thin dif phi = 0$ : elles s'annulent quelle que soit la pression, tant que celle-ci ne dépend pas de $phi$ (ce qui est le cas : $P$ ne dépend que de $z$, donc de $theta$). Seule la composante selon $arrow(e)_z$, avec le facteur $cos theta$, subsiste. La surface libre de l'eau est à $z = h$, c'est-à-dire à l'angle $theta_h$ tel que $cos theta_h = h \/ R$ : l'air touche la coque pour $theta < theta_h$ et l'eau pour $theta_h < theta < pi \/ 2$.

*Air extérieur* (pression $P_0$ sur toute la face externe, $theta in [0, pi \/ 2]$) :
$ F_(z,"ext") = - integral_0^(2 pi) integral_0^(pi \/ 2) P_0 cos theta thin R^2 sin theta thin dif theta thin dif phi = - 2 pi R^2 P_0 [frac(sin^2 theta, 2)]_0^(pi \/ 2) = - pi R^2 P_0 $
(dirigée vers le bas, c'est $P_0$ fois l'aire de la base.)

*Air intérieur* (pression $P_0$, face interne, $theta in [0, theta_h]$) :
$ F_(z,"air") = + 2 pi R^2 P_0 [frac(sin^2 theta, 2)]_0^(theta_h) = pi R^2 P_0 sin^2 theta_h = pi P_0 (R^2 - h^2) $

*Eau* (face interne mouillée, $theta in [theta_h, pi \/ 2]$), avec $P = P_0 + rho g (h - z) = P_0 + rho g (h - R cos theta)$. On sépare les deux termes :
- terme en $P_0$ : $2 pi R^2 P_0 [sin^2 theta \/ 2]_(theta_h)^(pi \/ 2) = pi R^2 P_0 cos^2 theta_h = pi P_0 h^2$ ;
- terme hydrostatique : $display(2 pi R^2 rho g integral_(theta_h)^(pi \/ 2) (h - R cos theta) cos theta sin theta thin dif theta)$. On pose $u = cos theta$, donc $sin theta thin dif theta = - dif u$, avec $u$ qui va de $h \/ R$ (en $theta_h$) à $0$ (en $pi \/ 2$) :
$ 2 pi R^2 rho g integral_0^(h \/ R) (h - R u) u thin dif u = 2 pi R^2 rho g [frac(h u^2, 2) - frac(R u^3, 3)]_0^(h \/ R) = 2 pi R^2 rho g (frac(h^3, 2 R^2) - frac(h^3, 3 R^2)) = frac(pi rho g h^3, 3) $

*Somme.* Les termes en $P_0$ se compensent :
$ - pi R^2 P_0 + pi P_0 (R^2 - h^2) + pi P_0 h^2 = 0 $
et il reste $F_z = pi rho g h^3 \/ 3$ : le résultat obtenu directement avec la surpression. (Équivalence avec la méthode précédente : $dif S = R^2 sin theta thin dif theta thin dif phi$ intégré sur $phi$ donne $2 pi R^2 sin theta thin dif theta = 2 pi R thin dif z$ avec $z = R cos theta$.)

== Méthode alternative : bilan sur l'eau (vérification)

L'eau est en équilibre sous l'action de : son poids $rho g V_"eau"$ avec $V_"eau" = integral_0^h pi (R^2 - z^2) dif z = pi (R^2 h - h^3 \/ 3)$ ; la force de la table, $(P_0 + rho g h) pi R^2$ vers le haut sur la base (la pression en $z = 0$ est $P_0 + rho g h$) ; la force de la coque, $-F_z arrow(e)_z$ ; et la pression atmosphérique $P_0$ sur la frontière de l'eau, dont la résultante est nulle (surface fermée soumise à une pression uniforme). En ne gardant donc que les surpressions :
$ rho g h thin pi R^2 - rho g V_"eau" - F_z = 0 quad arrow.double quad F_z = rho g (pi R^2 h - V_"eau") = rho g pi frac(h^3, 3) $
On retrouve le même résultat. La force vers le haut sur la cloche vaut le poids du volume $pi h^3 \/ 3$, c'est-à-dire du volume « vide » situé entre le cylindre de rayon $R$ et de hauteur $h$ et le volume d'eau réel.

== Discussion

- *Domaine de validité.* La cloche ne peut se soulever que si $h^* <= R$ (on ne peut pas remplir au-delà de $h = R$). La condition $h^* <= R$ équivaut à $m <= pi rho R^3 \/ 3$, c'est-à-dire à $m$ inférieure à la *moitié* de la masse $2 pi rho R^3 \/ 3$ de l'eau qui remplirait entièrement la cloche. Si la cloche est plus lourde, elle ne se soulève jamais, quelle que soit la quantité d'eau.
- *Dépendance en $g$ :* $h^*$ ne dépend pas de $g$ (le poids de la cloche et la poussée de l'eau varient tous deux comme $g$).
- *Ordre de grandeur :* à titre d'exemple, une cloche de masse $m = 1$ kg et de rayon $R = 20$ cm : $h^* = (3 / (pi times 1000))^(1 \/ 3) approx "9,8" "cm"$, soit environ $R \/ 2$ (valeur indicative : l'énoncé n'impose pas de données numériques).
- *Interprétation.* Le résultat illustre que l'eau agit « vers le haut » sur la coque par sa face intérieure bombée : c'est un exemple de force de pression sur une surface courbe, qu'on ne peut pas ramener à un simple poids.

#remarque[
  - *Énoncé non fourni par le TD (reconstitué).* Ce sujet est un exercice de résolution de problème : les élèves peuvent légitimement préciser les hypothèses (cloche pleine ou partiellement remplie, épaisseur du bord, pression de l'air). Le résultat attendu est la loi $F_z = pi rho g h^3 \/ 3$ et le seuil $h^*$.
  - Pièges : mélanger *pression absolue* et *surpression* (la force de $P_0$ sur la cloche se compense) ; utiliser $z$ comme profondeur (la profondeur est $h - z$) ; oublier la projection verticale $cos theta = z \/ R$ ; croire que la force exercée sur la cloche est le poids de l'eau qu'elle contient $rho g V_"eau"$ : une partie de ce poids est reprise par la table.
  - *Ne pas utiliser la poussée d'Archimède* : la coque n'est pas entièrement immergée et l'eau est à l'intérieur, pas autour. Si un élève invoque Archimède, lui demander de préciser le volume immergé et la surface qui subit la pression extérieure.
  - Composantes horizontales : elles s'annulent par symétrie, mais on peut le faire vérifier explicitement par l'intégration sur $phi$.
  - Une fois la cloche soulevée, l'eau s'écoule sous le bord : le régime n'est plus statique. L'exercice ne porte que sur le seuil.
]

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  #rappel[Donner la relation fondamentale de la statique des fluides et l'établir en utilisant l'équivalent volumique des actions de pression $-nabla P$.]

  *Énoncé.* Pour un fluide au repos dans un référentiel galiléen, dans le champ de pesanteur uniforme $arrow(g)$, avec $rho$ la masse volumique et $P$ le champ de pression :
  #resultat[$ nabla P = rho thin arrow(g) $]
  Avec l'axe $O z$ vertical *ascendant* ($arrow(g) = - g thin arrow(e)_z$) : $dif P \/ dif z = - rho g$, et $P$ est uniforme dans un plan horizontal.

  *Établissement.* On isole une particule de fluide de volume $dif tau$, au repos. Elle est soumise à :
  - son poids : $dif arrow(F)_"p" = rho thin dif tau thin arrow(g)$ ;
  - la résultante des forces de pression exercées par le fluide environnant : on utilise son équivalent volumique, $dif arrow(F)_"pr" = - nabla P thin dif tau$ (résultat de cours, issu du calcul de la résultante des forces de pression sur un volume).

  L'équilibre dans un référentiel galiléen donne $dif arrow(F)_"p" + dif arrow(F)_"pr" = arrow(0)$, soit $rho thin dif tau thin arrow(g) - nabla P thin dif tau = arrow(0)$. En divisant par $dif tau$ :
  $ nabla P = rho thin arrow(g) $
  *Projection* sur $O z$ ascendant : $partial P \/ partial x = partial P \/ partial y = 0$ et $dif P \/ dif z = - rho g$.
]

#remarque[
  - Hypothèses à faire énoncer : fluide *au repos* (ou en mouvement uniforme) dans un référentiel *galiléen* ; seules forces : pesanteur et pression (pas de viscosité au repos) ; $g$ uniforme.
  - Pièges : signe selon l'orientation de $O z$ (avec $z$ descendant, $dif P \/ dif z = + rho g$) ; écrire $P = rho g z$ au lieu d'une relation différentielle ; oublier que $rho$ peut dépendre de $z$ (gaz).
  - Conséquences à citer en relance : liquide incompressible $arrow.double$ $P + rho g z = "cte"$ ; la pression est la même dans tout plan horizontal d'un fluide homogène au repos ; relation à relier avec le sujet D (atmosphère isotherme).
]

#qdc[
  #rappel[Donner, sans démonstration, l'équation de diffusion de particules et la loi de Fick, puis donner les dimensions des grandeurs qui interviennent.]

  *Loi de Fick :* $arrow(j)_N = - D thin nabla n$.

  *Équation de diffusion de particules* (sans source, $D$ uniforme) : $display(frac(partial n, partial t) = D thin Delta n)$ ; en une dimension, $partial n \/ partial t = D thin partial^2 n \/ partial x^2$.

  *Dimensions* ($L$ : longueur, $T$ : temps) :
  - $n$ : densité volumique de particules, $[n] = L^(-3)$ (unité : m$""^(-3)$) ;
  - $arrow(j)_N$ : nombre de particules traversant une surface par unité de surface et de temps, $[j_N] = L^(-2) T^(-1)$ (unité : m$""^(-2) dot$s$""^(-1)$) ;
  - $D$ : coefficient de diffusion, $[D] = L^2 T^(-1)$ (unité : m$""^2 dot$s$""^(-1)$), déduit de la loi de Fick : $[D] = [j_N] \/ ([n] \/ L) = L^(-2) T^(-1) \/ L^(-4) = L^2 T^(-1)$.

  *Vérification d'homogénéité* : $[partial n \/ partial t] = L^(-3) T^(-1)$ et $[D thin Delta n] = L^2 T^(-1) times L^(-2) times L^(-3) = L^(-3) T^(-1)$.
]

#remarque[
  - *Dimension ou unité ?* La « dimension » est la nature physique de la grandeur (longueur, temps…) ; l'« unité » est celle qu'on choisit dans le système SI. La question demande bien les *dimensions* : réponse en $L$, $T$ (on peut accepter l'unité SI en complément).
  - Avec un terme source volumique $sigma$ (particules créées par unité de volume et de temps) : $partial n \/ partial t = D thin Delta n + sigma$, avec $[sigma] = L^(-3) T^(-1)$.
  - Pièges : signe $-$ oublié dans la loi de Fick ; confondre $j_N$ (particules par m$""^2$ et par seconde) et le courant total (particules par seconde) ; confondre densité volumique $n$ et nombre total de particules $N$.
]

= Méthode des quatre pointes --- corrigé

*Notations.* Le conducteur occupe le demi-espace $z <= 0$ ; les pointes 1, 2, 3, 4 sont aux abscisses $0$, $a$, $2 a$, $3 a$ sur la surface $z = 0$. Le courant $I$ entre par la pointe 1 et ressort par la pointe 4. Le conducteur est ohmique : $arrow(j) = gamma arrow(E)$.

== Question 1

#rappel[Pointe unique en $O$, courant $I$ injecté dans le demi-espace $z <= 0$ : (a) justifier $arrow(j) = j(r) arrow(e)_r$ et déterminer $j(r)$ ; (b) $arrow(E)(r)$ puis $V(r)$ avec $V(infinity) = 0$.]

=== (a) Vecteur densité de courant

*Forme de $arrow(j)$ :* le contact est ponctuel et le matériau homogène et isotrope : aucune direction n'est privilégiée autour de $O$ (la surface $z = 0$ est isolante en dehors du contact : le courant ne peut pas en sortir, ce que respecte un champ radial, tangent à la surface). Le courant s'écoule donc radialement, avec une symétrie par rotation autour de $O$ : $arrow(j) = j(r) arrow(e)_r$, où $r$ est la distance à $O$.

*Loi :* en régime stationnaire, $divg arrow(j) = 0$, donc le flux de $arrow(j)$ est conservé à travers toute surface fermée ; en particulier, à travers toute demi-sphère $Sigma_r$ de rayon $r$ centrée en $O$ (dans le conducteur), le flux est égal à l'intensité injectée :
$ I = integral.double_(Sigma_r) arrow(j) dot dif arrow(S) = j(r) thin 2 pi r^2 $
(l'aire d'une *demi-sphère* est $2 pi r^2$, et non $4 pi r^2$, car le conducteur n'occupe que le demi-espace.)
#resultat[$ j(r) = frac(I, 2 pi r^2) $]

=== (b) Champ et potentiel

*Loi d'Ohm locale :* $arrow(E) = arrow(j) \/ gamma$ :
#resultat[$ arrow(E)(r) = frac(I, 2 pi gamma r^2) arrow(e)_r $]
*Potentiel :* $arrow(E) = - nabla V = - (dif V \/ dif r) arrow(e)_r$, donc $dif V \/ dif r = - I \/ (2 pi gamma r^2)$. On intègre :
$ V(r) = frac(I, 2 pi gamma r) + C $
La condition $V(infinity) = 0$ donne $C = 0$ :
#resultat[$ V(r) = frac(I, 2 pi gamma r) $]
Le potentiel est positif près de la pointe qui injecte le courant (le courant va des potentiels élevés vers les potentiels bas). Il diverge en $r arrow 0$ : c'est l'idéalisation du contact ponctuel.

== Question 2

#rappel[Superposition pour les quatre pointes ; calcul de $U$ ; expression de $gamma$.]

*Justification de la superposition :* dans le conducteur, $divg arrow(j) = 0$ et $arrow(E) = - nabla V$ avec $arrow(j) = gamma arrow(E)$ donnent $Delta V = 0$ (équation linéaire), avec des conditions aux limites linéaires (surface isolante sauf aux contacts). Le potentiel créé par plusieurs contacts est donc la somme des potentiels créés par chacun *seul*.

*Application :* la pointe 1 injecte $+I$, la pointe 4 injecte $-I$ (elle extrait $I$) ; les pointes 2 et 3 ne sont parcourues par aucun courant (voltmètre idéal) : elles ne perturbent pas le champ. En un point $M$ de la surface, à la distance $r_1$ de la pointe 1 et $r_4$ de la pointe 4 :
$ V(M) = frac(I, 2 pi gamma) (frac(1, r_1) - frac(1, r_4)) $

*Potentiel de la pointe 2* ($r_1 = a$, $r_4 = 2 a$) et *de la pointe 3* ($r_1 = 2 a$, $r_4 = a$) :
$ V_2 = frac(I, 2 pi gamma) (frac(1, a) - frac(1, 2 a)) = frac(I, 4 pi gamma a), quad V_3 = frac(I, 2 pi gamma) (frac(1, 2 a) - frac(1, a)) = - frac(I, 4 pi gamma a) $
*Différence de potentiel :*
#resultat[$ U = V_2 - V_3 = frac(I, 2 pi gamma a) $]
*Conductivité :*
#resultat[$ gamma = frac(I, 2 pi a thin U) $]
$gamma$ ne dépend que de grandeurs mesurables ($a$, $I$, $U$) : la mesure ne nécessite pas de connaître la forme exacte de l'échantillon (hypothèse : taille très grande devant $a$).

#remarque[
  - *Chevauchement avec le TD des élèves :* la Q1 est la même situation que l'électrocution de la vache (TD Transp 2 : $j = I \/ (2 pi r^2)$, $V = I \/ (2 pi gamma r)$). C'est donc la superposition qui est nouvelle ; prévoir une Q1 rapide.
  - Pièges : prendre $4 pi r^2$ au lieu de $2 pi r^2$ ; oublier le signe $-$ pour la pointe de sortie ; oublier la constante d'intégration ou l'annuler sans justifier ($V(infinity) = 0$) ; croire que les pointes 2 et 3 modifient le courant.
  - Relance (hors énoncé) : pourquoi quatre pointes et pas deux ? Avec deux pointes, la tension mesurée contient aussi la chute aux contacts (résistance de contact) et dans les fils ; avec quatre pointes, aucun courant ne traverse les pointes de mesure, donc leur résistance de contact ne crée aucune chute de tension.
  - Le signe de $U$ dépend de l'ordre ($V_2 - V_3$) : avec le courant entrant par la pointe 1, $U > 0$.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  #rappel[Établir l'expression du champ de pression de l'atmosphère isotherme dans le modèle du gaz parfait.]

  *Hypothèses.* Atmosphère au repos dans le référentiel terrestre (galiléen), de température uniforme $T_0$, champ de pesanteur uniforme $g$, air assimilé à un gaz parfait de masse molaire $M$. Axe $O z$ vertical ascendant, pression $P_0$ en $z = 0$.

  *Équilibre* (relation fondamentale de la statique des fluides, projetée sur $O z$) :
  $ frac(dif P, dif z) = - rho g $
  *Gaz parfait :* pour une masse $m$ de gaz occupant le volume $V$, $P V = (m \/ M) R T_0$, donc la masse volumique est
  $ rho = frac(m, V) = frac(M P, R T_0) $
  *Équation différentielle :* en reportant,
  $ frac(dif P, dif z) = - frac(M g, R T_0) thin P = - frac(P, H) quad "avec" quad H = frac(R T_0, M g) $
  *Intégration* (variables séparées, $T_0$ et $g$ constants) : $dif P \/ P = - dif z \/ H$, donc $ln P = - z \/ H + "cte"$. Avec $P(0) = P_0$ :
  #resultat[$ P(z) = P_0 thin exp(- frac(z, H)) quad "avec" quad H = frac(R T_0, M g) $]
  (ce qui donne aussi $rho(z) = rho(0) thin e^(-z \/ H)$.)
  *Ordre de grandeur :* $H approx 8$ km pour $T_0 = 273$ K, $M = 29$ #gm et $g = "9,8"$ m$dot$s$""^(-2)$ ; la pression est divisée par $e approx "2,7"$ tous les $8$ km.
]

#remarque[
  - Hypothèses à faire énoncer : *isotherme* (sinon $T(z)$ intervient dans l'intégration), $g$ uniforme, gaz parfait. Elles conduisent à une décroissance *exponentielle*, et non linéaire comme pour un liquide incompressible.
  - Notation : la hauteur caractéristique est notée $H$ dans le chapitre de cours mais $delta$ dans la démonstration (à vérifier dans les documents) ; accepter les deux si les élèves précisent la définition.
  - Pièges : signe $-$ de $dif P \/ dif z$ (axe ascendant) ; oublier que $rho$ dépend de $P$ (donc de $z$) et intégrer avec $rho$ constant ; unités de $M$ ($"kg" dot "mol"^(-1)$) ; ne pas citer $P(0) = P_0$ comme condition initiale.
  - Relance : pour $Delta z << H$ on retrouve localement $Delta P approx - rho g Delta z$, comme pour un fluide incompressible.
]

= Effet Hall --- corrigé

*Notations.* Plaque de largeur $L$ (selon $O y$, $0 <= y <= L$), d'épaisseur $h$ (selon $O z$), de longueur $ell$ (selon $O x$). Courant $arrow(j) = j thin arrow(e)_x$ avec $j = I \/ (h L)$ ; $arrow(B) = B thin arrow(e)_z$. Porteurs mobiles de charge $q$ (de signe quelconque), de densité volumique $n$.

*Rappel (force de Lorentz, vu en première année).* Une particule de charge $q$ et de vitesse $arrow(v)$ dans un champ électrique $arrow(E)$ et un champ magnétique $arrow(B)$ subit :
$ arrow(F) = q (arrow(E) + arrow(v) and arrow(B)) $
Avec la base orthonormée directe $(arrow(e)_x, arrow(e)_y, arrow(e)_z)$ : $arrow(e)_x and arrow(e)_z = - arrow(e)_y$.

== Question 1

#rappel[Vitesse moyenne $arrow(v)$ des porteurs en fonction de $arrow(j)$, $n$ et $q$.]

Les porteurs de charge $q$, en densité $n$, se déplacent à la vitesse moyenne $arrow(v)$ : le vecteur densité de courant s'écrit $arrow(j) = n q thin arrow(v)$. D'où
#resultat[$ arrow(v) = frac(arrow(j), n q) = frac(j, n q) thin arrow(e)_x $]
Si $q > 0$, $arrow(v)$ est dans le sens de $arrow(j)$ ; si $q < 0$ (électrons), $arrow(v)$ est de sens opposé.

== Question 2

#rappel[Bilan de forces et existence d'un champ électrique $arrow(E)_H$ perpendiculaire à $O x$.]

*Force magnétique sur un porteur :* $arrow(F)_"m" = q thin arrow(v) and arrow(B) = q thin frac(j, n q) B thin (arrow(e)_x and arrow(e)_z) = - frac(j B, n) thin arrow(e)_y$.
Cette force, *indépendante du signe de $q$* (le produit $q arrow(v) = arrow(j) \/ n$ ne dépend pas de $q$), dévie tous les porteurs vers les $y$ décroissants. Les faces latérales $y = 0$ et $y = L$ sont isolantes : les porteurs ne peuvent pas sortir ; ils s'accumulent sur la face $y = 0$, et une charge de signe opposé apparaît sur la face $y = L$. Ces charges créent un champ électrique transversal $arrow(E)_H = E_H thin arrow(e)_y$ qui s'oppose à la déviation.

*Régime permanent :* le courant est dirigé selon $O x$ uniquement ($j_y = 0$), donc la vitesse moyenne n'a pas de composante selon $O y$ : la force totale selon $O y$ est nulle. Soit, pour un porteur :
$ q E_H - frac(j B, n) = 0 $
#resultat[$ arrow(E)_H = frac(j B, n q) thin arrow(e)_y = frac(I B, n q thin h L) thin arrow(e)_y $]
(les composantes selon $O x$ et $O z$ de $arrow(E)_H$ sont nulles). Il s'ajoute au champ longitudinal $arrow(E)_0$, à l'origine du courant.

== Question 3

#rappel[Tension de Hall $V_H = V(A_1) - V(A_2)$, avec $A_1$ en $y = 0$ et $A_2$ en $y = L$ ; mise sous la forme $V_H = C_H I B \/ h$.]

Le champ $arrow(E)_H$ est uniforme et dérive d'un potentiel : $E_H = - dif V \/ dif y$. En intégrant de $A_1$ ($y = 0$) à $A_2$ ($y = L$) :
$ V(A_1) - V(A_2) = integral_0^L E_H thin dif y = E_H L = frac(j B L, n q) = frac(I B, n q thin h) $
où l'on a utilisé $j = I \/ (h L)$. D'où
#resultat[$ V_H = C_H thin frac(I B, h) quad "avec" quad C_H = frac(1, n q) $]
$C_H$ (constante de Hall) est en m$""^3 dot$C$""^(-1)$ ; son *signe est celui de $q$*.

== Question 4

#rappel[Information apportée par le signe de $V_H$.]

Pour un courant selon $+x$ et un champ selon $+z$, le signe de $V_H$ est le signe de $C_H$, donc de $q$ :
- $V_H > 0$ : les porteurs sont de charge positive (« trous » dans un semi-conducteur de type P) ;
- $V_H < 0$ : les porteurs sont de charge négative (électrons).

La mesure de l'effet Hall renseigne donc sur le *signe des porteurs* ; et, via $C_H = 1 \/ (n q)$, sur leur *densité* $n$ (si $q$ est connue).

#remarque[
  - *Point subtil :* la force magnétique $q thin arrow(v) and arrow(B)$ est la même pour les deux signes de $q$ (même $arrow(j)$), mais la charge qui s'accumule sur la face $y = 0$ est de signe opposé : c'est elle qui change le signe de $V_H$.
  - Pièges : confondre $arrow(v)$ et $arrow(j)$ (opposés si $q < 0$) ; oublier que $j_y = 0$ en régime permanent (les faces sont isolantes) ; erreur de signe dans $arrow(e)_x and arrow(e)_z$ ; oublier d'écrire explicitement l'orientation de $V_H$ (ici $V(A_1) - V(A_2)$).
]

== Question 5

#rappel[Calcul de $C_H$ pour les deux matériaux ; choix du matériau.]

*Conducteur métallique :* $C_H = 1 \/ (n q) = 1 \/ (7 dot 10^(28) times (-"1,6" dot 10^(-19))) approx -"8,9" dot 10^(-11)$ m$""^3 dot$C$""^(-1)$.

*Semi-conducteur de type P :* $C_H = 1 \/ (2 dot 10^(22) times "1,6" dot 10^(-19)) approx "3,1" dot 10^(-4)$ m$""^3 dot$C$""^(-1)$.

Pour $I$, $B$, $h$ donnés, $abs(V_H) = abs(C_H) I B \/ h$ est proportionnelle à $abs(C_H)$ : il faut un matériau de $n$ le plus *petit* possible. Le rapport des constantes est de l'ordre de $4 dot 10^6$ : on choisit le *semi-conducteur*.

== Question 6

#rappel[Calcul de $V_H$ pour $I = 1$ A, $B = "0,1"$ T, $h = 1$ mm ou $0,1$ mm, pour le matériau choisi.]

#resultat[$ V_H = C_H frac(I B, h): quad h = 1 "mm" arrow V_H approx "3,1" dot 10^(-4) times frac(1 times "0,1", 10^(-3)) approx "31" "mV", quad h = "0,1" "mm" arrow V_H approx "0,31" "V" $]
La tension de Hall est *inversement proportionnelle à l'épaisseur* : on préfère $h = "0,1"$ mm. (Inconvénient à évoquer : densité de courant plus élevée, donc échauffement, à intensité fixée.)

== Question 7

#rappel[Relation $arrow(j) = gamma (arrow(E) + C_H thin arrow(j) and arrow(B))$ ; allure de $arrow(j)$, $arrow(E)$ et des équipotentielles ; angle entre $arrow(j)$ et $arrow(E)$ pour $B = 1$ T.]

*Modèle de Drude avec champ magnétique.* Pour un porteur de masse $m_p$ et de vitesse moyenne $arrow(v)$, le principe fondamental de la dynamique s'écrit
$ m_p frac(dif arrow(v), dif t) = q (arrow(E) + arrow(v) and arrow(B)) - frac(m_p, tau) arrow(v) $
En régime permanent, $dif arrow(v) \/ dif t = arrow(0)$ : $arrow(v) = (q tau \/ m_p) (arrow(E) + arrow(v) and arrow(B))$. On multiplie par $n q$ et on utilise $arrow(j) = n q arrow(v)$, soit $arrow(v) = arrow(j) \/ (n q)$ :
$ arrow(j) = frac(n q^2 tau, m_p) (arrow(E) + frac(arrow(j), n q) and arrow(B)) $
En l'absence de $arrow(B)$ on doit retrouver la loi d'Ohm $arrow(j) = gamma arrow(E)$, ce qui identifie $gamma = n q^2 tau \/ m_p$. Avec $C_H = 1 \/ (n q)$ :
#resultat[$ arrow(j) = gamma (arrow(E) + C_H thin arrow(j) and arrow(B)) $]
*Étude pour la plaque.* On a $arrow(j) = j thin arrow(e)_x$ ; avec $arrow(B) = B thin arrow(e)_z$, $arrow(j) and arrow(B) = - j B thin arrow(e)_y$. Alors $arrow(E) = arrow(j) \/ gamma - C_H thin arrow(j) and arrow(B)$ :
$ arrow(E) = frac(j, gamma) thin arrow(e)_x + C_H j B thin arrow(e)_y $
On retrouve $E_y = C_H j B = E_H$ de la question 2 : $arrow(E)$ n'est *pas parallèle* à $arrow(j)$.

*Angle.* $theta$ est l'angle entre $arrow(E)$ et $arrow(j)$ :
#resultat[$ tan theta = frac(E_y, E_x) = gamma C_H B $]
(adimensionné : $gamma C_H$ a la dimension de l'inverse d'un champ magnétique ; à vérifier avec l'élève.) Pour le semi-conducteur et $B = 1$ T : $gamma C_H B = 3 dot 10^2 times "3,1" dot 10^(-4) times 1 approx "0,094"$, donc
#resultat[$ theta approx "5,4" degree $]
*Allure :* $arrow(j)$ est selon $O x$ ; $arrow(E)$ est incliné de $theta$ vers les $y$ croissants (ici $q > 0$) ; les équipotentielles, perpendiculaires à $arrow(E)$, sont inclinées de $theta$ par rapport à l'axe $O y$ : deux points de la plaque face à face (même $x$) n'ont donc pas le même potentiel. Pour comparaison, pour le métal, $tan theta = 6 dot 10^7 times (-"8,9" dot 10^(-11)) approx -"5,4" dot 10^(-3)$ donc $abs(theta) approx "0,3" degree$ : l'effet est très faible.

#remarque[
  - Cette question nécessite le *modèle de Drude* : l'énoncé précise la force de frottement fluide $-m_p arrow(v) \/ tau$, sinon les élèves ne peuvent pas la deviner. Faire détailler le passage de $arrow(v)$ à $arrow(j)$.
  - Le calcul de l'angle suppose $j_y = 0$ (faces latérales isolantes) : c'est ce qui impose $arrow(j) parallel arrow(e)_x$. Dans un conducteur illimité transversalement, ce serait $arrow(E)$ qui serait selon $O x$ et $arrow(j)$ qui tournerait.
  - Vérification de signe : pour $q > 0$, $C_H > 0$ donc $E_y > 0$ : cohérent avec $V_H > 0$ de la question 3.
  - Pièges : oublier le facteur $C_H$ (confondre $arrow(j) and arrow(B)$ avec $arrow(v) and arrow(B)$) ; erreur de signe dans $arrow(j) and arrow(B) = - j B arrow(e)_y$ ; angle en radians ou en degrés non précisé ; $B$ en gauss.
]
